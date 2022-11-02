import 'package:flutter/widgets.dart';
import 'package:scribble/scribble.dart';
import 'package:scribble/src/scribble_painter.dart';

/// A widget for displaying a scribble sketch without any input functionalities.
class ScribbleSketch extends StatelessWidget {
  const ScribbleSketch({
    Key? key,
    required this.sketch,
    this.scaleFactor = 1,
  }) : super(key: key);

  /// The sketch to display
  final Sketch sketch;

  /// How much the widget is scaled at the moment.
  ///
  /// Can be used if zoom functionality is needed
  /// (e.g. through InteractiveViewer) so that the pen width remains the same.
  final double scaleFactor;

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      painter: ScribblePainter(
        sketch: sketch,
        scaleFactor: scaleFactor,
      ),
    );
  }
}
