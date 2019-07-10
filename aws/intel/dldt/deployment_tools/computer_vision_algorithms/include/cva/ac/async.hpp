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

#ifndef CVA_AC_ASYNC_HPP
#define CVA_AC_ASYNC_HPP

#include <cstdint>

namespace cva { namespace ac {

/*! \brief Result of a wait for an asynchronous operation's completion. */
enum class WaitResult
{
    COMPLETED, /*!< The operation has completed. */
    TIMED_OUT, /*!< The wait has timed out. */
};

/*! \brief A handle to an asynchronous operation that is either in progress
 * or has completed.
 *
 * When a PendingRequest is created, the operation is considered to be in
 * progress. While it may finish asynchronously, it will not be considered
 * completed until one of the wait methods is called.
 */
class PendingRequest
{
public:
    /*! \brief Releases resources associated with the asynchronous operation.
     *
     * If the operation is still in progress, it is canceled. In this case
     * the operation's outputs will be left with unspecified contents.
     */
    virtual ~PendingRequest() {}

    /*! \brief Waits for the asynchronous operation to finish and marks it as completed.
     *
     * It it has already completed, does nothing and returns immediately.
     */
    virtual void wait() = 0;

    /*! \brief Waits for the asynchronous operation to finish for up to \p timeout_ms
     * milliseconds.
     *
     * If it finishes within that time, marks it as completed and returns WaitResult::COMPLETED.
     * Otherwise, returns WaitResult::TIMED_OUT.
     *
     * If it has already completed, does nothing and returns WaitResult::COMPLETED.
     */
    virtual WaitResult timedWait(std::uint64_t timeout_ms) = 0;

    /*! \brief Returns whether the asynchronous operation has completed successfully.
     *
     * \pre The operation has completed.
     *
     * If this returns false, than the operation's outputs have unspecified contents.
     */
    virtual bool successful() const = 0;
};

}} // namespace cva::ac

#endif // CVA_AC_ASYNC_HPP
