import 'package:flutter/rendering.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/view/painting/point_to_offset_x.dart';
import 'package:scribble/src/view/painting/sketch_line_path_mixin.dart';

/// {@template scribble_editing_painter}
/// A painter for drawing the currently active line of a scribble sketch, as
/// well as the pointer when in drawing or erasing mode, if desired.
/// {@endtemplate}
class ScribbleEditingPainter extends CustomPainter with SketchLinePathMixin {
  /// {@macro scribble_editing_painter}
  ScribbleEditingPainter({
    required this.state,
    required this.drawPointer,
    required this.drawEraser,
  });

  /// The current state of the scribble sketch
  final ScribbleState state;

  /// Whether to draw the pointer when in drawing mode.
  ///
  /// The pointer will be drawn as a filled circle with the currently selected
  /// color.
  final bool drawPointer;

  /// Whether to draw the pointer when in erasing mode
  ///
  /// The pointer will be drawn as a transparent circle with a black border.
  final bool drawEraser;

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()..style = PaintingStyle.fill;

    final activeLine = state.map(
      drawing: (s) => s.activeLine,
      erasing: (_) => null,
    );
    if (activeLine != null) {
      final path = getPathForLine(activeLine, scaleFactor: state.scaleFactor);
      if (path != null) {
        paint.color = Color(activeLine.color);
        canvas.drawPath(path, paint);
      }
    }

    if (state.pointerPosition != null &&
        (state is Drawing && drawPointer || state is Erasing && drawEraser)) {
      paint
        ..style = state.map(
          drawing: (_) => PaintingStyle.fill,
          erasing: (_) => PaintingStyle.stroke,
        )
        ..color = state.map(
          drawing: (s) => Color(s.selectedColor),
          erasing: (s) => const Color(0xFF000000),
        )
        ..strokeWidth = 1;
      canvas.drawCircle(
        state.pointerPosition!.asOffset,
        state.selectedWidth / state.scaleFactor,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(ScribbleEditingPainter oldDelegate) {
    return oldDelegate.state != state;
  }
}
