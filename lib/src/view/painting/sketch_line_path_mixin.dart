import 'dart:ui';

import 'package:perfect_freehand/perfect_freehand.dart' as pf;
import 'package:scribble/src/domain/model/sketch/sketch.dart';

/// A mixin for generating a [Path] from a [SketchLine].
///
/// Provides the method [getPathForLine] which generates a smooth [Path] from a
/// [SketchLine].
mixin SketchLinePathMixin {
  /// Generates a [Path] from a [SketchLine].
  ///
  /// The [scaleFactor] is used to scale the line width.
  ///
  /// If [simulatePressure] is true, the line will be drawn as if it had
  /// pressure information, if all its points have the same pressure.
  Path? getPathForLine(
    SketchLine line, {
    double scaleFactor = 1.0,
    bool simulatePressure = true,
  }) {
    final needSimulate = simulatePressure &&
        line.points.length > 1 &&
        line.points.every((p) => p.pressure == line.points.first.pressure);
    final points = line.points
        .map((point) => pf.PointVector(point.x, point.y, point.pressure))
        .toList();
    final outlinePoints = pf.getStroke(
      points,
      options: pf.StrokeOptions(
        size: line.width * 2 * scaleFactor,
        simulatePressure: needSimulate,
      ),
    );
    if (outlinePoints.isEmpty) {
      return null;
    } else if (outlinePoints.length < 2) {
      return Path()
        ..addOval(
          Rect.fromCircle(
            center: Offset(outlinePoints[0].dx, outlinePoints[0].dy),
            radius: 1,
          ),
        );
    } else {
      final path = Path()..moveTo(outlinePoints[0].dx, outlinePoints[0].dy);

      for (var i = 1; i < outlinePoints.length - 1; i++) {
        final p0 = outlinePoints[i];
        final p1 = outlinePoints[i + 1];
        path.quadraticBezierTo(
          p0.dx,
          p0.dy,
          (p0.dx + p1.dx) / 2,
          (p0.dy + p1.dy) / 2,
        );
      }
      return path;
    }
  }
}
