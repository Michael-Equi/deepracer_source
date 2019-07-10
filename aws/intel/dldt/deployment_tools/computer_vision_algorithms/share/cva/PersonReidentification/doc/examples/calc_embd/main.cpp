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

#include <algorithm>
#include <cstdlib>
#include <exception>
#include <iomanip>
#include <iostream>
#include <numeric>
#include <utility>
#include <vector>

#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>

#include <cva/ac/ocv/image_view.hpp>
#include <cva/reid/reid.hpp>


namespace ac = cva::ac;

int main(int argc, char *argv[])
try
{
    // Parse the command line arguments using OpenCV.

    cv::CommandLineParser parser(argc, argv,
        "{ @image |        | image }"
        "{ help h |        | print this message }"
        "{ impl   | CPU    | implementation to use. Possible values are CPU, GPUFP32, GPUFP16 }");

    if (!parser.check())
    {
        parser.printErrors();
        return EXIT_FAILURE;
    }

    if (parser.has("help"))
    {
        parser.printMessage();
        return EXIT_SUCCESS;
    }

    if (!parser.has("@image"))
    {
        std::cerr << argv[0] << ": image parameter missing\n";
        return EXIT_FAILURE;
    }

    auto image_path = parser.get<cv::String>("@image");

    // Read the input image and verify it was correctly loaded and its dimensions
    // are suitable.

    cv::Mat image = cv::imread(image_path);
    if (!image.data)
    {
        std::cerr << argv[0] << ": couldn't load image \"" << image_path << "\"\n";
        return EXIT_FAILURE;
    }

    if (image.cols > cva::reid::PersonReidentifier::MAX_IMAGE_WIDTH ||
            image.rows > cva::reid::PersonReidentifier::MAX_IMAGE_HEIGHT)
    {
        std::cerr << argv[0] << ": image size (" << image.cols << "x" << image.rows << ") "
            << "is greater than what the net supports (<= " << cva::reid::PersonReidentifier::MAX_IMAGE_WIDTH
            << "x" << cva::reid::PersonReidentifier::MAX_IMAGE_HEIGHT << ")\n";
        return EXIT_FAILURE;
    }

    std::vector<float> embds(cva::reid::PersonReidentifier::embdSize());

    // Create net and perform embedding calculation. Note that OpenCV
    // loads images in the BGR format.

    std::unique_ptr<cva::reid::PersonReidentifier> net;
    auto impl = parser.get<cv::String>("impl");
    if (impl == "CPU")
    {
        net = cva::reid::PersonReidentifier::createCpu(1);
    }
    else if (impl == "GPUFP32")
    {
        net = cva::reid::PersonReidentifier::createGpu(cva::ac::Precision::FP32, 1);
    }
    else if (impl == "GPUFP16")
    {
        net = cva::reid::PersonReidentifier::createGpu(cva::ac::Precision::FP16, 1);
    }
    else
    {
        std::cerr << argv[0] << ": --impl must be either \"CPU\" or \"GPUFP32\" or \"GPUFP16\"\n";
        return EXIT_FAILURE;
    }

    net->calcEmbd(ac::ocv::toImageView(ac::ImageFormat::BGR_8, image),
                          ac::toSpan(embds));
    std::cout << "Calculated embedding (of size: " << cva::reid::PersonReidentifier::embdSize() <<  ") :" << std::endl;
    std::cout << std::endl;
    for (size_t i=0; i < cva::reid::PersonReidentifier::embdSize(); i++)
        std::cout << "  [" << i <<"] = " << std::fixed << std::setprecision(3) << embds[i] << std::endl;
    std::cout << std::endl;

    return EXIT_SUCCESS;
}
catch (std::exception &e)
{
    std::cerr << argv[0] << ": " << e.what() << "\n";
    return EXIT_FAILURE;
}
catch (...)
{
    std::cerr << argv[0] << ": " << "unidentified error\n";
    return EXIT_FAILURE;
}
