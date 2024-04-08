import 'dart:math';

import 'package:collection/collection.dart';
import 'package:meta/meta.dart';
import 'package:simpli/src/data/utils.dart';
import 'package:simpli/src/domain/simplifier.dart';

/// A point with an optional area
@visibleForTesting
typedef PointWithArea = (Point, double?);

/// {@template visvalingam_simplifier}
/// A simplifier that uses the Visvalingam algorithm to simplify a list of
/// points.
/// {@endtemplate}
class VisvalingamSimplifier implements Simplifier {
  /// {@macro visvalingam_simplifier}
  const VisvalingamSimplifier();

  @override
  List<Point<num>> simplify(
    List<Point<num>> points, {
    double pixelTolerance = 50,
  }) {
    if (points.length < 3 || pixelTolerance <= 0) {
      return points;
    }
    final simplified = [...points];
    final heap = HeapPriorityQueue<PointWithArea>(
      // Points with lower area should be the first to be removed.
      (p0, p1) => p0.$2!.compareTo(p1.$2!),
    );

    // Contains all points besides the first and last, together with their area
    final pointsWithArea = <PointWithArea>[
      (points.first, null),
      for (var i = 1; i < points.length - 1; i++) pointWithArea(points, i),
      (points.last, null),
    ];

    // Add all points that have an area to the heap
    for (final p in pointsWithArea) {
      if (p.$2 != null) {
        heap.add(p);
      }
    }

    for (var point = heap.pop(); point != null; point = heap.pop()) {
      final area = point.$2;
      if (area == null) continue;

      // If the points area is larger than the tolerance squared, we can stop.
      if (area >= pixelTolerance * pixelTolerance) {
        break;
      }

      final index = pointsWithArea.indexOf(point);
      if (index < 0) continue;
      tryRecompute(
        pointsWithArea: pointsWithArea,
        heap: heap,
        index: index - 1,
      );
      tryRecompute(
        pointsWithArea: pointsWithArea,
        heap: heap,
        index: index + 1,
      );

      simplified.removeAt(index);
      pointsWithArea.removeAt(index);
    }
    return simplified;
  }

  /// Calculates the area of a point in a list of points.
  @visibleForTesting
  PointWithArea pointWithArea(List<Point<num>> points, int index) {
    if (index == 0 || index >= points.length - 1) {
      throw Exception('Index out of bounds for pointWithArea.');
    }
    final area = Utils.triangleArea(
      a: points[index - 1],
      b: points[index],
      c: points[index + 1],
    );
    return (points[index], area);
  }

  /// Recomputes the area of a point in a list of [pointsWithArea] and updates
  /// it in the [heap].
  ///
  /// This is not a pure function, it will mutate the [pointsWithArea] and
  /// [heap].
  @visibleForTesting
  void tryRecompute({
    required List<PointWithArea> pointsWithArea,
    required HeapPriorityQueue<PointWithArea> heap,
    required int index,
  }) {
    try {
      final oldPoint = pointsWithArea[index];
      final newPointWithArea = pointWithArea(
        pointsWithArea.map((p) => p.$1).toList(),
        index,
      );
      final newPoint = (
        newPointWithArea.$1,
        max(oldPoint.$2!, newPointWithArea.$2!),
      );

      pointsWithArea[index] = newPoint;
      heap
        ..remove(oldPoint)
        ..add(newPoint);
    } on Exception {
      // Do nothing
    }
  }
}

extension<T> on PriorityQueue<T> {
  T? pop() {
    if (isEmpty) return null;
    return removeFirst();
  }
}
