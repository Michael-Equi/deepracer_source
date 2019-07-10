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

#ifndef CVA_AC_GEOMETRY_HPP
#define CVA_AC_GEOMETRY_HPP

#include "error_reporting.hpp"

#include <stdexcept>
#include <type_traits>
#include <algorithm>

namespace cva { namespace ac {

/*! \brief A point in two-dimensional space whose coordinates are of type \p T.
 *
 * \pre T is an arithmetic type.
 */
template <typename T>
struct Point2
{
    static_assert(std::is_arithmetic<T>::value, "T must be an arithmetic type");

    /*! \brief Constructs a point whose coordinates are both \p T(). */
    constexpr Point2() : x{}, y{} {}

    /*! \brief Constructs a point with given coordinates \p x and \p y. */
    constexpr Point2(T x, T y) : x(x), y(y) {}

    T x; /*!< The x coordinate. */
    T y; /*!< The y coordinate. */

    /*! \brief Returns whether both coordinates of \p left compare equal to those of \p right. */
    friend bool operator==(const Point2 &left, const Point2 &right)
    {
        return left.x == right.x && left.y == right.y;
    }

    /*! \brief Returns the opposite of operator==(). */
    friend bool operator!=(const Point2 &left, const Point2 &right)
    {
        return !(left == right);
    }
};

/*! \brief A rectangle of points with coordinates of type \p T.
 *
 * A rectangle's start point is its corner with the smallest coordinates,
 * while its end point is its corner with the largest coordinates. A rectangle
 * is assumed to include all points with coordinates between its start point's
 * (inclusive) and its end point's (exclusive).
 */
template <typename T>
class Rectangle
{
public:
    /*! \brief Constructs a rectangle whose start and end points are both (T(), T()). */
    constexpr Rectangle() = default;

    /*! \brief Constructs a rectangle with the given start and end points.
     *
     * \pre start.x <= end.x
     * \pre start.y <= end.y
     */
    Rectangle(const Point2<T> &start, const Point2<T> &end)
        : start_(start), end_(end)
    {
        require<std::invalid_argument>("Rectangle", __func__, start.x <= end.x,
            "start.x (", start.x, ") must be <= end.x (", end.x, ")");
        require<std::invalid_argument>("Rectangle", __func__, start.y <= end.y,
            "start.y (", start.y, ") must be <= end.y (", end.y, ")");
    }

    /*! \brief Equivalent to <tt>Rectangle(Point2<T>(start_x, start_y), Point2<T>(end_x, end_y))</tt>. */
    Rectangle(T start_x, T start_y, T end_x, T end_y)
        : Rectangle(Point2<T>(start_x, start_y), Point2<T>(end_x, end_y)) {}

    /*! \brief Returns intersection rectangle */
    friend Rectangle<T> operator& (const Rectangle<T>& left, const Rectangle<T>& right)
    {
        T startx = std::max(left.startX(), right.startX());
        T starty = std::max(left.startY(), right.startY());
        T endx =   std::min(left.endX(), right.endX());
        T endy =   std::min(left.endY(), right.endY());

        if ((startx > endx) || (starty > endy))
        {
            return Rectangle();
        }

        return Rectangle(startx, starty, endx, endy);
    }
    
    /*! \brief Returns area of the rectangle */
    T area() const { return (end_.x - start_.x) * (end_.y - start_.y); }

    /*! Returns the start point as a Point2. */
    constexpr Point2<T> start() const { return start_; }
    /*! Returns the end point as a Point2. */
    constexpr Point2<T> end() const { return end_; }

    /*! Returns the x coordinate of the start point. */
    constexpr T startX() const { return start_.x; }
    /*! Returns the y coordinate of the start point. */
    constexpr T startY() const { return start_.y; }
    /*! Returns the x coordinate of the end point. */
    constexpr T endX() const { return end_.x; }
    /*! Returns the y coordinate of the end point. */
    constexpr T endY() const { return end_.y; }

private:
    Point2<T> start_, end_;
};

}} // namespace cva::ac

#endif // CVA_AC_GEOMETRY_HPP
