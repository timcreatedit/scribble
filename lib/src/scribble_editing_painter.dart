import 'package:flutter/rendering.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/scribble_painter.dart';

class ScribbleEditingPainter extends CustomPainter with SketchLinePainter {
  ScribbleEditingPainter({
    required this.state,
    required this.drawPointer,
    required this.drawEraser,
  });

  final ScribbleState state;
  final bool drawPointer;
  final bool drawEraser;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

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

    if (state.pointerPosition != null && (state is Drawing && drawPointer || state is Erasing && drawEraser)) {
      paint.style = state.map(
        drawing: (_) => PaintingStyle.fill,
        erasing: (_) => PaintingStyle.stroke,
      );
      paint.color = state.map(
        drawing: (s) => Color(s.selectedColor),
        erasing: (s) => const Color(0xFF000000),
      );
      paint.strokeWidth = 1;
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
