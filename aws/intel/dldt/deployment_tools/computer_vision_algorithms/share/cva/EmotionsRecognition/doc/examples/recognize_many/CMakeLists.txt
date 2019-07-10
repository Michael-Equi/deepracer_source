# Copyright 2018 Intel Corporation.
#
# This software and the related documents are Intel copyrighted materials,
# and your use of them is governed by the express license under which they
# were provided to you (Intel Simplified Software License (Version April 2018))
# Unless the License provides otherwise, you may not use, modify,
# copy, publish, distribute, disclose or transmit this software or
# the related documents without Intel's prior written permission.
#
# This software and the related documents are provided as is, with no
# express or implied warranties, other than those that are expressly
# stated in the License.

cmake_minimum_required(VERSION 2.8)

project(EmotionsRecognitionExampleMany CXX)

find_package(CvaAlgoCommon REQUIRED)
find_package(CvaEmotionsRecognition REQUIRED)
find_package(OpenCV REQUIRED)

if(CMAKE_VERSION VERSION_LESS "3.1" AND CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
else()
    set(CMAKE_CXX_STANDARD 11)
    set(CMAKE_CXX_STANDARD_REQUIRED TRUE)
endif()

add_executable(cva_er_example_recognize_many "main.cpp")
target_link_libraries(cva_er_example_recognize_many PRIVATE
    Cva::EmotionsRecognition::er Cva::AlgoCommon::ac_ocv Cva::AlgoCommon::ac "${OpenCV_LIBS}")
