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

/*
    This example program classifies an image supplied by the user and prints
    the probabilities of it belonging to each class.
*/

#include <cva/vc/vc.hpp>

#include <cva/ac/ocv/image_view.hpp>

#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>

#include <algorithm>
#include <cstdlib>
#include <exception>
#include <iomanip>
#include <iostream>
#include <numeric>
#include <utility>
#include <vector>

namespace ac = cva::ac;

int main(int argc, char *argv[])
try
{
    // Parse the command line arguments using OpenCV.

    cv::CommandLineParser parser(argc, argv,
        "{ help h |        | print this message }"
        "{ @image | <none> | image to classify }"
        "{ impl   |  CPU   | classifier implementation to use. Possible values are CPU, GPUFP32, GPUFP16 }"
    );

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

    auto impl = parser.get<cv::String>("impl");
    if (impl != "CPU" && impl != "GPUFP32" && impl != "GPUFP16")
    {
        std::cerr << argv[0] << ": --impl must be either \"CPU\", \"GPUFP32\" or \"GPUFP16\"\n";
        return EXIT_FAILURE;
    }

    // Read the input image and verify it was correctly loaded and its dimensions
    // are suitable for the classifier.

    cv::Mat image = cv::imread(image_path);
    if (!image.data)
    {
        std::cerr << argv[0] << ": couldn't load image \"" << image_path << "\"\n";
        return EXIT_FAILURE;
    }

    if (image.cols > cva::vc::VehicleClassifier::MAX_IMAGE_WIDTH ||
            image.rows > cva::vc::VehicleClassifier::MAX_IMAGE_HEIGHT)
    {
        std::cerr << argv[0] << ": image size (" << image.cols << "x" << image.rows << ") "
            << "is greater than what the classifier supports (<= " << cva::vc::VehicleClassifier::MAX_IMAGE_WIDTH
            << "x" << cva::vc::VehicleClassifier::MAX_IMAGE_HEIGHT << ")\n";
        return EXIT_FAILURE;
    }

    // Allocate space for the probabilities.

    std::vector<float> color_probs(cva::vc::VehicleClassifier::numColors());
    std::vector<float> type_probs(cva::vc::VehicleClassifier::numTypes());

    ac::ConstImageView image_view = ac::ocv::toImageView(ac::ImageFormat::BGR_8, image);
    ac::Span<float> color_probs_span = ac::toSpan(color_probs);
    ac::Span<float> type_probs_span = ac::toSpan(type_probs);

    // Create the classifier and perform the classification. Note that OpenCV
    // loads images in the BGR format.

    auto classifier = impl == "CPU"
        ? cva::vc::VehicleClassifier::createCpu()
        : impl == "GPUFP32"
            ? cva::vc::VehicleClassifier::createGpu(ac::Precision::FP32)
            : cva::vc::VehicleClassifier::createGpu(ac::Precision::FP16);

    classifier->classify({&image_view, 1},
        {&color_probs_span, 1}, {&type_probs_span, 1});

    // We need to sort the probabilities, but we don't want to lose track of
    // their original indexes, since we'll need those indexes to look up the
    // class descriptions. So we create a separate vector with just the indexes,
    // and sort those instead, using a custom comparator.

    std::vector<std::size_t> color_indexes(cva::vc::VehicleClassifier::numColors());
    std::vector<std::size_t> type_indexes(cva::vc::VehicleClassifier::numTypes());
    std::iota(color_indexes.begin(), color_indexes.end(), 0);
    std::iota(type_indexes.begin(), type_indexes.end(), 0);

    std::sort(color_indexes.begin(), color_indexes.end(),
        [&color_probs](std::size_t left, std::size_t right) {
          return color_probs[left] > color_probs[right];
        });

    std::sort(type_indexes.begin(), type_indexes.end(),
        [&type_probs](std::size_t left, std::size_t right) {
          return type_probs[left] > type_probs[right];
        });


    // Print the top probabilities and the descriptions of the corresponding classes.

    std::cout << std::fixed << std::setprecision(2);

    for (auto color_index: color_indexes)
    {
        std::cout << std::setw(5) << color_probs[color_index] * 100.f
                  << "% - " << cva::vc::VehicleClassifier::colorDescription(color_index) << '\n';
    }

    std::cout << '\n';

    for (auto type_index: type_indexes)
    {
        std::cout << std::setw(5) << type_probs[type_index] * 100.f
                  << "% - " << cva::vc::VehicleClassifier::typeDescription(type_index) << '\n';
    }

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
