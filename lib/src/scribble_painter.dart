import 'package:flutter/rendering.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/sketch_line_path_mixin.dart';

class ScribblePainter extends CustomPainter with SketchLinePathMixin {
  ScribblePainter({
    required this.sketch,
    required this.scaleFactor,
  });

  final Sketch sketch;
  final double scaleFactor;

  List<SketchLine> get lines => sketch.lines;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < lines.length; ++i) {
      final path = getPathForLine(lines[i]);
      if (path == null) {
        continue;
      }
      paint.color = Color(lines[i].color);
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(ScribblePainter oldDelegate) {
    return oldDelegate.sketch != sketch ||
        oldDelegate.scaleFactor != scaleFactor;
  }
}
