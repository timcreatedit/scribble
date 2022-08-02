import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:scribble/src/scribble.notifier.dart';
import 'package:scribble/src/scribble_painter.dart';
import 'package:scribble/src/state/scribble.state.dart';

import 'core/pan_gesture_catcher.dart';

/// This Widget represents a canvas on which users can draw with any pointer.
///
/// You can control its behavior from code using the [notifier] instance you
/// pass in.
class Scribble extends StatefulWidget {
  const Scribble({
    /// The notifier that controls this canvas.
    required this.notifier,

    /// Whether to draw the pointer when in drawing mode
    this.drawPen = true,

    /// Whether to draw the pointer when in erasing mode
    this.drawEraser = true,
    Key? key,
  }) : super(key: key);

  /// The notifier that controls this canvas.
  final ScribbleNotifierBase notifier;

  /// Whether to draw the pointer when in drawing mode
  final bool drawPen;

  /// Whether to draw the pointer when in erasing mode
  final bool drawEraser;

  @override
  State<Scribble> createState() => _ScribbleState();
}

class _ScribbleState extends State<Scribble> {
  @override
  Widget build(BuildContext context) {
    return StateNotifierBuilder<ScribbleState>(
      stateNotifier: widget.notifier,
      builder: (context, state, _) {
        final drawCurrentTool = widget.drawPen && state is Drawing ||
            widget.drawEraser && state is Erasing;
        final child = SizedBox.expand(
          child: RepaintBoundary(
            key: widget.notifier.repaintBoundaryKey,
            child: CustomPaint(
              painter: ScribblePainter(
                state: state,
                drawPointer: widget.drawPen,
                drawEraser: widget.drawEraser,
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
