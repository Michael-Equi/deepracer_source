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

#ifndef CVA_CTD_EXPORT_HPP
#define CVA_CTD_EXPORT_HPP

#ifdef _WIN32

#ifdef CVA_CTD_BUILD
#define CVA_CTD_EXPORT __declspec(dllexport)
#else
#define CVA_CTD_EXPORT __declspec(dllimport)
#endif // defined CVA_CTD_BUILD

#else

#define CVA_CTD_EXPORT __attribute__((visibility("default")))

#endif // _WIN32

#endif // CVA_CTD_EXPORT_HPP
