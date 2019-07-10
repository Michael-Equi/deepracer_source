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

#include <string>
#include <iostream>
#include <fstream>
#include <sstream>
#include <memory>

#include <cva/lpr/lpr.hpp>


int main(int argc, char** argv)
{
    const std::string keys =
            "{h help usage ?   |     | print this message       }"
            "{i image          |     | path to image            }"
            "{w weights        |     | weights file             }"
            "{m model          |     | model file               }"
            "{d dict           |     | dictionary               }"
            "{b backend        | CPU | CPU or GPU               }";

    cv::CommandLineParser parser(argc, argv, keys.c_str());
    bool need_help = parser.get<bool>("help");
    if (need_help)
    {
        parser.printMessage();
        return 0;
    }

    std::string path_to_image = parser.get<std::string>("image");
    if (path_to_image.empty())
    {
        std::cout << "ERROR: Specify image!" << std::endl;
        parser.printMessage();
        return -1;
    }

    cv::Mat input_image;
    try
    {
        input_image = cv::imread(path_to_image);
        cv::cvtColor(input_image, input_image, cv::COLOR_BGR2RGB);

    }
    catch (cv::Exception&)
    {
        std::cout << "Could not read the image: "<< path_to_image << std::endl;
        return -1;
    }

    std::string weights_file = parser.get<std::string>("weights");
    if (weights_file.empty())
    {
        std::cout << "Specify path to weights file!" << std::endl;
        parser.printMessage();
        return -1;
    }

    std::string model_file =  parser.get<std::string>("model");
    if (model_file.empty())
    {
        std::cout << "Specify path to model file" << std::endl;
        parser.printMessage();
        return -1;
    }

    std::string dict_file = parser.get<std::string>("dict");
    if (dict_file.empty())
    {
        std::cout << "Specify path to dictionary file" << std::endl;
        parser.printMessage();
        return -1;
    }

    std::string backend = parser.get<std::string>("backend");
    if ("CPU" != backend && "GPU" != backend)
    {
        std::cout << "Possible options for backend are CPU or GPU" << std::endl;
        parser.printMessage();
        return -1;
    }

    std::unique_ptr<cva::lpr::LicensePlateDecoder> decoder;
    try
    {
        decoder = cva::lpr::LicensePlateDecoder::create(
            model_file, weights_file, dict_file, "CPU" == backend ? cva::lpr::BackendType::CPU : cva::lpr::BackendType::GPU);
    }
    catch (std::exception& e)
    {
        std::cout << "Exception caught: Could not create decoder (" << e.what() << ")" << std::endl;
        return -1;
    }

    std::string label;
    try
    {
        label = decoder->decode(input_image);
    }
    catch (std::exception& e)
    {
        std::cout << "Exception caught: Could not decode license plate (" << e.what() << ")" << std::endl;
        return -1;
    }

    std::cout << "Decoded plate: " << label << std::endl;
    return 0;
}
