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

# To use Barrier Detector in your application:
#
# find_package(CvaBarrierDetector REQUIRED)
# target_link_libraries(your_target PRIVATE Cva::BarrierDetector::barrier)

if(CMAKE_VERSION VERSION_LESS "3.0")
    find_package(CvaAlgoCommon)
else()
    include(CMakeFindDependencyMacro)
    find_dependency(CvaAlgoCommon)
endif()

include("${CMAKE_CURRENT_LIST_DIR}/CvaBarrierDetectorTargets.cmake")
