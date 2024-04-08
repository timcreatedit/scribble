import 'dart:math';

import 'package:simpli/src/domain/simplifier.dart';

/// {@template simpli}
/// Line simplification algorithms, made simple! Sporting Ramer-Douglas-Peucker
/// and Visvalingam
/// {@endtemplate}
abstract class Simpli {
  /// {@macro simpli}
  const Simpli._();

  /// Simplifies a list of points using the Ramer-Douglas-Peucker algorithm
  /// using the given [pixelTolerance].
  static List<Point> ramerDouglasPeucker(
    List<Point> points, {
    double pixelTolerance = 50.0,
  }) {
    return const Simplifier.ramerDouglasPeucker()
        .simplify(points, pixelTolerance: pixelTolerance);
  }

  /// Simplifies a list of points using the Visvalingam algorithm
  /// using the given [pixelTolerance].
  static List<Point<num>> visvalingam(
    List<Point<num>> points, {
    double pixelTolerance = 50.0,
  }) {
    return const Simplifier.visvalingam().simplify(points);
  }
}
