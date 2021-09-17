import 'dart:math';
import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:scribble/src/scribble.notifier.dart';
import 'package:scribble/src/state/scribble.state.dart';
import 'package:vector_math/vector_math.dart';

import 'model/sketch/sketch.dart';

/// This Widget represents a canvas on which users can draw with any pointer.
///
/// You can control its behavior from code using the [notifier] instance you
/// pass in.
class Scribble extends StatelessWidget {
  const Scribble({
    required this.notifier,
    this.drawPointer = true,
    this.drawEraser = true,
    Key? key,
  }) : super(key: key);

  /// The notifier that controls this canvas.
  final ScribbleNotifier notifier;

  /// Whether to draw the pointer when in drawing mode
  final bool drawPointer;

  /// Whether to draw the pointer when in erasing mode
  final bool drawEraser;

  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<ScribbleState>(
        stateNotifier: notifier,
        builder: (context, state, _) {
          return SizedBox.expand(
            child: Listener(
              onPointerDown: notifier.onPointerDown,
              onPointerMove: notifier.onPointerUpdate,
              onPointerUp: notifier.onPointerUp,
              onPointerHover: notifier.onPointerHover,
              onPointerCancel: notifier.onPointerCancel,
              child: RepaintBoundary(
                child: CustomPaint(
                  painter: _ScribblePainter(
                    state: state,
                    drawPointer: drawPointer,
                    drawEraser: drawEraser,
                  ),
                ),
              ),
            ),
          );
        });
  }
}

class _ScribblePainter extends CustomPainter {
  _ScribblePainter({
    required this.state,
    required this.drawPointer,
    required this.drawEraser,
  });

  static const double pressureFactor = 0.5;
  static const double speedFactor = 0.02;
  static const double minWidthFactor = 0.3;

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
        erasing: (s) => Color(0xFF000000),
      );
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
    final pointWidth = pressure * pressureFactor - distance * speedFactor;
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
  bool shouldRepaint(_ScribblePainter oldDelegate) {
    return oldDelegate.state != state;
  }
}
