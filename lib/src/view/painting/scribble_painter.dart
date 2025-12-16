import 'package:flutter/rendering.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/view/painting/sketch_line_path_mixin.dart';

/// A painter for drawing a scribble sketch.
class ScribblePainter extends CustomPainter with SketchLinePathMixin {
  /// Creates a new [ScribblePainter] instance.
  ScribblePainter({
    required this.sketch,
    required this.scaleFactor,
    required this.simulatePressure,
    this.viewTransform,
  });

  /// The [Sketch] to draw.
  final Sketch sketch;

  /// {@macro view.state.scribble_state.scale_factor}
  final double scaleFactor;

  /// {@macro view.state.scribble_state.view_transform}
  final Matrix4? viewTransform;

  @override
  final bool simulatePressure;

  @override
  void paint(Canvas canvas, Size size) {
    // Apply view transform if set
    if (viewTransform != null) {
      canvas.save();
      canvas.transform(viewTransform!.storage);
    }

    // When viewTransform is applied, lines are stored with their intended
    // visual width. We pass 1/scaleFactor so that after canvas transform
    // (which scales by scaleFactor), lines appear at their stored visual width.
    // This ensures constant line thickness regardless of zoom level.
    final effectiveScaleFactor =
        viewTransform != null ? 1.0 / scaleFactor : scaleFactor;

    final paint = Paint()..style = PaintingStyle.fill;

    for (var i = 0; i < sketch.lines.length; ++i) {
      final path = getPathForLine(
        sketch.lines[i],
        scaleFactor: effectiveScaleFactor,
      );
      if (path == null) {
        continue;
      }
      paint.color = Color(sketch.lines[i].color);
      canvas.drawPath(path, paint);
    }

    // Restore canvas if we applied a transform
    if (viewTransform != null) {
      canvas.restore();
    }
  }

  @override
  bool shouldRepaint(ScribblePainter oldDelegate) {
    return oldDelegate.sketch != sketch ||
        oldDelegate.simulatePressure != simulatePressure ||
        oldDelegate.scaleFactor != scaleFactor ||
        oldDelegate.viewTransform != viewTransform;
  }
}
