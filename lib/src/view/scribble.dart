import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:scribble/src/view/notifier/scribble_notifier.dart';
import 'package:scribble/src/view/painting/scribble_editing_painter.dart';
import 'package:scribble/src/view/painting/scribble_painter.dart';
import 'package:scribble/src/view/pan_gesture_catcher.dart';
import 'package:scribble/src/view/state/scribble.state.dart';

/// {@template scribble}
/// This Widget represents a canvas on which users can draw with any pointer.
///
/// You can control its behavior from code using the [notifier] instance you
/// pass in.
/// {@endtemplate}
class Scribble extends StatefulWidget {
  /// {@macro scribble}
  const Scribble({
    /// The notifier that controls this canvas.
    required this.notifier,

    /// Whether to draw the pointer when in drawing mode
    this.drawPen = true,

    /// Whether to draw the pointer when in erasing mode
    this.drawEraser = true,
    this.simulatePressure = true,
    super.key,
  });

  /// The notifier that controls this canvas.
  final ScribbleNotifierBase notifier;

  /// Whether to draw the pointer when in drawing mode
  final bool drawPen;

  /// Whether to draw the pointer when in erasing mode
  final bool drawEraser;

  /// {@template scribble.simulate_pressure}
  /// Whether to simulate pressure when drawing lines that don't have pressure
  /// information (all points have the same pressure).
  ///
  /// Defaults to `true`.
  /// {@endtemplate}
  final bool simulatePressure;

  @override
  State<Scribble> createState() => _ScribbleState();
}

class _ScribbleState extends State<Scribble> {
  late final GlobalKey _localRepaintBoundaryKey;

  @override
  void initState() {
    super.initState();
    _localRepaintBoundaryKey = GlobalKey(
      debugLabel: 'scribble_${identityHashCode(this)}',
    );
    widget.notifier.attachRepaintBoundaryKey(_localRepaintBoundaryKey);
  }

  @override
  void didUpdateWidget(covariant Scribble oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (!identical(oldWidget.notifier, widget.notifier)) {
      oldWidget.notifier.detachRepaintBoundaryKey(_localRepaintBoundaryKey);
      widget.notifier.attachRepaintBoundaryKey(_localRepaintBoundaryKey);
    }
  }

  @override
  void dispose() {
    widget.notifier.detachRepaintBoundaryKey(_localRepaintBoundaryKey);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<ScribbleState>(
      valueListenable: widget.notifier,
      builder: (context, state, _) {
        final drawCurrentTool =
            widget.drawPen && state is Drawing || widget.drawEraser && state is Erasing;
        final child = SizedBox.expand(
          child: CustomPaint(
            foregroundPainter: ScribbleEditingPainter(
              state: state,
              drawPointer: widget.drawPen,
              drawEraser: widget.drawEraser,
              simulatePressure: widget.simulatePressure,
            ),
            child: RepaintBoundary(
              key: _localRepaintBoundaryKey,
              child: CustomPaint(
                painter: ScribblePainter(
                  sketch: state.sketch,
                  scaleFactor: state.scaleFactor,
                  simulatePressure: widget.simulatePressure,
                ),
              ),
            ),
          ),
        );
        return !state.active
            ? child
            : GestureCatcher(
                pointerKindsToCatch: state.supportedPointerKinds,
                child: MouseRegion(
                  cursor: drawCurrentTool &&
                          state.supportedPointerKinds
                              .contains(PointerDeviceKind.mouse)
                      ? SystemMouseCursors.none
                      : MouseCursor.defer,
                  onExit: widget.notifier.onPointerExit,
                  child: Listener(
                    onPointerDown: widget.notifier.onPointerDown,
                    onPointerMove: widget.notifier.onPointerUpdate,
                    onPointerUp: widget.notifier.onPointerUp,
                    onPointerHover: widget.notifier.onPointerHover,
                    onPointerCancel: widget.notifier.onPointerCancel,
                    child: child,
                  ),
                ),
              );
      },
    );
  }
}
