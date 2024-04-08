import 'dart:math' as math;
import 'package:scribble/scribble.dart';
import 'package:scribble/src/domain/iterable_removed_x.dart';
import 'package:simpli/simpli.dart';

/// {@template simplifier}
/// An interface for simplifying a list of points.
/// {@endtemplate}
abstract class Simplifier {
  /// {@macro simplifier}
  const Simplifier();

  /// Simplifies the given list of points.
  List<Point> simplify(List<Point> points, {required double pixelTolerance});

  /// Simplifies an entire sketch by simplifying each line in the sketch.
  Sketch simplifySketch(Sketch sketch, {required double pixelTolerance}) {
    return sketch.copyWith(
      lines: [
        for (final l in sketch.lines)
          l.copyWith(
            points: simplify(l.points, pixelTolerance: pixelTolerance),
          ),
      ],
    );
  }
}

/// {@template visvalingam_simplifier}
/// A [Simplifier], that uses the Visvalingam algorithm to simplify a list of
/// points.
/// {@endtemplate}
class VisvalingamSimplifier extends Simplifier {
  /// {@macro visvalingam_simplifier}
  const VisvalingamSimplifier();

  @override
  List<Point> simplify(List<Point> points, {required double pixelTolerance}) {
    final mathPoints = points.map((e) => math.Point(e.x, e.y)).toList();

    final simplified = Simpli.visvalingam(
      mathPoints,
      pixelTolerance: pixelTolerance,
    );
    final removedIndices = mathPoints.removedIndices(simplified.cast());
    return points.withRemovedIndices(removedIndices.toSet()).toList();
  }
}
