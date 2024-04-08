import 'dart:math';

/// A collection of utility functions.
abstract class Utils {
  const Utils._();

  /// Calculates the perpendicular distance from a point to a line segment.
  ///
  /// From https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line
  static double perpendicularDistance({
    required Point point,
    required Point lineStart,
    required Point lineEnd,
  }) {
    final numerator = ((lineEnd.x - lineStart.x) * (lineStart.y - point.y) -
            (lineStart.x - point.x) * (lineEnd.y - lineStart.y))
        .abs();
    final denominator =
        sqrt(pow(lineEnd.x - lineStart.x, 2) + pow(lineEnd.y - lineStart.y, 2));
    return numerator / denominator;
  }
}
