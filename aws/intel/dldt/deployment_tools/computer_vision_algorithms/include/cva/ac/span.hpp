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

#ifndef CVA_AC_SPAN_HPP
#define CVA_AC_SPAN_HPP

#include "error_reporting.hpp"

#include <cstdlib>
#include <stdexcept>
#include <type_traits>
#include <vector>

namespace cva { namespace ac {

/*! \brief A non-owning reference to a (possibly-empty) contiguous sequence of objects of type \p T.
 *
 * A span is defined by a pair of pointers: its start and end points. If the start and
 * end points are the same, the span references an empty sequence. Otherwise, it references
 * a sequence containing all objects that are between the one pointed to by the start point
 * (inclusive) and the one pointed to by the end point (exclusive).
 */
template <typename T>
class Span
{
public:
    /*! \brief Equivalend to Span(\c nullptr, \c nullptr). */
    constexpr Span() : begin_(nullptr), end_(nullptr) {}

    /*! \brief Constructs a span with \p begin as the start point and \p end as the end point.
     *
     * \pre Either \p begin and \p end are both null, or neither are.
     * \pre \p begin <= \p end
     */
    Span(T *begin, T *end) : begin_(begin), end_(end)
    {
        require<std::invalid_argument>("Span", __func__, (begin == nullptr) == (end == nullptr),
            "begin must be null if and only if end is");
        require<std::invalid_argument>("Span", __func__, begin <= end,
            "begin must be <= end");
    }

    /*! \brief If begin is null, equivalent to Span(\c nullptr, \c nullptr);
     * otherwise, equivalent to Span(\p begin, \p begin + \p size).
     *
     * \pre Either \p size is 0, or \p begin is not null.
     */
    Span(T *begin, std::size_t size) : begin_(begin), end_(begin ? begin + size : nullptr)
    {
        require<std::invalid_argument>("Span", __func__, begin || size == 0,
            "begin must not be null unless size is 0");
    }

    /*! \brief Constructs a span that refers to the same sequence as \p that.
     *
     * \pre \p T is either \p U or \p U with additional cv-qualifiers.
     */
    template <typename U,
              typename = typename std::enable_if<
                  std::is_convertible<U(*)[], T(*)[]>::value>::type>
    constexpr Span(Span<U> that) : begin_(that.begin()), end_(that.end())
    {}

    /*! \brief Returns the number of elements in the referenced sequence. */
    constexpr std::size_t size() const { return end_ - begin_; }

    /*! \brief Returns the start point. */
    constexpr T *begin() const { return begin_; }
    /*! \brief Returns the end point. */
    constexpr T *end() const { return end_; }

    /*! \brief Returns a reference to the element of the referenced sequence with index \p i.
     *
     * \pre \p i < size()
     */
    T &operator [](std::size_t i) const
    {
        require<std::out_of_range>("Span", __func__, i < size(),
            "i (", i, ") must be < size() (", size(), ")");
        return begin_[i];
    }

    /*! \brief Returns a span with begin() + \p start as the start point and begin() + \p end
     * as the end point.
     *
     * \pre \p start <= \p end <= size()
     */
    Span subspan(std::size_t start, std::size_t end) const {
        require<std::invalid_argument>("Span", __func__, start <= end,
            "start (", start, ") must be <= end (", end, ")");
        require<std::out_of_range>("Span", __func__, end <= size(),
            "end (", end, ") must be <= size() (", size(), ")");

        return Span(begin_ + start, begin_ + end);
    }

private:
    T *begin_, *end_;
};

/*! \brief Returns a copy of \p span.
 *
 * This function exists to simplify generic programming.
 */
template <typename T>
Span<T> toSpan(Span<T> span)
{
    return span;
}

/*! \brief Returns a span that references the sequence of all elements of \p array. */
template <typename T, std::size_t N>
Span<T> toSpan(T (&array)[N])
{
    return {array, N};
}

/*! \brief Returns a span that references the sequence of all elements of \p vector.
 *
 * The span is invalidated whenever the return value of <tt>vector.data</tt> is invalidated.
 */
template <typename T, typename Allocator>
Span<T> toSpan(std::vector<T, Allocator> &vector)
{
    return {vector.data(), vector.size()};
}

/*! \overload */
template <typename T, typename Allocator>
Span<const T> toSpan(const std::vector<T, Allocator> &vector)
{
    return {vector.data(), vector.size()};
}

}} // namespace cva::ac

#endif // CVA_AC_SPAN_HPP
