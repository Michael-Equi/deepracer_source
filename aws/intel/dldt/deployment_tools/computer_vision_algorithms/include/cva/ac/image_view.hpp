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

#ifndef CVA_AC_IMAGE_VIEW_HPP
#define CVA_AC_IMAGE_VIEW_HPP

#include "common.hpp"
#include "error_reporting.hpp"

#include <cstdlib>
#include <stdexcept>
#include <type_traits>

namespace cva { namespace ac {

/*! \brief A non-owning reference to a two-dimensional block of pixels, each of which
 * is a contiguous sequence of one or more channels of type T.
 *
 * Every pixel has the same number of channels.
 *
 * The pixels must be stored in row-major order. The pixels within each row must
 * be contiguous, but the rows themselves don't have to be. The distance in bytes
 * between the first pixels of each pair of adjacent rows must be the same and is
 * called the view's stride.
 *
 * A pointer to the pixel with index (0, 0) is called the view's base.
 */
template <typename T>
class View2d
{
public:
    /*! \brief Constructs a view to a \p width x \p height block pixels
     * of \p nc channels each, with the given \p stride and \p base.
     *
     * \pre \p width > 0, \p height > 0, \p nc > 0
     * \pre \p stride >= \p width * \p nc * \c sizeof(\p T)
     * \pre \p base is not null.
     */
    View2d(std::size_t width, std::size_t height, std::size_t nc,
           std::ptrdiff_t stride, T *base)
        : width_(width), height_(height), nc_(nc), stride_(stride), base_(base)
    {
        require<std::invalid_argument>("View2d", __func__, width > 0,
                                       "width (", width, ") must be > 0");

        require<std::invalid_argument>("View2d", __func__, height > 0,
                                       "height (", height, ") must be > 0");

        require<std::invalid_argument>("View2d", __func__, nc > 0,
                                       "nc (", nc, ") must be > 0");

        std::ptrdiff_t line_width = width * nc * sizeof(T);
        require<std::invalid_argument>("View2d", __func__, stride >= line_width,
                                       "stride (", stride, ") must be >= ",
                                       "width * nc * sizeof(T) (", line_width, ")");

        require<std::invalid_argument>("View2d", __func__, base != nullptr, "base must not be null");
    }

    /*! \brief Constructs a view to the same block as \p that.
     *
     * \pre \p T is either \p U or \p U with additional cv-qualifiers.
     */
    template <typename U, typename = typename std::enable_if<
                  std::is_convertible<U(*)[], T(*)[]>::value>::type>
    View2d(const View2d<U> &that)
        : width_(that.width()), height_(that.height()), nc_(that.nc()),
          stride_(that.stride()), base_(that.base())
    {}

    /*! \brief Returns the width of the referenced block. */
    std::size_t width() const { return width_; }
    /*! \brief Returns the height of the referenced block. */
    std::size_t height() const { return height_; }
    /*! \brief Returns the number of channels in a pixel of the referenced block. */
    std::size_t nc() const { return nc_; }

    /*! \brief Returns the view's stride. */
    std::ptrdiff_t stride() const { return stride_; }
    /*! \brief Returns the view's base. */
    T *base() const { return base_; }

    /*! \brief Returns a pointer to the first pixel of the row with index \p y.
     *
     * \pre \p y < height()
     */
    T *row(std::size_t y)
    {
        require<std::out_of_range>("View2d", __func__, y < height_,
            "y (", y, ") must be < height() (", height_, ")");
        return base_ + std::ptrdiff_t(y) * stride_ / sizeof(T);
    }

private:
    std::size_t width_, height_, nc_;
    std::ptrdiff_t stride_;
    T *base_;
};

/*! \brief An identifier of a specific number of channels and channel type of a pixel,
 * as well as an intended interpretation of such a pixel.
 *
 * A type \p T is considered to match a format if \p T is the channel type
 * identified by the format, or a cv-qualified version of it.
 */
enum class ImageFormat
{
    /*! One \c std::uint8_t channel representing an abstract label. */
    LABEL_8,
    /*! One \c std::uint8_t channel representing an intensity of light. */
    INTENSITY_8,
    /*! Three \c std::uint8_t channels representing intensities of
     * red, green and blue color components. */
    RGB_8,
    /*! Three \c std::uint8_t channels representing intensities of
     * blue, green and red color components. */
    BGR_8,
};

/*! \brief Returns the number of channels identified by \p format.
 */
CVA_AC_EXPORT std::size_t imageFormatNumChannels(ImageFormat format);

/*! \brief Throws an exception if \p nc is not #imageFormatNumChannels(\p format).
 *
 * \p format_str and \p nc_str must be expressions, evaluating which yielded \p format
 * and \p nc, respectively. They are used as part of the exception message.
 *
 * \p class_name and \p function_name are used in the same way as in failRequirement().
 */
CVA_AC_EXPORT void imageFormatRequireMatchingNumChannels(
    const char *class_name, const char *function_name,
    ImageFormat format, const char *format_str,
    std::size_t nc, const char *nc_str);

/*! \brief Throws an exception if \p T does not match \p format.
 *
 * \p format_str and \p type_str must be expressions/type specifications, evaluating
 * which yielded \p format and \p T, respectively. They are used as part of
 * the exception message.
 *
 * \p class_name and \p function_name are used in the same way as in failRequirement().
 */
template <typename T>
inline void imageFormatRequireMatchingType(
    const char *class_name, const char *function_name,
    ImageFormat format, const char *format_str, const char *type_str)
{
    switch (format)
    {
    case ImageFormat::LABEL_8:
    case ImageFormat::INTENSITY_8:
    case ImageFormat::RGB_8:
    case ImageFormat::BGR_8:
        require<std::invalid_argument>(
            class_name, function_name,
            std::is_same<std::uint8_t, typename std::remove_cv<T>::type>::value,
            type_str, " must match the type corresponding to ", format_str, " (", int(format), ")");
        return;
    default:
        failRequirement<std::invalid_argument>(nullptr, __func__, "unknown format (", int(format), ")");
    }
}

/*! \brief A non-owning reference to an image.
 *
 * \pre \p T is \c void or cv-qualified \c void.
 *
 * "Image" is defined as a block of pixels of a particular format, laid
 * out in a way compatible with a View2d of an appropriate type.
 *
 * The cv-qualifiers of \p T are used to restrict access to the image.
 * For instance, if \p T is <tt>const void</tt>, then modifying the pixels
 * will not be allowed.
 *
 * Instead of using this template directly, you may want to use the helper
 * aliases #ImageView and #ConstImageView.
 */
template <typename T>
class ImageViewT
{
    static_assert(std::is_void<T>::value,
                  "ImageViewT must be instantiated with (cv-qualified) void");

public:
    /*! \brief Constructs a view to the image referenced by \p typed,
     * assuming its pixel format is \p format.
     *
     * \pre \p T has the same cv-qualifiers as \p U, or more.
     * \pre \p U matches \p format.
     * \pre \p typed.nc() is the number of channels identified by \p format.
     */
    template <typename U, typename = typename std::enable_if<
        std::is_convertible<U*, T*>::value>::type>
    ImageViewT(ImageFormat format, const View2d<U> &typed)
        : format_(format), width_(typed.width()), height_(typed.height()),
          stride_(typed.stride()), base_(typed.base())
    {
        imageFormatRequireMatchingType<U>("ImageViewT", __func__, format, "format", "U");
        imageFormatRequireMatchingNumChannels("ImageViewT", __func__, format, "format", typed.nc(), "typed.nc()");
    }

    /*! \brief Constructs a view to the image referenced by \p that.
     *
     * \pre \p T is either \p U or \p U with additional cv-qualifiers.
     */
    template <typename U, typename = typename std::enable_if<
        std::is_convertible<U*, T*>::value>::type>
    ImageViewT(ImageViewT<U> that)
        : format_(that.format_), width_(that.width_), height_(that.height_),
          stride_(that.stride_), base_(that.base_)
    {}

    /*! \brief Returns the pixel format of the referenced image. */
    ImageFormat format() const { return format_; }
    /*! \brief Returns the width of the referenced image. */
    std::size_t width() const { return width_; }
    /*! \brief Returns the height of the referenced image. */
    std::size_t height() const { return height_; }

    /*! \brief Returns a View2d that references the same image as \p this.
     *
     * \pre \p U matches format().
     */
    template <typename U>
    View2d<U> typed() const
    {
        imageFormatRequireMatchingType<U>("ImageViewT", __func__, format_, "format()", "U");
        std::size_t nc = imageFormatNumChannels(format_);
        return {width_, height_, nc, stride_, static_cast<U*>(base_)};
    }

private:
    ImageFormat format_;
    std::size_t width_, height_;
    std::ptrdiff_t stride_;
    T *base_;

    template <typename U>
    friend class ImageViewT;
};

using ConstImageView = ImageViewT<const void>;
using ImageView = ImageViewT<void>;

}} // namespace cva::ac

#endif // CVA_AC_IMAGE_VIEW_HPP
