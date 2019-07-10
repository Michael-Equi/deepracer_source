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

#ifndef CVA_PAC_HPP
#define CVA_PAC_HPP

#include <cva/ac/api.hpp>
#include <cva/ac/image_view.hpp>
#include <cva/ac/span.hpp>
#include <cva/ac/precision.hpp>

#include <cstdint>
#include <cstdlib>
#include <memory>


#ifdef CVA_PAC_BUILD
#define CVA_PAC_EXPORT CVA_AC_SHARED_LIBRARY_EXPORT
#else
#define CVA_PAC_EXPORT CVA_AC_SHARED_LIBRARY_IMPORT
#endif

namespace cva { namespace pac {

/*! \brief Returns the version number of the library. */
CVA_PAC_EXPORT ac::Version version();

/*! \brief A classifier that can estimate, for an image depicting a person,
 * whether that person has certain attributes.
 *
 * The supported attributes are:
 *
 * - \c is_male
 * - \c has_hat
 * - \c has_longsleeves
 * - \c has_longpants
 * - \c has_longhair
 * - \c has_coat_jacket
 */
class PersonAttributesClassifier
{
public: 
    /*! \brief Returns the number of attributes the classifier knows.
     */
    CVA_PAC_EXPORT static std::size_t numAttributes();


    /*! \brief Returns a text description for person attribute with index \p class_index.
     *
     * \pre \p attr_index < numAttributes()
     *
     * The return value is a pointer to a NUL-terminated non-empty string of printable
     * ASCII characters. The string will remain valid for the entire lifetime of
     * the library and must not be freed.
     */
    CVA_PAC_EXPORT static const char *attributeDescription(std::size_t attr_index);


    /*! \brief Returns a pointer to a new object implementing PersonAttributesClassifier
     * that uses the CPU for computations.
     *
     * \p batch_size is the maximum number of images that classify() will be able to handle at once.
     * If size of input for classify() is bigger then \p batch_size, there will be more than one inference call.
     * Increasing this parameter will also increase the amount of memory used by the object.
     *
     */
    CVA_PAC_EXPORT static std::unique_ptr<PersonAttributesClassifier> createCpu(std::size_t batch_size = 1);

    /*! \brief Returns a pointer to a new object implementing PersonAttributesClassifier
     * that uses the GPU for computations.
     *
     * \p precision specifies precision of the model.
     *
     * \p batch_size is the maximum number of images that classify() will be able to handle at once.
     * If size of input for classify() is bigger then \p batch_size, there will be more than one inference call.
     * Increasing this parameter will also increase the amount of memory used by the object.
     */
    CVA_PAC_EXPORT static std::unique_ptr<PersonAttributesClassifier> createGpu(
        ac::Precision precision = ac::Precision::FP32, std::size_t batch_size = 1);

    /*! \brief Virtual destructor.
     */
    virtual ~PersonAttributesClassifier() = default;

    /*! \brief Classify \p images, filling \p attrs_predictions.
     *
     * \pre <tt>images.size()</tt> == <tt>attrs_predictions.size()</tt>
     * \pre For every \c b, <tt>images[b].format()</tt> is ImageFormat::RGB_8 or ImageFormat::BGR_8
     * \pre For every \c b, <tt>images[b].width()</tt> <= #MAX_IMAGE_WIDTH
     * \pre For every \c b, <tt>images[b].height()</tt> <= #MAX_IMAGE_HEIGHT
     * \pre For every \c b, <tt>attrs_predictions[b].size()</tt> == numAttributes()
     *
     * \post For every \c b and \c i, <tt>attrs_predictions[b][i]</tt> is 1 if the the person
     * <tt>images[b]</tt> depicts is estimated to have the attribute with index \c i,
     * and 0 otherwise.
     */

    virtual void classify(ac::Span<const ac::ConstImageView> images,
                          ac::Span<const ac::Span<int>> attrs_predictions) = 0;

    enum {
        MAX_IMAGE_WIDTH = 4096, ///< The maximal supported image width.
        MAX_IMAGE_HEIGHT = 4096, ///< The maximal supported image height.
    };
};

}} // namespace cva::pac

#endif // CVA_PAC_VC_HPP
