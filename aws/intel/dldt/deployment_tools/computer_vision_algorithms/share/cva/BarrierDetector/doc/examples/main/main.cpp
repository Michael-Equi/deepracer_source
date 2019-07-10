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

#include <cva/ac/ocv/image_view.hpp>
#include <cva/barrier/barrier.hpp>

int main(int argc, char *argv[])
{
    // Parse the command line arguments using OpenCV.
    cv::CommandLineParser parser(argc, argv,
        "{ @image |        | image path}"
        "{ help h |        | print this message }"
        "{ impl   | cpu    | detector implementation to use }"
        "{ prec   | FP32   | precision of the model to use }"
        "{ show   | false  | show detected objects }");

    if (parser.has("help"))
    {
        parser.printMessage();
        return EXIT_SUCCESS;
    }

    auto impl = parser.get<cv::String>("impl");
    if (impl != "cpu" && impl != "gpu")
    {
        std::cerr << argv[0] << ": --impl must be either \"cpu\" or \"gpu\".\n";
        return EXIT_FAILURE;
    }

    auto prec = parser.get<cv::String>("prec");
    if (prec != "FP32" && prec != "FP16")
    {
        std::cerr << argv[0] << ": --prec must be either \"FP32\" or \"FP16\".\n";
        return EXIT_FAILURE;
    }

    auto precision = prec == "FP32" ? cva::ac::Precision::FP32 : cva::ac::Precision::FP16;

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

    auto detector = impl == "cpu" ? cva::barrier::BarrierDetector::createCpu() : cva::barrier::BarrierDetector::createGpu(precision);

    auto objects = detector->detect(cva::ac::ocv::toImageView(cva::ac::ImageFormat::BGR_8, image));

    struct LabelProperties {
        const char *description;
        cv::Scalar color;
    } const label_properties[] = {
        {"background",  {0, 255, 0}},
        {"vehicle",     {0, 255, 255}},
        {"plate",       {255, 0, 0}},
    };

    std::cout << "Objects: " << objects.size() << std::endl;

    for (std::size_t i = 0; i < objects.size(); ++i)
    {
        auto label = (int)objects[i]->label();
        auto class_description = label_properties[label].description;
        auto confidence = objects[i]->confidence();
        auto bbox = objects[i]->boundingBox();
        std::cout << i << ": " << confidence << " " << label << " " << class_description << " "
                  << bbox.startX() << " " << bbox.startY() << " " << bbox.endX() << " " << bbox.endY()
                  << std::endl;
    }


    auto show = parser.get<bool>("show");
    if (show)
    {
        for (std::size_t i = 0; i < objects.size(); ++i){
            auto confidence = objects[i]->confidence();
            if (confidence < 0.5f) continue;
            auto bbox = cv::Rect(objects[i]->boundingBox().startX(),
                                 objects[i]->boundingBox().startY(),
                                 objects[i]->boundingBox().endX() - objects[i]->boundingBox().startX(),
                                 objects[i]->boundingBox().endY() - objects[i]->boundingBox().startY());
            auto color = label_properties[(int)objects[i]->label()].color;
            cv::rectangle(image, bbox, color, 5, 8, 0);
        }

        cv::imwrite("result.jpeg", image);
    }


    return EXIT_SUCCESS;
}
