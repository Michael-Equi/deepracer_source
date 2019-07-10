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

project(cva_agr_example_main)

if(CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
    if(CMAKE_VERSION VERSION_LESS "3.1" AND CMAKE_COMPILER_IS_GNUCXX)
      set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
    else()
      set(CMAKE_CXX_STANDARD 11)
    endif()

    find_package(CvaAgeGenderRecognition REQUIRED)
    find_package(OpenCV REQUIRED)

    set(agr_lib Cva::AgeGenderRecognition::agr)
else()
    set(agr_lib agr)
endif()

add_executable(${PROJECT_NAME} main.cpp)

target_include_directories(${PROJECT_NAME} PRIVATE ${OpenCV_INCLUDE_DIRS})
target_link_libraries(${PROJECT_NAME} PRIVATE "${agr_lib}" ${OpenCV_LIBS})

if(SIGN_COMMAND)
  add_custom_command(TARGET ${PROJECT_NAME} POST_BUILD COMMAND ${SIGN_COMMAND} $<TARGET_FILE:${PROJECT_NAME}>
                     COMMENT "Signing ${PROJECT_NAME}")
endif(SIGN_COMMAND)

install(TARGETS ${PROJECT_NAME} RUNTIME DESTINATION bin COMPONENT example)
install(FILES main.cpp CMakeLists.txt readme.md
        DESTINATION "share/cva/AgeGenderRecognition/doc/examples/main" COMPONENT example)
