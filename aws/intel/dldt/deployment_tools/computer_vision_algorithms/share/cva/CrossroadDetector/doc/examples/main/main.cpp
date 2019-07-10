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

#include <cstdlib>
#include <iostream>
#include <numeric>
#include <iomanip>
#include <cmath>

#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc.hpp>

#include <cva/ac/geometry.hpp>
#include <cva/ac/ocv/image_view.hpp>
#include <cva/crd/crd.hpp>

int main(int argc, char *argv[])
{
    // Parse the command line arguments using OpenCV.
    cv::CommandLineParser parser(argc, argv,
        "{ @image         |        | image path}"
        "{ help h         |        | print this message }"
        "{ impl           | CPU    | detector implementation to use, possible values are CPU, GPUFP32 or GPUFP16 }"
        "{ confidence_thr | 0.5    | confidence value to filter detected objects  }"
        "{ show           | false  | show detected objects }");

    if (parser.has("help"))
    {
        parser.printMessage();
        return EXIT_SUCCESS;
    }

    auto impl = parser.get<cv::String>("impl");
    if (impl != "CPU" && impl != "GPUFP32" && impl != "GPUFP16")
    {
        std::cerr << argv[0] << ": --impl must be either \"CPU\", \"GPUFP32\" or \"GPUFP16\".\n";
        return EXIT_FAILURE;
    }

    if (!parser.check())
    {
        parser.printErrors();
        return EXIT_FAILURE;
    }

    auto image_path = parser.get<cv::String>("@image");
    cv::Mat image = cv::imread(image_path);
    if (image.empty())
    {
        std::cerr << "failed to read image: " << image_path << std::endl;
        return EXIT_FAILURE;
    }

    auto confidence_thr = parser.get<float>("confidence_thr");
    if (confidence_thr <= 0 || confidence_thr >= 1)
    {
        std::cerr << "confidence threshold value must be greater than 0 and less than 1" << std::endl;
        return EXIT_FAILURE;
    }

    auto detector = impl == "CPU"     ? cva::crd::CrossroadDetector::createCpu() :
                    impl == "GPUFP32" ? cva::crd::CrossroadDetector::createGpu(cva::ac::Precision::FP32) :
                                        cva::crd::CrossroadDetector::createGpu(cva::ac::Precision::FP16);

    auto objects = detector->detect(cva::ac::ocv::toImageView(cva::ac::ImageFormat::BGR_8, image));

    struct LabelProperties {
        const char *description;
        cv::Scalar color;
    } const label_properties[] = {
        {"background",  {0, 255, 0}},
        {"person",      {255, 255, 0}},
        {"vehicle",     {0, 255, 255}},
        {"non-vehicle", {255, 0, 0}},
    };

    objects.erase(std::remove_if(objects.begin(), objects.end(),
                                [confidence_thr](std::unique_ptr<cva::crd::DetectedObject> const& obj)
                                {
                                   return obj->confidence() < confidence_thr;
                                }),
                  objects.end());

    std::cout << "Objects: " << objects.size() << std::endl;

    for (std::size_t i = 0; i < objects.size(); ++i)
    {
        auto label = unsigned(objects[i]->label());
        auto confidence = objects[i]->confidence();
        auto bbox = objects[i]->boundingBox();
        std::cout << i << ": " << confidence << " " << label << " "
                  << label_properties[label].description << " "
                  << bbox.startX() << " " << bbox.startY() << " " << bbox.endX() << " " << bbox.endY()
                  << std::endl;
    }


    auto show = parser.get<bool>("show");
    if (show)
    {
        for (std::size_t i = 0; i < objects.size(); ++i){
            auto bbox = cv::Rect(objects[i]->boundingBox().startX(),
                                 objects[i]->boundingBox().startY(),
                                 objects[i]->boundingBox().endX() - objects[i]->boundingBox().startX(),
                                 objects[i]->boundingBox().endY() - objects[i]->boundingBox().startY());
            auto color = label_properties[unsigned(objects[i]->label())].color;
            cv::rectangle(image, bbox, color, 5, 8, 0);
        }
        cv::imwrite("result.jpeg", image);
    }


    return EXIT_SUCCESS;
}
