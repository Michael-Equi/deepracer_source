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

#ifndef CVA_AC_API_HPP
#define CVA_AC_API_HPP

#include <cstdint>
#include <string>

/*!
  \def CVA_AC_SHARED_LIBRARY_EXPORT
  \brief Expands to a platform-dependent qualifier that can be used to mark
  a definition as exported from the current shared library.

  On an unsupported platform, expands to nothing.
*/

/*!
  \def CVA_AC_SHARED_LIBRARY_IMPORT
  \brief Expands to a platform-dependent qualifier that can be used to mark
  a definition as imported from an external shared library.

  On an unsupported platform, expands to nothing.
*/

#if defined(__GNUC__)

#define CVA_AC_SHARED_LIBRARY_EXPORT __attribute__((visibility("default")))
#define CVA_AC_SHARED_LIBRARY_IMPORT __attribute__((visibility("default")))

#elif defined(_MSC_VER)

#define CVA_AC_SHARED_LIBRARY_EXPORT __declspec(dllexport)
#define CVA_AC_SHARED_LIBRARY_IMPORT __declspec(dllimport)

#else

#define CVA_AC_SHARED_LIBRARY_EXPORT
#define CVA_AC_SHARED_LIBRARY_IMPORT

#endif

namespace cva { namespace ac {

/*! \brief Version number of a library which consists of major, minor and patch numbers. */
class Version
{
public:
    /*! \brief Constructs a version object with given \p major \p minor and \p patch numbers. */
    explicit constexpr Version(std::uint32_t major = 0, std::uint32_t minor = 0, std::uint32_t patch = 0)
    : major_(major), minor_(minor), patch_(patch)
    {}

    /*! \brief Returns the major number of the version. */
    constexpr std::uint32_t major() const { return major_; }

    /*! \brief Returns the minor number of the version. */
    constexpr std::uint32_t minor() const { return minor_; }

    /*! \brief Returns the patch number of the version. */
    constexpr std::uint32_t patch() const { return patch_; }

    /*! \brief Returns the version string: major.minor.patch. */
    std::string toString() const
    {
        return std::to_string(major_) + '.' + std::to_string(minor_) + '.' + std::to_string(patch_);
    }

    /*! \brief Returns whether all components of \p left compare equal to those of \p right. */
    friend bool operator==(const Version &left, const Version &right)
    {
        return left.major_ == right.major_ && left.minor_ == right.minor_ && left.patch_ == right.patch_;
    }

    /*! \brief Returns the opposite of operator==(). */
    friend bool operator!=(const Version &left, const Version &right)
    {
        return !(left == right);
    }

private:
    std::uint32_t major_, minor_, patch_;
};

}} // namespace cva::ac

#endif // CVA_AC_API_HPP
