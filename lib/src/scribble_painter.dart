import 'package:flutter/rendering.dart';
import 'package:perfect_freehand/perfect_freehand.dart' as pf;
import 'package:scribble/scribble.dart';

class ScribblePainter extends CustomPainter with SketchLinePainter {
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
    return oldDelegate.sketch != sketch || oldDelegate.scaleFactor != scaleFactor;
  }
}

mixin SketchLinePainter {
  Path? getPathForLine(SketchLine line, {double scaleFactor = 1.0}) {
    final simulatePressure = line.points.isNotEmpty && line.points.every((p) => p.pressure == line.points.first.pressure);
    final points = line.points.map((point) => pf.Point(point.x, point.y, point.pressure)).toList();
    final outlinePoints = pf.getStroke(
      points,
      size: line.width * 2 * scaleFactor,
      simulatePressure: simulatePressure,
    );
    if (outlinePoints.isEmpty) {
      return null;
    } else if (outlinePoints.length < 2) {
      return Path()
        ..addOval(Rect.fromCircle(
          center: Offset(outlinePoints[0].x, outlinePoints[0].y),
          radius: 1,
        ));
    } else {
      final path = Path();
      path.moveTo(outlinePoints[0].x, outlinePoints[0].y);
      for (int i = 1; i < outlinePoints.length - 1; ++i) {
        final p0 = outlinePoints[i];
        final p1 = outlinePoints[i + 1];
        path.quadraticBezierTo(
          p0.x,
          p0.y,
          (p0.x + p1.x) / 2,
          (p0.y + p1.y) / 2,
        );
      }
      return path;
    }
  }
}
