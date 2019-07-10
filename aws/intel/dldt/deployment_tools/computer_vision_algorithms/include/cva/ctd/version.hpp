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

/*!
 * \file version.hpp
 * \brief File containing definition of the interface for retrieving the version of the library.
 */

#ifndef CVA_CTD_VERSION_HPP
#define CVA_CTD_VERSION_HPP

#include <cva/ctd/export.hpp>

#include <cstdint>
#include <string>

namespace cva { namespace ctd {
/*!
 * \brief The class is used to represent the version number for the library.
 */
class Version
{
public:
    explicit Version(std::uint32_t major = 0, std::uint32_t minor = 0, std::uint32_t patch = 0)
        : major_(major), minor_(minor), patch_(patch)
    {}

    /*!
     * \brief Get major number of the version
     */
    std::uint32_t major() const { return major_; }

    /*!
     * \brief Get minor number of the version
     */
    std::uint32_t minor() const { return minor_; }

    /*!
     * \brief Get patch number of the version
     */
    std::uint32_t patch() const { return patch_; }

    /*!
     * \brief Get version string: major.minor.revision
     */
    std::string toString() const
    {
        return std::to_string(major_)
            + '.' + std::to_string(minor_)
            + '.' + std::to_string(patch_);
    }

private:
    std::uint32_t major_, minor_, patch_;
};

/*!
    * \brief Get version number for the library.
    */
CVA_CTD_EXPORT Version version();

}}  // namespace cva::ctd

#endif // CVA_CTD_VERSION_HPP
