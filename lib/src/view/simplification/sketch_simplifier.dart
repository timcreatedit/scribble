import 'dart:math' as math;
import 'package:scribble/scribble.dart';
import 'package:scribble/src/domain/iterable_removed_x.dart';
import 'package:simpli/simpli.dart';

/// {@template sketch_simplifier}
/// An interface for simplifying a sketch and it's lines.
/// {@endtemplate}
abstract class SketchSimplifier {
  /// {@macro sketch_simplifier}
  const SketchSimplifier();

  /// Simplifies the given list of points.
  SketchLine simplify(SketchLine line, {required double pixelTolerance});

  /// Simplifies an entire sketch by simplifying each line in the sketch.
  Sketch simplifySketch(Sketch sketch, {required double pixelTolerance}) {
    if (pixelTolerance == 0) return sketch;
    return sketch.copyWith(
      lines: [
        for (final l in sketch.lines)
          simplify(l, pixelTolerance: pixelTolerance),
      ],
    );
  }
}

/// {@template visvalingam_simplifier}
/// A [SketchSimplifier], that uses the Visvalingam algorithm to simplify a list
/// of points.
/// {@endtemplate}
class VisvalingamSimplifier extends SketchSimplifier {
  /// {@macro visvalingam_simplifier}
  const VisvalingamSimplifier();

  @override
  SketchLine simplify(SketchLine line, {required double pixelTolerance}) {
    if (pixelTolerance == 0) return line;

    final mathPoints = line.points.map((e) => math.Point(e.x, e.y)).toList();

    final simplified = Simpli.visvalingam(
      mathPoints,
      pixelTolerance: pixelTolerance,
    );
    final removedIndices = mathPoints.removedIndices(simplified.cast());
    return line.copyWith(
      points: line.points.withRemovedIndices(removedIndices.toSet()).toList(),
    );
  }
}
