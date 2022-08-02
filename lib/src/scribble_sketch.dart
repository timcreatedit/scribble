import 'package:flutter/widgets.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/scribble_painter.dart';

/// A widget for displaying a scribble sketch without any input functionalities.
class ScribbleSketch extends StatelessWidget {
  const ScribbleSketch({
    Key? key,
    required this.sketch,
  }) : super(key: key);

  /// The sketch to display
  final Sketch sketch;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ScribblePainter(
        state: ScribbleState.drawing(sketch: sketch),
        drawPointer: false,
        drawEraser: false,
      ),
    );
  }
}
