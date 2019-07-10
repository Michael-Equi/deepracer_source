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
#include <fstream>
#include <iomanip>
#include <iostream>
#include <utility>
#include <vector>

#include <opencv2/core.hpp>
#include <opencv2/imgcodecs.hpp>
#include <opencv2/imgproc.hpp>

#include <cva/ac/ocv/image_view.hpp>
#include <cva/er/er.hpp>


namespace ac = cva::ac;

int main(int argc, char *argv[])
try
{
    // Parse the command line arguments using OpenCV.

    cv::CommandLineParser parser(argc, argv,
        "{ help h     |        | print this message }"
        "{ @list      | <none> | file with a list of images }"
        "{ batch_size |      4 | how many images to process at once }"
        "{ impl       |  CPU   | implementation to use. Possible values are CPU, GPUFP32, GPUFP16 }");
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

    if (!parser.has("@list"))
    {
        std::cerr << argv[0] << ": list parameter missing\n";
        return EXIT_FAILURE;
    }

    auto list_path = parser.get<cv::String>("@list");

    auto batch_size = parser.get<std::size_t>("batch_size");
    if (batch_size < 1 || batch_size > cva::er::EmotionsRecognizer::MAX_BATCH_SIZE)
    {
        std::cerr << argv[0] << ": --batch_size must be between 1 and "
                            << cva::er::EmotionsRecognizer::MAX_BATCH_SIZE << "\n";
        return EXIT_FAILURE;
    }

    // Open the image list.

    std::ifstream list_stream(list_path);
    if (!list_stream)
    {
        std::cerr << argv[0] << ": couldn't open list file \"" << list_path << "\"\n";
        return EXIT_FAILURE;
    }

    // Create the recognizer and prepare the buffers we'll need for batch processing.

    std::unique_ptr<cva::er::EmotionsRecognizer> recognizer;
    auto impl = parser.get<cv::String>("impl");
    if ("CPU" == impl)
    {
        recognizer = cva::er::EmotionsRecognizer::createCpu(batch_size);
    }
    else if ("GPUFP32" == impl)
    {
        recognizer = cva::er::EmotionsRecognizer::createGpu(cva::ac::Precision::FP32, batch_size);
    }
    else if ("GPUFP16" == impl)
    {
        recognizer = cva::er::EmotionsRecognizer::createGpu(cva::ac::Precision::FP16, batch_size);
    }
    else
    {
        std::cerr << argv[0] << ": --impl must be either \"CPU\" or \"GPUFP32\" or \"GPUFP16\"\n";
        return EXIT_FAILURE;
    }

    std::vector<cv::Mat> images;
    std::vector<ac::ConstImageView> image_views;
    std::vector<std::string> image_paths;

    std::cout << std::fixed << std::setprecision(2);

    for (; ; )
    {
        std::string image_path;
        if (!std::getline(list_stream, image_path)) break;

        image_paths.push_back(image_path);
        images.push_back(cv::imread(image_path));

        // Verify that the image was succesfully loaded and that its dimensions
        // are suitable for the recognizer.

        const auto &image = images.back();
        if (!image.data)
        {
            std::cerr << argv[0] << ": couldn't load image \"" << image_path << "\"\n";
            return EXIT_FAILURE;
        }

        if (image.cols > cva::er::EmotionsRecognizer::MAX_IMAGE_WIDTH ||
                image.rows > cva::er::EmotionsRecognizer::MAX_IMAGE_HEIGHT)
        {
            std::cerr << argv[0] << ": size of the image in \"" << image_path << "\" "
                << "(" << image.cols << "x" << image.rows << ") "
                << "is greater than what the recognizer supports (<= "
                << cva::er::EmotionsRecognizer::MAX_IMAGE_WIDTH << "x"
                << cva::er::EmotionsRecognizer::MAX_IMAGE_HEIGHT << ")\n";
            return EXIT_FAILURE;
        }

        image_views.push_back(ac::ocv::toImageView(ac::ImageFormat::BGR_8, image));
    }

    // If no images were loaded, then we have exhausted the list, so exit.

    if (images.empty())
        return EXIT_SUCCESS;

    const std::size_t num_classes = cva::er::EmotionsRecognizer::numClasses();

    // We'll store all probabilities in the same buffer, using a different subspan
    // for each image in the batch.
    std::vector<float> probabilities(image_views.size() * num_classes);

    std::vector<ac::Span<float>> probability_spans;
    probability_spans.reserve(image_views.size());
    for (std::size_t i = 0; i < image_views.size(); ++i)
        probability_spans.push_back(ac::toSpan(probabilities).subspan(
            i * num_classes, (i + 1) * num_classes));

    // Run the recognizer.

    recognizer->recognizeBatch(ac::toSpan(image_views),
        ac::toSpan(probability_spans).subspan(0, image_views.size()));

    // Print the most probable class for each image in the batch.

    for (std::size_t i = 0; i < images.size(); ++i)
    {
        const auto &prob_span = probability_spans[i];

        auto index = std::distance(prob_span.begin(), std::max_element(prob_span.begin(), prob_span.end()));
        auto emotion = cva::er::EmotionsRecognizer::classDescription(index);

        std::cout << image_paths[i] << " - " << emotion << " (" << index << ")" << std::endl;
    }
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
