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

#include "cva/fd/fd.hpp"
#include <iostream>
#include <opencv2/core/core.hpp>
#include <opencv2/core/utility.hpp>
#include <opencv2/highgui/highgui.hpp>
#include <opencv2/imgproc/imgproc.hpp>
#include <type_traits>
#include <utility>

using namespace std;

int main(int argc, char* argv[])
{
    const cv::String callOptions = "{help h usage ? |       | print this message                 }"
                                   "{image i        |       | path to the image to find faces on }"
                                   "{model m        |       | path to the model file             }"
                                   "{weights w      |       | path to the weights file           }"
                                   "{show-gui s     | false | whether to show gui                }"
                                   ;

    cv::CommandLineParser argumentParser(argc, argv, callOptions);
    argumentParser.about("Face detection demo application");

    if (argumentParser.has("help"))
    {
        argumentParser.printMessage();
        return 0;
    }

    string image_path = argumentParser.get<string>("image");
    cout << "Reading image '" << image_path << "'" << endl;
    cv::Mat image = cv::imread(image_path);
    if (image.empty())
    {
        cout << "Cannot read the image" << endl;
        exit(1);
    }

    std::string modelPath;
    std::string weightsPath;
    if (! argumentParser.has("model"))
    {
        std::cout << "Error: command line parameter '--model' is required" << std::endl;
        exit(1);
    }
    modelPath = argumentParser.get<string>("model");

    if (! argumentParser.has("weights"))
    {
        std::cout << "Error: command line parameter '--weights' is required" << std::endl;
        exit(1);
    }
    weightsPath = argumentParser.get<string>("weights");

    auto detector = cva::fd::FaceDetector::create(modelPath, weightsPath);
    if (!detector)
    {
        cout << "Cannot create detector" << endl;
        exit(1);
    }

    auto result_faces = detector->process(image);

    cv::Scalar green_color(0, 255, 0);
    for (const auto& face : result_faces)
    {
        cv::Rect r = face->boundingBox();
        cv::rectangle(image, r, green_color);
    }
    if (argumentParser.get<bool>("show-gui"))
    {
        cv::imshow("Face Detection Example", image);
        char key = 0;
        const char ESC_KEY = 27;
        while (key != ESC_KEY)
        {
            key = cv::waitKey();
        }
    }
    else
    {
        cv::imwrite("face_detection_example.png", image);
    }

    return 0;
}
