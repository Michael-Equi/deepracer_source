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

#ifndef CVA_AGR_AGR_HPP
#define CVA_AGR_AGR_HPP

#if defined(_WIN32)
    #ifdef CVA_AGR_BUILD
      #define CVA_AGR_EXPORT   __declspec(dllexport)
    #else
      #define CVA_AGR_EXPORT   __declspec(dllimport)
    #endif
#elif __GNUC__ >= 4
    #define CVA_AGR_EXPORT __attribute__ ((visibility ("default")))
#else
    #define CVA_AGR_EXPORT
#endif

#include <opencv2/core.hpp>

#include <memory>
#include <string>
#include <vector>

namespace cva { namespace agr {

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
CVA_AGR_EXPORT Version version();

/*!
 * \brief The enum representing possible HW backends used for computations.
 */
enum class BackendType
{
    CPU,
    GPU,
    VPU,
};

enum class Gender
{
    FEMALE,
    MALE,
    UNKNOWN = -1,
};

/*!
 * \brief The abstract class for DL-based face analyzer (i.e. age and gender classification tool).
 */
class FaceAnalyzer
{
public:
    /*!
     * \brief The structure describing age and gender of some object.
     */
    struct FaceAttributes
    {
        /*!
         * \brief Default constructor for the structure.
         */
        explicit FaceAttributes(float age = std::numeric_limits<float>::signaling_NaN(),
                                Gender gender = Gender::UNKNOWN)
        : age(age), gender(gender)
        {}

        /*!
         * \brief Age, in years.
         */
        float age;
        /*!
         * \brief Gender.
         */
        Gender gender;
    };

    /*!
     * \brief The structure describing model for the inference process.
     */
    struct Parameters
    {
        /*!
         * \brief Default constructor for the structure.
         */
        explicit Parameters(std::string weights_path = "", std::string model_path = "",
                       BackendType backend = BackendType::CPU, size_t batch_size = 8)
        : weights_path(weights_path), model_path(model_path), backend(backend), batch_size(batch_size)
        {}
        /*!
         * \brief Binary file with network weights.
         */
        std::string                 weights_path;
        /*!
         * \brief File with network topology in XML format.
         */
        std::string                 model_path;
        /*!
         * \brief Backend to be used.
         */
        BackendType                 backend;
        /*!
         * \brief Max batch size to be used. Its value is ignored for VPU backend.
         */
        size_t                      batch_size;
    };

    /*!
     * \brief Create an instance of NN-based face analyzer
     * \param[in] params     Structure containing information about topology and weights. For VPU backend batch_size is ignored.
     * \return               Pointer to the new object.
     */
    CVA_AGR_EXPORT static std::unique_ptr<FaceAnalyzer> create(const Parameters& params);

    /*!
     * \brief Analyze a vector of images containing only faces.
     * \param[in]  imgs          Images to be processed.
     * \param[out] attributes    Results of analysis, i.e. a vector of a structures containing ages and genders.
     */
    virtual void process(const std::vector<cv::Mat>& imgs, std::vector<FaceAttributes>& attributes) = 0;

    /*!
     * \brief  Get maximum number of faces that can be processed simultaneously.
     * \return Maximum number of faces that can be processed simultaneously (i.e. by one call to the inference engine).
     */
    virtual size_t batchSize() = 0;

    /*!
     * \brief A virtual destructor for the abstract class.
     */
    virtual ~FaceAnalyzer() {}
};

}} // namespace cva::agr

#endif // CVA_AGR_AGR_HPP
