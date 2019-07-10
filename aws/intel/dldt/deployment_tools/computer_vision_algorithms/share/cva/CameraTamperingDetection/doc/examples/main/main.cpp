/*
    Copyright 2018 Intel Corporation.

    This software and the related documents are Intel copyrighted materials,
    and your use of them is governed by the express license under which they
    were provided to you (Intel Simplified Software License (Version April 2018))
    Unless the License provides otherwise, you may not use, modify,
    copy, publish, distribute, disclose or transmit this software or
    the related documents without Intel's prior written permission.

    This software and the related documents are provided as is, with no
    express or implied warranties, other than those that are expressly
    stated in the License.
*/

/*!
 * \file main.hpp
 * \brief Example of camera tampering detector usage.
 */

#include "cva/ctd/ctd.hpp"

#include <opencv2/core.hpp>
#include <opencv2/highgui.hpp>
#include <opencv2/imgproc.hpp>
#include <opencv2/videoio.hpp>
#include <iomanip>
#include <iostream>
#include <sstream>
#include <string>

const char* kWindowName     = "Camera tampering detection demo";
const int kEscapeKey        = 27;
const size_t kFramesForInit = 100;

const char* kAbout = "This is camera tampering detection example.\n";
const char* kOptions        =
    "{ h ? help usage |                   | print help message }"
    "{@video          |                   | input video (if not specified then use camera device with id 0) }"
    "{show-gui s      | false             | whether to show gui }"
    ;

void SetupParameters(cva::ctd::CameraTamperingDetector &ct_detector) {
  try {
    float occlusion_area_ratio_threshold_estimation =
        ct_detector.getParameterEstimation(cva::ctd::DetectorParameter::OCCLUSION_AREA_RATIO_THRESHOLD);
    float occlusion_area_ratio_threshold = 0.45f;
    occlusion_area_ratio_threshold = std::max(occlusion_area_ratio_threshold,
                                              occlusion_area_ratio_threshold_estimation);
    ct_detector.setFloatParameter(cva::ctd::DetectorParameter::OCCLUSION_AREA_RATIO_THRESHOLD,
                                  occlusion_area_ratio_threshold);

    float occlusion_area_ratio_without_motion_threshold_estimation =
        ct_detector.getParameterEstimation(cva::ctd::DetectorParameter::OCCLUSION_AREA_RATIO_WITHOUT_MOTION_THRESHOLD);
    float occlusion_area_ratio_without_motion_threshold = 0.3f;
    occlusion_area_ratio_without_motion_threshold = std::max(occlusion_area_ratio_without_motion_threshold,
                                                             occlusion_area_ratio_without_motion_threshold_estimation);
    ct_detector.setFloatParameter(cva::ctd::DetectorParameter::OCCLUSION_AREA_RATIO_WITHOUT_MOTION_THRESHOLD,
                                  occlusion_area_ratio_without_motion_threshold);

    float defocus_ratio_threshold_estimation =
        ct_detector.getParameterEstimation(cva::ctd::DetectorParameter::DEFOCUS_RATIO_THRESHOLD);
    float defocus_ratio_threshold = 0.5f;
    defocus_ratio_threshold = std::min(defocus_ratio_threshold, defocus_ratio_threshold_estimation);
    ct_detector.setFloatParameter(cva::ctd::DetectorParameter::DEFOCUS_RATIO_THRESHOLD,
                                  defocus_ratio_threshold);

    float displacement_ratio_threshold_estimation =
        ct_detector.getParameterEstimation(cva::ctd::DetectorParameter::DISPLACEMENT_RATIO_THRESHOLD);
    float displacement_ratio_threshold = 0.5f;
    displacement_ratio_threshold = std::max(displacement_ratio_threshold, displacement_ratio_threshold_estimation);
    ct_detector.setFloatParameter(cva::ctd::DetectorParameter::DISPLACEMENT_RATIO_THRESHOLD,
                                  displacement_ratio_threshold);
  } catch (cv::Exception) {
    std::cerr << "Something wrong with parameters configuration!" << std::endl;
    exit(-1);
  }
}

int main(int argc, const char** argv) {
  cv::CommandLineParser parser(argc, argv, kOptions);
  parser.about(kAbout);

  if (parser.has("help")) {
    parser.printMessage();
    return 0;
  }

  cv::String video_path = parser.get<cv::String>("@video");
  if (!parser.check()) {
    parser.printErrors();
    return -1;
  }

  cv::VideoCapture capture;
  if (video_path.empty()) {
    capture.open(0);
    if (!capture.isOpened()) {
      std::cout << "Failed to open camera device" << std::endl;
      return -1;
    }
  } else {
    capture.open(video_path);

    if (!capture.isOpened()) {
      std::cout << "Failed to open video: " << video_path << std::endl;
      return -1;
    }
  }

  bool use_gui = parser.get<bool>("show-gui");

  if (use_gui) {
    cv::namedWindow(kWindowName, cv::WINDOW_AUTOSIZE);
    cv::moveWindow(kWindowName, 0, 0);
  }

  // Create camera tampering detector
  auto ct_detector = cva::ctd::CameraTamperingDetector::create();

  cv::Mat frame;
  capture >> frame;
  size_t frame_idx = 0;
  bool is_tampering = false;

  while (!frame.empty()) {
    cva::ctd::TamperingType tampering_type = ct_detector->process(frame);
    std::string state;

    if (frame_idx < kFramesForInit) {  // Collect data for parameters esimation
      state = "Waiting";
    } else if (frame_idx == kFramesForInit) {  // Estimate and setup parameters
      state = "Updating parameters";
      SetupParameters(*ct_detector);
    } else {  // Process camera tampering events
      switch (tampering_type) {
        case cva::ctd::TAMPERING_INITIALIZING: {
          state = "INITIALIZING";
          break;
        }
        case cva::ctd::TAMPERING_NONE: {
          state = "OK";
          if (is_tampering) {  // Reset after Tampering event (Occlusion or Defocus only)
            is_tampering = false;
            ct_detector->reset();
            frame_idx = 0;
          }
          break;
        }
        default: {
          is_tampering = true;
          if (tampering_type & cva::ctd::TAMPERING_DEFOCUS)
            state += "|DEFOCUS|";
          if (tampering_type & cva::ctd::TAMPERING_OCCLUSION)
            state += "|OCCLUSION|";
          if (tampering_type & cva::ctd::TAMPERING_DISPLACEMENT)
            state += "|DISPLACEMENT|";
        }
      };
    }

    const int         font_face          = cv::FONT_HERSHEY_COMPLEX;
    const double      font_scale         = 1.;
    const int         font_thickness     = 2;
    const cv::Scalar  foreground_color   = cv::Scalar(0, 0, 255);
    cv::putText(frame, state, cv::Point(10, 30), font_face, font_scale, foreground_color, font_thickness);

    if (use_gui) {
      cv::imshow(kWindowName, frame);

      int key = cv::waitKey(10) & 0x00FF;
      if (key == kEscapeKey) {
        break;
      }
    } else {
      std::stringstream ss;
      ss << std::setw(6) << std::setfill('0') << frame_idx;
      cv::imwrite(ss.str() + ".png", frame);
    }

    capture >> frame;
    ++frame_idx;
  }

  return 0;
}
