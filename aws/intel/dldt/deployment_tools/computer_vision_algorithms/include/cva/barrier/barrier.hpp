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

#ifndef ICV_BARRIER_BARRIER_HPP
#define ICV_BARRIER_BARRIER_HPP

#include <memory>
#include <string>
#include <vector>

#include <cva/ac/api.hpp>
#include <cva/ac/geometry.hpp>
#include <cva/ac/image_view.hpp>
#include <cva/ac/precision.hpp>


#ifdef CVA_BARRIER_BUILD
#define CVA_BARRIER_EXPORT CVA_AC_SHARED_LIBRARY_EXPORT
#else
#define CVA_BARRIER_EXPORT CVA_AC_SHARED_LIBRARY_IMPORT
#endif

namespace cva {
namespace barrier {

/*! \brief Returns the version number of the library. */
CVA_BARRIER_EXPORT ac::Version version();

/*! \brief An identifier of the category to which an object belongs. */
enum class ObjectLabel
{
    BACKGROUND,
    VEHICLE,
    PLATE,
};

/*!
 * \brief Class which represents detected object
 */
class DetectedObject
{
 public:
    virtual float confidence() = 0;                 //!< returns confidence of detected object in the range [0, 1]
    virtual ac::Rectangle<float> boundingBox() = 0; //!< returns bounding box of detected object
    virtual ObjectLabel label() = 0;                //!< return label of detected object
    virtual ~DetectedObject() = default;            //!< virtual destructor
};

class BarrierDetector {
public:
   /*! \brief Returns a pointer to a new object implementing ObjectDetectorCommon
    * that uses the CPU for computations.
    * \p parameters parameters of IE detector.
    */
   CVA_BARRIER_EXPORT static std::unique_ptr<BarrierDetector> createCpu();

   /*! \brief Returns a pointer to a new object implementing ObjectDetectorCommon
    * that uses the GPU for computations.
    * \p parameters parameters of IE detector.
    */
   CVA_BARRIER_EXPORT static std::unique_ptr<BarrierDetector> createGpu(const ac::Precision& precision = ac::Precision::FP32);

   /*! \brief Virtual destructor
    */
   virtual ~BarrierDetector() = default;

   /*! \brief Detects objects in the image, returns vector of detected objects
    * \p image image where objects should be detected
    */
   virtual std::vector<std::unique_ptr<DetectedObject>> detect(
       const ac::ConstImageView &image) = 0;

   enum {
        MAX_IMAGE_WIDTH = 4096, ///< The maximal supported image width.
        MAX_IMAGE_HEIGHT = 4096, ///< The maximal supported image height.
    };

};

}  // namespace barrier
}  // namespace cva

#endif // ICV_BARRIER_BARRIER_HPP
