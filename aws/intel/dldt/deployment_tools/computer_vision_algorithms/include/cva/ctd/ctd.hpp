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
 * \file ctd.hpp
 * \brief File containing definition of camera tampering detector interface.
 */

#ifndef CVA_CTD_CTD_HPP
#define CVA_CTD_CTD_HPP

#include <cva/ctd/export.hpp>
#include <cva/ctd/version.hpp>

#include <opencv2/core.hpp>

#include <memory>

namespace cva { namespace ctd {

/*!
 * \enum TamperingType
 * \brief Tampering types detected by CameraTamperingDetector.
 */
enum TamperingType {
    TAMPERING_INITIALIZING  = 65536, /*!< Initializaing state of camera tampering detector (typicaly first 100 frames) */
    TAMPERING_NONE          = 0,     /*!< Normal state without tampering events */
    TAMPERING_DEFOCUS       = 1,     /*!< Defocus event detected on frame sequence (can be mixed with occlusion, displacement) */
    TAMPERING_OCCLUSION     = 2,     /*!< Occlusion event detected on frame sequence (can be mixed with defocus, displacement) */
    TAMPERING_DISPLACEMENT  = 4,     /*!< Displacement event detected on frame sequence (can be mixed with defocus, occlusion) */
};

/*!
 * \enum DetectorParameter
 * \brief Tampering detector parameters.
 */
enum class DetectorParameter {
    OCCLUSION_AREA_RATIO_THRESHOLD,                  /*!< Minimum occlusion size for detection relative to the frame size */
    OCCLUSION_AREA_RATIO_WITHOUT_MOTION_THRESHOLD,   /*!< Minimum motionless occlusion size for detection relative to the frame size */
    DEFOCUS_RATIO_THRESHOLD,                         /*!< Minimum defocus level for detection */
    DISPLACEMENT_RATIO_THRESHOLD,                    /*!< Minimum intersection size between proper camera view and new one for displacement detection relative to the frame size */
    OCCLUSION_COUNT_THRESHOLD,                       /*!< Minimum number of consecutive frames with occlusion */
    DEFOCUS_COUNT_THRESHOLD,                         /*!< Minimum number of consecutive frames with defocus */
    OCCLUSION_SENSITIVITY,                           /*!< Sensitivity of occlusion detection */
    HISTORY_SIZE_FOR_THRESHOLDS_ESTIMATION,          /*!< Maximum history size for thresholds estimation */
    FRAME_WIDTH                                      /*!< Frame width after internal resize */
};

/*!
 * \brief The main class which provides functionality of camera tampering detection
 *        on the given sequence of images.
 */
class CameraTamperingDetector
{
public:
    /*!
     * \brief  A factory for CameraTamperingDetector.
     *
     * \return An instance of a camera tampering detector implementing CameraTamperingDetector interface.
     */
    CVA_CTD_EXPORT static std::unique_ptr<CameraTamperingDetector> create();

    /*!
     * \brief Process the frame and detect camera tampering events.
     *
     * \param[in] frame     the input frame in BGR(RGBA) or grayscale format.
     *
     * \return Tampering type detected by detector.
     */
    virtual TamperingType process(const cv::Mat& frame) = 0;

    /*!
     * \brief Set floating point parameter for camera tampering detector.
     *
     * \param[in] parameter_name    parameter name.
     * \param[in] parameter_value   parameter value.
     *
     *
     * <TABLE>
     * <TR><TD>Name</TD><TD>Description</TD><TD>Value range</TD><TD>Default value</TD></TR>
     * <TR>
     *     <TD>OCCLUSION_AREA_RATIO_THRESHOLD</TD>
     *     <TD>Minimum occlusion size for detection relative to the frame size</TD>
     *     <TD>0 - 1 (detect only occlusion closing camera lens completely)</TD>
     *     <TD>0.45</TD>
     * </TR>
     * <TR>
     *     <TD>OCCLUSION_AREA_RATIO_WITHOUT_MOTION_THRESHOLD</TD>
     *     <TD>Minimum motionless occlusion size for detection relative to the frame size</TD>
     *     <TD>0 - 1 (detect only motionless occlusion closing camera lens completely)</TD>
     *     <TD>0.3</TD>
     * </TR>
     * <TR>
     *     <TD>DEFOCUS_RATIO_THRESHOLD</TD>
     *     <TD>Minimum defocus level for detection</TD>
     *     <TD>0 (detect only strong defocus) - 1</TD>
     *     <TD>0.3</TD>
     * </TR>
     * <TR>
     *     <TD>DISPLACEMENT_RATIO_THRESHOLD</TD>
     *     <TD>Minimum displacement ratio for detection</TD>
     *     <TD>0 (detect any slight camera view change) - 1 (camera view changed completely)</TD>
     *     <TD>0.5</TD>
     * </TR>
     * </TABLE>
     */
    virtual void setFloatParameter(DetectorParameter parameter_name, float parameter_value) = 0;

    /*!
     * \brief Set integer parameter for camera tampering detector.
     *
     * \param[in] parameter_name    parameter name.
     * \param[in] parameter_value   parameter value.
     *
     * <TABLE>
     * <TR><TD>Name</TD><TD>Description</TD><TD>Value range</TD><TD>Default value</TD></TR>
     * <TR>
     *     <TD>OCCLUSION_COUNT_THRESHOLD</TD>
     *     <TD>Minimum number of consecutive frames with occlusion</TD>
     *     <TD> &ge; 1 </TD>
     *     <TD>30</TD>
     * </TR>
     * <TR>
     *     <TD>DEFOCUS_COUNT_THRESHOLD</TD>
     *     <TD>Minimum number of consecutive frames with defocus</TD>
     *     <TD> &ge; 1 </TD>
     *     <TD>30</TD>
     * </TR>
     * <TR>
     *     <TD>OCCLUSION_SENSITIVITY</TD>
     *     <TD>Sensitivity of occlusion detection</TD>
     *     <TD>1 (highest sensitive) - 128 (lowest sensitive) </TD>
     *     <TD>25</TD>
     * </TR>
     * <TR>
     *     <TD>HISTORY_SIZE_FOR_THRESHOLDS_ESTIMATION</TD>
     *     <TD>Maximum history size for thresholds estimation. If 0 then do not collect data for threshold estimation</TD>
     *     <TD> &ge; 0 </TD>
     *     <TD>1000</TD>
     * </TR>
     * <TR>
     *     <TD>FRAME_WIDTH</TD>
     *     <TD>Frame width after internal resize. Height is computed relative to the original frame aspect ratio. You have the possibility of optimal trade-off choice between performance and accuracy. A small frame size can cause camera tampering events not to be detected</TD>
     *     <TD> 32 - 640 </TD>
     *     <TD>280</TD>
     * </TR>
     * </TABLE>
     */
    virtual void setIntegerParameter(DetectorParameter parameter_name, std::int32_t parameter_value) = 0;

    /*!
     * \brief Get camera tampering detector parameter estimation for last DetectorParameter::HISTORY_SIZE_FOR_THRESHOLDS_ESTIMATION frames.
     *
     * \param[in] parameter_name    parameter name.
     *
     * \return Estimated value.
     *
     * Possible values of \p parameter_name:
     *   - DetectorParameter::OCCLUSION_AREA_RATIO_THRESHOLD (estimation based on the DetectorParameter::OCCLUSION_COUNT_THRESHOLD).
     *   - DetectorParameter::OCCLUSION_AREA_RATIO_WITHOUT_MOTION_THRESHOLD (estimation based on the DetectorParameter::OCCLUSION_COUNT_THRESHOLD).
     *   - DetectorParameter::DEFOCUS_RATIO_THRESHOLD (estimation based on the DetectorParameter::DEFOCUS_COUNT_THRESHOLD).
     *   - DetectorParameter::DISPLACEMENT_RATIO_THRESHOLD.
     *
     * After the call, the history for OCCLUSION and DEFOCUS is not cleared completely, the history for DISPLACEMENT is not cleared at all.
     * For OCCLUSION last DetectorParameter::OCCLUSION_COUNT_THRESHOLD frames are left.
     * For DEFOCUS last DetectorParameter::DEFOCUS_COUNT_THRESHOLD are left.
     *
     * Parameter estimation on 1000 frames (default value for DetectorParameter::HISTORY_SIZE_FOR_THRESHOLDS_ESTIMATION) is not fast.
     * To avoid this you can perform estimation every 250-500 frames and choose minimum value for DEFOCUS_RATIO_THRESHOLD and maximum for others.
     *
     * For example, if you want to estimate DetectorParameter::OCCLUSION_AREA_RATIO_THRESHOLD on first 1000 frames
     * you can call getParameterEstimation(DetectorParameter::OCCLUSION_AREA_RATIO_THRESHOLD) 4 times every 250 frames and choose maximum value from estimation or
     * call getParameterEstimation(OCCLUSION_AREA_RATIO_THRESHOLD) once on the 1000 frame. Estimation will be the same.
     *
     * Estimation performs under the assumption of zero false alarm rate, so in some cases, the tampering event may not be detected due to high risk of false alarms.
     * If tampering detection rate more important than false alarm rate it is recommended to change values of estimated parameters.
     *
     */
    virtual float getParameterEstimation(DetectorParameter parameter_name) const = 0;

    /*!
     * \brief Add ignore direction for displacement.
     *
     * \param[in] angle_start    start of the ignore angle.
     * \param[in] angle_finish   finish of the ignore angle.
     *
     * Parameters constraints:
     *   -&pi; &le; \p angle_start &le; \p angle_finish &le; &pi;
     *
     * If you want add angle [&pi; - &pi;/4, &pi; + &pi;/4], you should split it: [&pi; - &pi;/4, &pi;], [-&pi;, -&pi; + &pi;/4].
     *
     */
    virtual void addIgnoredAngleForDisplacement(float angle_start, float angle_finish) = 0;

    /*!
     * \brief Estimate prohibited directions for displacement.
     *
     * \return OpenCV matrix with two columns: start and finish of the ignore angle.
     *
     * Estimation based on the value of DetectorParameter::DISPLACEMENT_RATIO_THRESHOLD.
     * If frame size too small estimation may not be computed.
     *
     */
    virtual cv::Mat2f estimateIgnoredAnglesForDisplacement() = 0;

    /*!
     * \brief Reset internal state to initial.
     */
    virtual void reset() = 0;

    /*!
     * Destructor.
     */
    virtual ~CameraTamperingDetector() = 0;
};

}} // namespace cva::ctd

#endif // #ifndef CVA_CTD_CTD_HPP
