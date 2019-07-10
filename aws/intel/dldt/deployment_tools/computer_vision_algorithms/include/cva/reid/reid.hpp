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

#ifndef CVA_REID_REID_HPP
#define CVA_REID_REID_HPP

#include <cva/ac/api.hpp>
#include <cva/ac/image_view.hpp>
#include <cva/ac/span.hpp>
#include <cva/ac/precision.hpp>

#include <cstdint>
#include <cstdlib>
#include <memory>

#ifdef CVA_REID_BUILD
#define CVA_REID_EXPORT CVA_AC_SHARED_LIBRARY_EXPORT
#else
#define CVA_REID_EXPORT CVA_AC_SHARED_LIBRARY_IMPORT
#endif

namespace cva { namespace reid {
/*! \brief Returns version number of the library. */
CVA_REID_EXPORT ac::Version version();

/*! \brief Interface to implementation of person reidentifier.
 *
 * A PersonReidentifier object allows to calculate for a pedestrian image
 * an "embedding" -- a float vector, characterizing the pedestrian appearance.
 *
 * If there is a pedestrian on a frame received from some surveillance camera,
 * and there is a pedestrian on another frame received from the same (or even
 * from another) camera, the patches of the frames containing the pedestrians
 * may be passed to a PersonReidentifier object to calculate the embeddings.
 *
 * Then a float value characterizing similarity of appearance of the pedestrians
 * may be calculated as follows:
 *     - normalize the both embedding vectors in the Euclidean space
 *     - get the dot product of the normalized vectors
 *
 * Applying a threshold to this similarity value may give a decision if these
 * pedestrians are the same person (shot from two points of view or in two
 * different time moments) or different persons.
 *
 * Note that the PersonReidentifier object has no mutable state. That is, it
 * will always calculate the same embedding if it is given the same image.
 */
class PersonReidentifier
{
public:
    /*! \brief Returns the size of embedding the reidentifier produces.
     *
     * Will not throw runtime exceptions.
     */
    CVA_REID_EXPORT static std::size_t embdSize();

    /*! \brief Returns a pointer to a new object implementing PersonReidentifier
     * that uses the CPU for computations.
     *
     * \p batch_size is the maximum number of images that calcEmbdBatch() will be able to
     * handle. Increasing of this parameter will also increase the amount of memory used by
     * the object.
     *
     * \pre 1 <= \p batch_size <= #MAX_BATCH_SIZE
     */
    CVA_REID_EXPORT static std::unique_ptr<PersonReidentifier> createCpu(const std::size_t batch_size = 8);
    /*! \brief Returns a pointer to a new object implementing PersonReidentifier
     * that uses the GPU for computations.
     *
     * \p precision depicts precision of the model.
     * \pre <tt>precision</tt> is ac::Precision::FP32 or ac::Precision::FP16.
     *
     * See createCpu() for the meaning of and preconditions on \p batch_size.
     */
    CVA_REID_EXPORT static std::unique_ptr<PersonReidentifier> createGpu(const ac::Precision precision = ac::Precision::FP32, const std::size_t batch_size = 8);

    virtual ~PersonReidentifier() = default;

    /*! \brief Calculate embedding \p for an image.
     *
     * \param[in]  image          input image
     * \param[out] embeddings     output calculated embeddings
     * \pre <tt>image.format()</tt> is ImageFormat::RGB_8 or ImageFormat::BGR_8
     * \pre <tt>image.width()</tt> <= #MAX_IMAGE_WIDTH
     * \pre <tt>image.height()</tt> <= #MAX_IMAGE_HEIGHT
     * \pre <tt>embeddings.size()</tt> == <tt>embdSize()</tt>
     *
     * \pre Please note, that <tt>embeddings</tt> should be pre-allocated first, before passing to function.
     *
     * This method must not be invoked on the same object from more than one
     * thread at a time.
     */
    virtual void calcEmbd(const ac::ConstImageView &image,
                          ac::Span<float> embeddings) = 0;
   /*! \brief Calculate embeddings for a batch of \p images, filling the corresponding elements
    * of \p embd_buffers.
    *
    * Equivalent to a sequence of calcEmbd() calls on each pair of corresponding elements
    * from \p images and \p embeddings buffers, but may execute faster. This call will result in multiple
    * infer calls if <tt>images.size()</tt> is bigger than \c batch_size.
    *
    * \param[in]  images          input images
    * \param[out] embd_buffers    output calculated embedding buffers
    * \pre <tt>embd_buffers.size()</tt> == <tt>images.size()</tt>
    *
    * \pre Please note, that <tt>embd_buffers</tt> should be pre-allocated first, before passing to function.
    *
    * \pre Each element of \p images satisfies the preconditions on \p image in calcEmbd().
    * \pre Each element of \p embd_buffers satisfy the preconditions on
    *      \p embeddings in calcEmbd().
    *
    * This method must not be invoked on the same object from more than one
    * thread at a time.
    */
    virtual void calcEmbdBatch(ac::Span<const ac::ConstImageView> images,
                               ac::Span<const ac::Span<float>> embd_buffers) = 0;


    enum {
        MAX_IMAGE_WIDTH = 4096, ///< The maximal supported image width.
        MAX_IMAGE_HEIGHT = 4096, ///< The maximal supported image height.
    };


    enum {
        MAX_BATCH_SIZE = 16, ///< The maximal supported batch size.
    };
};

}} // namespace cva::reid

#endif // CVA_REID_REID_HPP
