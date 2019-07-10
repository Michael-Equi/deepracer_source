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

set(target cva_ctd_example_main)
project(${target})

find_package(OpenCV REQUIRED)

if (CMAKE_SOURCE_DIR STREQUAL CMAKE_CURRENT_SOURCE_DIR)
  if(CMAKE_VERSION VERSION_LESS "3.1" AND CMAKE_COMPILER_IS_GNUCXX)
    set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11")
  else()
    set(CMAKE_CXX_STANDARD 11)
  endif()

  find_package(CvaCameraTamperingDetection REQUIRED)

  set(ctd_lib Cva::CameraTamperingDetection::ctd)
else()
  set(ctd_lib ctd)
endif()

file(GLOB_RECURSE HPPS ../include/*.h ../include/*.hpp)

add_executable(${target} main.cpp ${HPPS})
target_include_directories(${target} SYSTEM PUBLIC ${OpenCV_INCLUDE_DIRS})
target_link_libraries(${target} PRIVATE "${ctd_lib}" ${OpenCV_LIBS})

set_property(TARGET ${target} PROPERTY CXX_STANDARD 11)

if(SIGN_COMMAND)
  add_custom_command(TARGET ${target} POST_BUILD COMMAND ${SIGN_COMMAND} $<TARGET_FILE:${target}>
                     COMMENT "Signing ${target}")
endif(SIGN_COMMAND)

install(TARGETS "${target}" DESTINATION bin COMPONENT example)
install(FILES main.cpp CMakeLists.txt readme.md
        DESTINATION share/cva/CameraTamperingDetection/doc/examples/main COMPONENT example)
