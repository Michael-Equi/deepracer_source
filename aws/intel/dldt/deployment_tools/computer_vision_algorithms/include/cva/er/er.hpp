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

#ifndef CVA_ER_ER_HPP
#define CVA_ER_ER_HPP

#include <cstdint>
#include <cstdlib>
#include <memory>
#include <vector>

#include <cva/ac/api.hpp>
#include <cva/ac/image_view.hpp>
#include <cva/ac/span.hpp>
#include <cva/ac/precision.hpp>

#ifdef CVA_ER_BUILD
#define CVA_ER_EXPORT CVA_AC_SHARED_LIBRARY_EXPORT
#else
#define CVA_ER_EXPORT CVA_AC_SHARED_LIBRARY_IMPORT
#endif

namespace cva { namespace er {

/*! \brief Returns the version number of the library. */
CVA_ER_EXPORT ac::Version version();

/*! \brief Interface to implementation of emotion recognizer.
 *
 * The implementation allows to recognize the following emotions:
 *     - neutral
 *     - happy
 *     - sad
 *     - surprise
 *     - anger
 *
 * The object has no mutable state. That is, it will always estimate the same
 * probabilities if it is given the same image.
 */

class EmotionsRecognizer
{
 public:
    /*! \brief Returns the number of recognizable emotions the recognizer knows.
     *
     * Will not throw runtime exceptions.
     */
    CVA_ER_EXPORT static std::size_t numClasses();

    /*! \brief Returns a text description for the object class with index \p class_index.
     *
     * \param[in] class_index I of class
     * \pre \p class_index < numClasses()
     *
     * The return value is a pointer to a NUL-terminated non-empty string of printable
     * ASCII characters. The string will remain valid for the entire lifetime of
     * the library and must not be freed.
     *
     * Will not throw runtime exceptions.
     */
    CVA_ER_EXPORT static const char *classDescription(std::size_t class_index);

    /*! \brief Returns a pointer to a new object implementing EmotionsRecognizer
     * that uses the CPU for computations.
     *
     * \p batch_size is the maximum number of images that recognizeBatch() will be able to
     * handle. Increasing of this parameter will also increase the amount of memory used by
     * the object.
     *
     * \pre 1 <= \p batch_size <= #MAX_BATCH_SIZE
     */
    CVA_ER_EXPORT static std::unique_ptr<EmotionsRecognizer> createCpu(std::size_t batch_size = 1);

    /*! \brief Returns a pointer to a new object implementing EmotionsRecognizer
     * that uses the GPU for computations.
     *
     * \pre \p precision is ac::Precision::FP32 or ac::Precision::FP16.
     *
     * The created recognizer will perform computations with the specified \p precision.
     *
     * See createCpu() for the meaning of and preconditions on \p batch_size.
     */
    CVA_ER_EXPORT static std::unique_ptr<EmotionsRecognizer> createGpu(ac::Precision precision = ac::Precision::FP32, std::size_t batch_size = 1);

    virtual ~EmotionsRecognizer() = default;

    /*! \brief Recognize emotion on \p image, filling \p probabilities.
     *
     * \param[in] image         Input face image.
     * \param[out] probabilities Probability distribution across emotions.
     * \pre <tt>image.format()</tt> is ImageFormat::RGB_8 or ImageFormat::BGR_8
     * \pre <tt>image.width()</tt> <= #MAX_IMAGE_WIDTH
     * \pre <tt>image.height()</tt> <= #MAX_IMAGE_HEIGHT
     * \pre <tt>probabilities.size()</tt> == numClasses()
     *
     * \post For every \c i, probabilities[i] is the probability that the object
     * \p image depicts belongs to the class with index \c i.
     *
     * This method must not be invoked on the same object from more than one
     * thread at a time.
     */
    virtual void recognize(const ac::ConstImageView &image,
                           ac::Span<float> probabilities) = 0;

   /*! \brief Recognize emotion on \p images, filling the corresponding element
    * of \p probability_buffers.
    *
    * Equivalent to a sequence of recognize() calls on each pair of corresponding elements
    * from \p images and \p probability_buffers, but may execute faster. This call will result in
    * multiple infer calls if <tt>images.size()</tt> is bigger than \c batch_size.
    *
    * \param[in] images Input face images.
    * \param[out] probability_buffers Probability distributions across emotions.
    * \pre <tt>images.size()</tt> == <tt>probability_buffers.size()</tt>
    * \pre Each element of \p images satisfies the preconditions on \p image in recognize().
    * \pre Each element of \p probability_buffers satisfy the preconditions on
    *      \p probabilities in recognize().
    *
    * This method must not be invoked on the same object from more than one
    * thread at a time.
    */
    virtual void recognizeBatch(ac::Span<const ac::ConstImageView> images,
                                ac::Span<const ac::Span<float>> probability_buffers) = 0;

    /*! \brief Returns index of recognized emotion on images.
     *
     * Equivalent to the call of <tt>recognize(image, probability)</tt> and
     * find the index that corresponds to the emotion with the maximal probability
     *
     * \param[in] image Input face image.
     * \pre <tt>image.format()</tt> is ImageFormat::RGB_8 or ImageFormat::BGR_8
     * \pre <tt>image.width()</tt> <= #MAX_IMAGE_WIDTH
     * \pre <tt>image.height()</tt> <= #MAX_IMAGE_HEIGHT
     *
     * This method must not be invoked on the same object from more than one
     * thread at a time.
     */
    virtual int recognize(const ac::ConstImageView &image) = 0;

    /*! \brief Return index of recognized emotions corresponging.
     *
     * Equivalent to a sequence of recognize() calls on each image. This call will result in
     * multiple infer calls if <tt>images.size()</tt> is bigger than \c batch_size.
     *
     * \param[in] images Input face images.
     *
     * This method must not be invoked on the same object from more than one
     * thread at a time.
     */
    virtual std::vector<int> recognizeBatch(ac::Span<const ac::ConstImageView> images) = 0;

    enum {
        MAX_IMAGE_WIDTH = 4096,  ///< The maximal supported image width.
        MAX_IMAGE_HEIGHT = 4096,  ///< The maximal supported image height.
    };

    enum {
        MAX_BATCH_SIZE = 16,  ///< The maximal supported batch size.
    };
};

}  // namespace er
}  // namespace cva

#endif // CVA_ER_ER_HPP
