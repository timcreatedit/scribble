import 'dart:math';
import 'dart:ui';

import 'package:flutter/rendering.dart';
import 'package:scribble/scribble.dart';
import 'package:vector_math/vector_math.dart';

class ScribblePainter extends CustomPainter {
  ScribblePainter({
    required this.state,
    required this.drawPointer,
    required this.drawEraser,
    required this.pressureFactor,
    required this.speedFactor,
    required this.minWidthFactor,
  });

  final double pressureFactor;
  final double speedFactor;
  final double minWidthFactor;

  final ScribbleState state;
  final bool drawPointer;
  final bool drawEraser;

  List<SketchLine> get lines => state.sketch.lines;

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..style = PaintingStyle.fill;

    for (int i = 0; i < lines.length; ++i) {
      final line = lines[i];
      paint.color = Color(lines[i].color);
      paint.blendMode = BlendMode.darken;
      if (line.points.length == 1) {
        final p = line.points[0];
        canvas.drawCircle(
            p.asOffset, _getWidth(line.width, p.pressure, 0), paint);
        paint.color = Color(line.color).withOpacity(.5);
        paint.blendMode = BlendMode.srcATop;
        canvas.drawCircle(
            p.asOffset, _getWidth(line.width, p.pressure, 0), paint);
      }
      Vertices path = _getVerticesForLine(line);
      canvas.drawVertices(path, BlendMode.dst, paint);
      paint.color = Color(line.color).withOpacity(.5);
      paint.blendMode = BlendMode.srcATop;
      canvas.drawVertices(path, BlendMode.dst, paint);
    }
    if (state.pointerPosition != null &&
        (state is Drawing && drawPointer || state is Erasing && drawEraser)) {
      paint.style = state.map(
        drawing: (_) => PaintingStyle.fill,
        erasing: (_) => PaintingStyle.stroke,
      );
      paint.color = state.map(
        drawing: (s) => s.selectedColor,
        erasing: (s) => const Color(0xFF000000),
      );
      paint.strokeWidth = 1;
      canvas.drawCircle(
          state.pointerPosition!.asOffset, state.selectedWidth, paint);
    }
  }

  Vertices _getVerticesForLine(SketchLine line) {
    List<Offset> positions = [];

    for (int i = 0; i < line.points.length; i++) {
      final current = line.points[i];
      final prev = i == 0 ? current : line.points[i - 1];
      final next = i == line.points.length - 1 ? current : line.points[i + 1];
      final offset = _getOffset(prev.asOffset, current.asOffset, next.asOffset);
      final distance = (current.asOffset - prev.asOffset).distance +
          (next.asOffset - current.asOffset).distance;

      if (i == 0) {
        positions.add(current.asOffset);
        positions.add(current.asOffset);
      } else if (i == line.points.length - 1) {
        positions.add(current.asOffset);
        positions.add(current.asOffset);
      } else {
        final width = _getWidth(line.width, current.pressure, distance);
        final p1 = current.asOffset + offset * width;
        final p2 = current.asOffset - offset * width;
        positions.insert(positions.length - 1, p1);
        positions.add(p2);
        positions.add(p1);
        positions.add(p2);
      }
    }
    return Vertices(
      VertexMode.triangleStrip,
      positions,
    );
  }

  double _getWidth(double baseWidth, double pressure, double distance) {
    final pointWidth = pressure * baseWidth * 2 * pressureFactor -
        baseWidth * pressureFactor -
        baseWidth * (distance / 100) * speedFactor;
    return max(baseWidth + pointWidth, baseWidth * minWidthFactor);
  }

  Offset _getOffset(Offset prev, Offset current, Offset next) {
    final o1 = prev - current;
    final v1 = Vector2(o1.dx, o1.dy);
    final o2 = next - current;
    final v2 = Vector2(o2.dx, o2.dy);
    final a = v1.angleTo(v2) * .5;
    final res = Matrix2.rotation(a).transform(v1).normalized();
    return Offset(res.x, res.y);
  }

  @override
  bool shouldRepaint(ScribblePainter oldDelegate) {
    return oldDelegate.state != state;
  }
}
