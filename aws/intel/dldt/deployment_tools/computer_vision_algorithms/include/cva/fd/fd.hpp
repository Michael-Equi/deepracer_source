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

#ifndef CVA_FD_FD_HPP
#define CVA_FD_FD_HPP

#if defined(WIN32) || defined(_WIN32)
#ifdef CVA_FD_BUILD
#define CVA_FD_DLLEXPORT __declspec(dllexport)
#else
#define CVA_FD_DLLEXPORT __declspec(dllimport)
#endif // defined CVA_FD_BUILD
#elif __GNUC__ >= 4
#define CVA_FD_DLLEXPORT __attribute__((visibility("default")))
#else
#define CVA_FD_DLLEXPORT
#endif // #if defined(WIN32) || defined(_WIN32)

#include <opencv2/core/core.hpp>

#include <cstdint>
#include <memory>
#include <string>
#include <vector>

namespace cva { namespace fd {

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
 * \brief Return version of the current library.
 */
CVA_FD_DLLEXPORT Version version();

/*!
 *  \brief The type of backend to use
 */
enum class BackendType
{
    CPU, ///< Use CPU backend
    GPU, ///< Use GPU backend
    VPU, ///< Use VPU backend
};

/*!
 * \brief An interface class for a face.
 */
class Face
{
public:
    /*!
     * \brief Get the bounding box of the face.
     *
     * Could be outside of the frame.
     *
     * \return Rectangle that is a bounding box of the face.
     */
    virtual cv::Rect boundingBox() const = 0;

    /*!
     * \brief Get the confidence of the face
     * \return Float confidence value of the face.
     */
    virtual float confidence() const = 0;

    /*!
     * A virtual destructor for the abstract class.
     */
    virtual ~Face() = default;
};


/*!
 * \brief The main class which provides functionality of detecting faces
 *        on the given sequence of images.
 */
class FaceDetector
{
public:

    /*!
     * \brief  A factory for FaceDetector.
     * \param[in] model_path                The path to the file with the model (xml file for DLDT).
     * \param[in] weights_path              The path to the file with the weights (bin file for DLDT).
     * \param[in] backend_type              The type of DLDT backend to use.
     * \param[in] custom_layers_xml_path    The path to XML file describing DLDT custom layers. Applicable for GPU target only.
     *                                      Should be empty if custom DLDT layers are not used.
     * \return An instance of a face detector implementing FaceDetector interface.
     */
    CVA_FD_DLLEXPORT static std::unique_ptr<FaceDetector> create(
        const std::string& model_path,
        const std::string& weights_path,
        BackendType backend_type = BackendType::CPU,
        const std::string& custom_layers_xml_path = "");

    /*!
     * \brief Process the frame and detect faces.
     *
     *
     * The call is blocking. The method does not modify the input data.
     *
     * \param[in] frame     the input frame
     *                     If the frame is an empty cv::Mat, the method returns empty vector.
     *
     * \return Vector of OpenCV smart pointers to Face structures,
     *         describing the faces found on the input frame.
     */
    virtual std::vector<std::unique_ptr<Face>> process(const cv::Mat& frame) = 0;

    /*!
     * \brief Set confidence threshold to reject detections with weak score.
     *
     * \param[in] detection_confidence    floating point minimal confidence value for the detected objects.
     *                                    (may be negative or positive)
     *                                    In case NaN value the method throws an exception
     *                                    -- an instance of cv::Exception with the field \p code equal to
     *                                    cv::Error::StsBadArg.
     */
    virtual void setConfidence(float detection_confidence = 0.) = 0;

    /*!
     * \brief Get confidence threshold to reject detections with weak score.
     *
     * \return floating point minimal confidence value for the detected objects.
     */
    virtual float confidence() const = 0;

    /*!
     * A virtual destructor for the abstract class.
     */
    virtual ~FaceDetector() = default;
};

}} // namespace cva::fd

#endif // #ifndef CVA_FD_FD_HPP
