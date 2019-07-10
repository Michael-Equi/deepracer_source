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

#include <opencv2/imgproc/imgproc.hpp>
#include <opencv2/core/core.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <iostream>
#include <string>
#include <iomanip>
#include <map>
#include "cva/agr/agr.hpp"


#if defined (_WIN32) || defined(WIN32)
#define PATH_SEPARATOR "\\"
#else
#define PATH_SEPARATOR "/"
#endif


int main(int argc, char** argv)
{
    const cv::String keys =
        "{help h usage ? |       | print this message             }"
        "{image i        |       | input image                    }"
        "{model m        |       | path to the model file         }"
        "{weights w      |       | path to the weights file       }"
        "{backend b      | CPU   | preferred backend (VPU/CPU/GPU)}"
        ;

    cv::CommandLineParser parser(argc, argv, keys.c_str());

    if ( parser.has("help") )
    {
        parser.printMessage();
        return EXIT_SUCCESS;
    }

    if ( (!parser.has("image")) || (!parser.has("model")) || (!parser.has("weights")) )
    {
        parser.printMessage();
        return EXIT_FAILURE;
    }

    std::string model_path = parser.get<std::string>("model");
    std::string weights_path = parser.get<std::string>("weights");

    cva::agr::FaceAnalyzer::Parameters dldt_params;
    dldt_params.model_path   = model_path;
    dldt_params.weights_path = weights_path;

    static const std::map<std::string, cva::agr::BackendType> availableBackends =
    {
        {"CPU", cva::agr::BackendType::CPU},
        {"GPU", cva::agr::BackendType::GPU},
        {"VPU", cva::agr::BackendType::VPU},
    };

    std::string dldt_backend = parser.get<std::string>("backend");
    auto iter = availableBackends.find(dldt_backend);
    if (iter == availableBackends.end())
    {
        std::cout << "DLDT backend not found: " << dldt_backend << std::endl;
        return EXIT_FAILURE;
    }
    dldt_params.backend = iter->second;

    auto decoder = cva::agr::FaceAnalyzer::create(dldt_params);
    if (!decoder)
    {
        std::cout << "Cannot create decoder" << std::endl;
        return EXIT_FAILURE;
    }

    std::string image_path = parser.get<std::string>("image");
    cv::Mat input_image = cv::imread(image_path);
    if (input_image.empty())
    {
        std::cerr << "Coudn't read " << image_path << std::endl;
        return EXIT_FAILURE;
    }

    std::vector<cv::Mat> imgs(1, input_image);

    std::vector<cva::agr::FaceAnalyzer::FaceAttributes> face_attrs;
    decoder->process(imgs, face_attrs);

    std::string gender_string = "Unknown";
    if (face_attrs.at(0).gender == cva::agr::Gender::MALE)
    {
        gender_string = "Male";
    }
    else if (face_attrs.at(0).gender == cva::agr::Gender::FEMALE)
    {
        gender_string = "Female";
    }

    std::cout << std::setw(10) << "Image: "  << image_path           << std::endl;
    std::cout << std::setw(10) << "Age: "    << face_attrs.at(0).age << std::endl;
    std::cout << std::setw(10) << "Gender: " << gender_string        << std::endl;

    return EXIT_SUCCESS;
}
