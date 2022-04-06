import 'package:flutter/widgets.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/scribble_painter.dart';

/// A widget for displaying a scribble sketch without any input functionalities.
class ScribbleSketch extends StatelessWidget {
  const ScribbleSketch({
    Key? key,

    /// The sketch to display
    required this.sketch,

    /// How much influence the pen pressure has on the line width.
    ///
    /// The default value of 0.5 for example means, that a pressure of 0 reduces
    /// the line width by half, and a pressure of 1 adds half the line width.
    this.pressureFactor = 0.5,

    /// How much the distance between two points reduces the line width.
    ///
    /// Defaults to 0.1, higher values quickly lead to the line becoming super
    /// thin.
    this.speedFactor = 0.1,

    /// The  relative minimum width of the line.
    ///
    /// The default value of 0.3 results in a line of thickness 10 becoming no
    /// thinner than 3.
    this.minWidthFactor = 0.3,
  }) : super(key: key);

  /// The sketch to display
  final Sketch sketch;

  /// How much influence the pen pressure has on the line width.
  ///
  /// The default value of 0.5 for example means, that a pressure of 0 reduces
  /// the line width by half, and a pressure of 1 adds half the line width.
  final double pressureFactor;

  /// How much the distance between two points reduces the line width.
  ///
  /// Defaults to 0.02, higher values quickly lead to the line becoming super
  /// thin.
  final double speedFactor;

  /// The  relative minimum width of the line.
  ///
  /// The default value of 0.3 results in a line of thickness 10 becoming no
  /// thinner than 3.
  final double minWidthFactor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ScribblePainter(
        state: ScribbleState.drawing(sketch: sketch),
        drawPointer: false,
        drawEraser: false,
        pressureFactor: pressureFactor,
        minWidthFactor: minWidthFactor,
        speedFactor: speedFactor,
      ),
    );
  }
}
