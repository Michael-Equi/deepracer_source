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

#ifndef CVA_LPR_LPR_HPP
#define CVA_LPR_LPR_HPP

#if defined(WIN32) || defined(_WIN32)
#ifdef CVA_LPR_BUILD
#define CVA_LPR_EXPORT __declspec(dllexport)
#else
#define CVA_LPR_EXPORT __declspec(dllimport)
#endif // defined CVA_LPR_BUILD
#else
#if __GNUC__ >= 4
#define CVA_LPR_EXPORT __attribute__((visibility("default")))
#else
#define CVA_LPR_EXPORT
#endif
#endif // #if defined(WIN32) || defined(_WIN32)


#include <opencv2/core/core.hpp>
#include <memory>
#include <string>

namespace cva { namespace lpr {

/*!
 * \brief A version of the library.
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
 * \brief Returns the version of the library.
 */
CVA_LPR_EXPORT Version version();

/*! \brief Possible hardware backends that can be used for computation. */
enum class BackendType
{
    CPU,
    GPU,
};

/*! \brief Result of an asynchronous wait function. */
enum class WaitResult
{
    COMPLETED,
    TIMED_OUT,
};

/*!
 * \brief Abstract class for DL-based license plate decoder.
 */
class LicensePlateDecoder
{
public:
    /*!
     * \brief Create an instance of the license plate decoder.
     * \param[in] model_file    File with network topology in XML format.
     * \param[in] weights_file  Binary file with network weights.
     * \param[in] dict_file     Dictionary containing outputs of network mapping to alphanumeric characters.
     *                          Each line of this file must contain class ID and the corresponding character
     *                          separated by space.
     * \param[in] backend_type  Device to compute classification on
     * \return                  Pointer to new object.
     */
    CVA_LPR_EXPORT static std::unique_ptr<LicensePlateDecoder> create(
        const std::string &model_file,
        const std::string &weights_file,
        const std::string &dict_file,
        BackendType backend_type = BackendType::CPU);

    /*!
     * \brief Decode the image containing only license plate.
     * \param[in] plate   Image to be processed. It should be converted to appropriate color space
     *                    before calling this function. However, image is rescaled inside according to
     *                    network it uses.
     * \return            Label, i.e. string containing Chinese province and alphanumeric string, e.g.
     *                    \<Beijing\>FA9152 or WJ\<Jiangsu\>02009.
     */
    virtual std::string decode(const cv::Mat& plate) = 0;

    /*!
     * \brief Creates defined number of asynchronous requests.
     * \param[in] nrequests number of supported asynchronous requests
     */    
    virtual void createAsyncRequests(size_t nrequests) = 0;

    /*! 
     * \brief Starts the image decoding asynchronously
     * \param[in] plate   Image to be processed. It should be converted to appropriate color space
     *                    before calling this function. However, image is rescaled inside according to
     *                    network it uses.
     */
    virtual void startAsyncDecode(const cv::Mat& plate) = 0;

    /*! 
     * \brief Waits for decoding to end. Blocks until specified millis_timeout has elapsed or 
     *  the decoding ends, whichever comes first.
     * \param[in] millis_timeout Maximum duration in milliseconds to block for, or -1 for an unlimited duration.
     * \return WaitResult::COMPLETED if the decoding has ended, WaitResult::TIMED_OUT otherwise.
     */
    virtual WaitResult waitAsync(int64_t millis_timeout) = 0;

    /*! 
     * \brief Gets decoding result.
     * \return            Label, i.e. string containing Chinese province and alphanumeric string, e.g.
     *                    \<Beijing\>FA9152 or WJ\<Jiangsu\>02009.
     */
    virtual std::string fetchAsyncDecodeResult() = 0;

    /*!
     * \brief A virtual destructor for the abstract class.
     */
    virtual ~LicensePlateDecoder() = default;
};

}} // namespace cva::lpr

#endif //CVA_LPR_LPR_HPP
