import 'dart:math';

import 'package:flutter/foundation.dart';
import 'package:scribble/src/domain/model/point/point.dart';
import 'package:scribble/src/domain/simplification_repository.dart';

/// {@template dp_simplification_repository}
/// A repository for simplifying a list of points using the Douglas-Peucker
/// algorithm.
/// {@endtemplate}
class DpSimplificationRepository implements SimplificationRepository {
  /// {@macro dp_simplification_repository}
  const DpSimplificationRepository();

  @override
  List<Point> simplifyPoints(
    List<Point> points, {
    double degree = 0.5,
  }) {
    final epsilon = degree * 100;
    if (points.length < 3 || epsilon <= 0) {
      return points;
    }
    var maxDistance = 0.0;
    var index = 0;
    for (var i = 1; i < points.length - 1; i++) {
      final distance = perpendicularDistance(
        point: points[i],
        lineStart: points.first,
        lineEnd: points.last,
      );
      if (distance > maxDistance) {
        maxDistance = distance;
        index = i;
      }
    }

    if (maxDistance <= epsilon) return points;

    return [
      ...simplifyPoints(points.sublist(0, index), degree: degree),
      ...simplifyPoints(points.sublist(index + 1), degree: degree),
    ];
  }

  /// Calculates the perpendicular distance from a point to a line segment.
  ///
  /// From https://en.wikipedia.org/wiki/Distance_from_a_point_to_a_line
  @visibleForTesting
  double perpendicularDistance({
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
