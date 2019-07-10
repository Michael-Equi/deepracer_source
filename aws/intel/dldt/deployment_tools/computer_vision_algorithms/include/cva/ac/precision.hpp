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

#ifndef CVA_AC_PRECISION_HPP
#define CVA_AC_PRECISION_HPP

#include "common.hpp"

#include <iosfwd>

namespace cva { namespace ac {

/*! \brief A number's precision/range. */
enum class Precision
{
    FP16, /*!< 16-bit floating point number */
    FP32, /*!< 32-bit floating point number */
    I8,   /*!< 8-bit signed integer */
    I16,  /*!< 16-bit signed integer */
    I32,  /*!< 32-bit signed integer */
    Q78,  /*!< signed fixed-point number with 7 integer and 8 fractional bits */
    U8,   /*!< 8-bit unsigned integer */
    U16,  /*!< 16-bit unsigned integer */
};

/*! \brief Streams a string representation of \p p into \p os. */
CVA_AC_EXPORT std::ostream &operator<<(std::ostream &os, Precision p);

}} // namespace cva::ac

#endif // CVA_AC_PRECISION_HPP
