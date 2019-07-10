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
#include <cva/reid/reid.hpp>


namespace ac = cva::ac;

int main(int argc, char *argv[])
try
{
    // Parse the command line arguments using OpenCV.

    cv::CommandLineParser parser(argc, argv,
        "{ help h     |        | print this message }"
        "{ @list      | <none> | file with a list of images }"
        "{ batch_size |      3 | how many images to process at once }"
        "{ impl       | CPU    | implementation to use. Possible values are CPU, GPUFP32, GPUFP16 }");

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
    if (batch_size < 1 || batch_size > cva::reid::PersonReidentifier::MAX_BATCH_SIZE)
    {
        std::cerr << argv[0] << ": --batch_size must be between 1 and "
                            << cva::reid::PersonReidentifier::MAX_BATCH_SIZE << "\n";
        return EXIT_FAILURE;
    }

    // Open the image list.

    std::ifstream list_stream(list_path);
    if (!list_stream)
    {
        std::cerr << argv[0] << ": couldn't open list file \"" << list_path << "\"\n";
        return EXIT_FAILURE;
    }

    // Create the net and prepare the buffers we'll need for batch processing.

    std::unique_ptr<cva::reid::PersonReidentifier> net;
    auto impl = parser.get<cv::String>("impl");
    if (impl == "CPU")
    {
        net = cva::reid::PersonReidentifier::createCpu(batch_size);
    }
    else if (impl == "GPUFP32")
    {
        net = cva::reid::PersonReidentifier::createGpu(cva::ac::Precision::FP32, batch_size);
    }
    else if (impl == "GPUFP16")
    {
        net = cva::reid::PersonReidentifier::createGpu(cva::ac::Precision::FP16, batch_size);
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
        // are suitable for the net.

        const auto &image = images.back();
        if (!image.data)
        {
            std::cerr << argv[0] << ": couldn't load image \"" << image_path << "\"\n";
            return EXIT_FAILURE;
        }

        if (image.cols > cva::reid::PersonReidentifier::MAX_IMAGE_WIDTH ||
                image.rows > cva::reid::PersonReidentifier::MAX_IMAGE_HEIGHT)
        {
            std::cerr << argv[0] << ": size of the image in \"" << image_path << "\" "
                << "(" << image.cols << "x" << image.rows << ") "
                << "is greater than what the net supports (<= "
                << cva::reid::PersonReidentifier::MAX_IMAGE_WIDTH << "x"
                << cva::reid::PersonReidentifier::MAX_IMAGE_HEIGHT << ")\n";
            return EXIT_FAILURE;
        }

        image_views.push_back(ac::ocv::toImageView(ac::ImageFormat::BGR_8, image));

        // If no images were loaded, then we have exhausted the list, so exit.

        if (images.empty())
            return EXIT_SUCCESS;
    }

    const std::size_t embd_size = cva::reid::PersonReidentifier::embdSize();
    // We'll store all embeddings in the same buffer, using a different subspan
    // for each image in the batch.
    std::vector<float> embeddings(images.size() * embd_size);

    std::vector<ac::Span<float>> embedding_spans;
    embedding_spans.reserve(images.size());

    for (std::size_t i = 0; i < images.size(); ++i)
        embedding_spans.push_back(ac::toSpan(embeddings).subspan(
            i * embd_size, (i + 1) * embd_size));

    // Run the net.

    net->calcEmbdBatch(ac::toSpan(image_views),
        ac::toSpan(embedding_spans));

    // Print calculated embedding to an image.

    for (std::size_t j = 0; j < images.size(); ++j)
    {
        const auto &embd_span = embedding_spans[j];
        std::cout << "Calculated embedding for image " << image_paths[j] << ":" << std::endl;
        for (size_t i = 0; i < embd_span.size(); ++i)
            std::cout << "  [" << i <<"] = " << std::fixed << std::setprecision(3) << embd_span[i] << std::endl;
        std::cout << std::endl;
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
