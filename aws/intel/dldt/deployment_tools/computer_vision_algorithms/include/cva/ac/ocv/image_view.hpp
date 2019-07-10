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

#ifndef CVA_AC_OCV_IMAGE_VIEW_HPP
#define CVA_AC_OCV_IMAGE_VIEW_HPP

#include "common.hpp"

#include <cva/ac/image_view.hpp>

#include <opencv2/core.hpp>

namespace cva { namespace ac { namespace ocv {

/*! Returns a view to the image referenced by \p mat, assuming its
 * pixel format is \p format.
 *
 * \pre \p mat.channels() is the number of channels identified by \p format.
 * \pre \p mat.depth() and \p format identify the same channel type.
 */
CVA_AC_OCV_EXPORT ImageView toImageView(ImageFormat format, const cv::Mat &mat);

}}} // namespace cva::ac::ocv

#endif // CVA_AC_OCV_IMAGE_VIEW_HPP
