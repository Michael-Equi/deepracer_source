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

cmake_minimum_required(VERSION 2.8.12)

project("cva_lpr_example_main")

find_package(OpenCV REQUIRED)
if(CMAKE_CURRENT_SOURCE_DIR STREQUAL CMAKE_SOURCE_DIR)
    find_package(CvaLicensePlateRecognition REQUIRED)
    set(lpr_lib Cva::LicensePlateRecognition::lpr)
else()
    set(lpr_lib lpr)
endif()

if(CMAKE_VERSION VERSION_LESS "3.1" AND CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
else()
    set(CMAKE_CXX_STANDARD 11)
endif()

add_executable("${PROJECT_NAME}" main.cpp)
target_link_libraries("${PROJECT_NAME}" PRIVATE "${lpr_lib}" ${OpenCV_LIBRARIES})

if(SIGN_COMMAND)
    add_custom_command(TARGET "${PROJECT_NAME}" POST_BUILD
                       COMMAND ${SIGN_COMMAND} "$<TARGET_FILE:${PROJECT_NAME}>" VERBATIM
                       COMMENT "Signing ${PROJECT_NAME}")
endif(SIGN_COMMAND)

install(TARGETS "${PROJECT_NAME}" RUNTIME DESTINATION bin COMPONENT example)
install(FILES main.cpp CMakeLists.txt readme.md
        DESTINATION "share/cva/LicensePlateRecognition/doc/examples/main" COMPONENT example)
