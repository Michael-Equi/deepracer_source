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

#ifndef CVA_AC_ERROR_REPORTING_HPP
#define CVA_AC_ERROR_REPORTING_HPP

#include <sstream>

namespace cva { namespace ac {

/*! \brief Does nothing.
 *
 * This function only exists to help with generic programming.
 */
inline void outputToStream(std::ostream &)
{}

/*! \brief Streams \p arg0 and every element of \p args into \p os, in turn. */
template <typename Arg0, typename... Args>
inline void outputToStream(std::ostream &os, const Arg0 &arg0, const Args &...args)
{
    os << arg0;
    outputToStream(os, args...);
}

/*! \brief Throws an exception of type \p E constructed with a string created from
 * \p class_name, \p function_name, and \p args.
 *
 * \pre \p E is constructible from an \c std::string.
 * \pre \p function_name is not null.
 *
 * The exception is constructed with an std::string that contains \p class_name,
 * \p function_name and a message that consists of the string representations of \p args
 * joined together, without delimiters. The string representations are obtained by streaming
 * each element of \p args into an \c std::ostream.
 *
 * \p class_name may be null, in which case it is omitted from the string.
*/
template <typename E, typename... Args>
[[noreturn]]
inline void failRequirement(const char *class_name, const char *function_name, const Args &...args)
{
    std::ostringstream os;
    if (class_name) os << class_name << "::";
    os << function_name << ": ";

    outputToStream(os, args...);

    throw E(os.str());
}

/*! \brief Calls #failRequirement(\p class_name, \p function_name, \p args...)
 * unless \p condition is true.
 */
template <typename E, typename... Args>
inline void require(const char *class_name, const char *function_name, bool condition,
             const Args &...args)
{
    if (!condition) failRequirement<E>(class_name, function_name, args...);
}

}} // namespace cva::ac

#endif // CVA_AC_ERROR_REPORTING_HPP
