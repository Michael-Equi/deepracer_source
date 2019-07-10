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


####### Expanded from @PACKAGE_INIT@ by configure_package_config_file() #######
####### Any changes to this file will be overwritten by the next CMake run ####
####### The input file was CvaAgeGenderRecognitionConfig.cmake.in                            ########

get_filename_component(PACKAGE_PREFIX_DIR "${CMAKE_CURRENT_LIST_DIR}/../../../" ABSOLUTE)

####################################################################################

if(CMAKE_VERSION VERSION_LESS "3.0")
  find_package(OpenCV 4.0.0)
  find_package(InferenceEngine)
else()
  include(CMakeFindDependencyMacro)
  find_dependency(OpenCV 4.0.0)
  find_dependency(InferenceEngine)
endif()

set(CvaAgeGenderRecognition_MODELS_DIR ${PACKAGE_PREFIX_DIR}/share/cva/AgeGenderRecognition/models/dlsdk)
set(CvaAgeGenderRecognition_DOCUMENTATION )
set(CvaAgeGenderRecognition_DOXYGEN_TAG )

include("${CMAKE_CURRENT_LIST_DIR}/CvaAgeGenderRecognitionTargets.cmake")

# append OpenCV include directories

set_property(TARGET Cva::AgeGenderRecognition::agr APPEND PROPERTY INTERFACE_INCLUDE_DIRECTORIES "${OpenCV_INCLUDE_DIRS}")
