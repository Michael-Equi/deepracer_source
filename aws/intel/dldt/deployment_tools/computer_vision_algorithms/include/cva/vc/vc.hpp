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

#ifndef CVA_VC_VC_HPP
#define CVA_VC_VC_HPP

#include <cva/ac/api.hpp>
#include <cva/ac/image_view.hpp>
#include <cva/ac/span.hpp>
#include <cva/ac/precision.hpp>

#include <cstdint>
#include <cstdlib>
#include <memory>


#ifdef CVA_VC_BUILD
#define CVA_VC_EXPORT CVA_AC_SHARED_LIBRARY_EXPORT
#else
#define CVA_VC_EXPORT CVA_AC_SHARED_LIBRARY_IMPORT
#endif

namespace cva { namespace vc {

/*! \brief Returns the version number of the library. */
CVA_VC_EXPORT ac::Version version();

/*! \brief Class which represents vehicle classifier that can estimate, 
 * for an image depicting an vehicle, type of the vehicle and its color.
 *
 * The supported types include:
 * - \c bus
 * - \c car
 * - \c truck
 * - \c van
 *
 * The supported colors include:
 * - \c black
 * - \c blue
 * - \c gray
 * - \c green
 * - \c red
 * - \c white
 * - \c yellow
 *
 * typeDescription() and colorDescription() can be used to determine the index
 * of each supported type or color, respectively.
 */
class VehicleClassifier
{
public: 
    /*! \brief Returns the number of vehicle types the classifier knows. */
    CVA_VC_EXPORT static std::size_t numTypes();

    /*! \brief Returns the number of colors the classifier knows. */
    CVA_VC_EXPORT static std::size_t numColors();

    /*! \brief Returns a text description for vehicle type with index \p class_index.
     *
     * \pre \p class_index < numTypes()
     *
     * The return value is a pointer to a NUL-terminated non-empty string of printable
     * ASCII characters. The string will remain valid for the entire lifetime of
     * the library and must not be freed.
     */
    CVA_VC_EXPORT static const char *typeDescription(std::size_t class_index);

    /*! \brief Returns a text description for vehicle color with index \p class_index.
     *
     * \pre \p class_index < numColors()
     *
     * The return value is a pointer to a NUL-terminated non-empty string of printable
     * ASCII characters. The string will remain valid for the entire lifetime of
     * the library and must not be freed.
     */
    CVA_VC_EXPORT static const char *colorDescription(std::size_t class_index);


    /*! \brief Returns a pointer to a new object implementing VehicleClassifier
     * that uses the CPU for computations.
     *
     * \p batch_size is the maximum number of images that classify() will be able to handle at once.
     * If size of input for classify() is bigger then batch_size, there will be more than one inference call.
     * Increasing this parameter will also increase the amount of memory used by the object.
     */
    CVA_VC_EXPORT static std::unique_ptr<VehicleClassifier> createCpu(const std::size_t batch_size = 1);

    /*! \brief Returns a pointer to a new object implementing VehicleClassifier
     * that uses the GPU for computations.
     *
     * \pre \p precision is ac::Precision::FP32 or ac::Precision::FP16.
     *
     * \p precision selects precision of the model.
     *
     * \p batch_size is the maximum number of images that classify() will be able to handle at once.
     * If size of input for classify() is bigger then \p batch_size, there will be more than one inference call.
     * Increasing this parameter will also increase the amount of memory used by the object.
     */
    CVA_VC_EXPORT static std::unique_ptr<VehicleClassifier> createGpu(
        const ac::Precision precision = ac::Precision::FP32, const std::size_t batch_size = 1);

    /*! \brief Virtual destructor.
     */
    virtual ~VehicleClassifier() = default;

    /*! \brief Classify \p images, filling \p colors_probabilities and \p types_probabilities.
     *
     * \pre <tt>images.size()</tt> == <tt>colors_probabilities.size()</tt>
     * \pre <tt>images.size()</tt> == <tt>types_probabilities.size()</tt>
     * \pre For every \c b, <tt>images[b].format()</tt> is ImageFormat::RGB_8 or ImageFormat::BGR_8
     * \pre For every \c b, <tt>images[b].width()</tt> <= #MAX_IMAGE_WIDTH
     * \pre For every \c b, <tt>images[b].height()</tt> <= #MAX_IMAGE_HEIGHT
     * \pre For every \c b, <tt>color_probabilities[b].size()</tt> == numColors()
     * \pre For every \c b, <tt>type_probabilities[b].size()</tt> == numTypes()
     *
     * \post For every \c b and \c i, <tt>color_probabilities[b][i]</tt> is the probability that the vehicle
     * <tt>images[b]</tt> depicts has color with index \c i.
     *
     * \post For every \c b and \c i, <tt>type_probabilities[b][i]</tt> is the probability that the vehicle
     * <tt>images[b]</tt> depicts has type with index \c i.
     */
    virtual void classify(const ac::Span<const ac::ConstImageView> images,
                          const ac::Span<const ac::Span<float>> colors_probabilities,
                          const ac::Span<const ac::Span<float>> types_probabilities) = 0;

    enum {
        MAX_IMAGE_WIDTH = 4096, ///< The maximal supported image width.
        MAX_IMAGE_HEIGHT = 4096, ///< The maximal supported image height.
    };
};

}} // namespace cva::vc

#endif // CVA_VC_VC_HPP
