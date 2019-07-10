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

#ifndef CVA_AC_OCV_COMMON_HPP
#define CVA_AC_OCV_COMMON_HPP

#include <cva/ac/api.hpp>

#ifdef CVA_AC_OCV_BUILD
#define CVA_AC_OCV_EXPORT CVA_AC_SHARED_LIBRARY_EXPORT
#else
#define CVA_AC_OCV_EXPORT CVA_AC_SHARED_LIBRARY_IMPORT
#endif

#endif // CVA_AC_OCV_COMMON_HPP
