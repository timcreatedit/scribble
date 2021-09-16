import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kimchi/kimchi.dart';
import 'package:scribble/src/model/sketch/sketch.dart';
import 'package:scribble/src/state/scribble.state.dart';

/// This class controls the state and behavior for a [Scribble] widget.
class ScribbleNotifier extends HistoryStateNotifier<ScribbleState> {
  ScribbleNotifier({
    int maxHistoryLength = 30,
    this.widths = const [5, 10, 15],
  }) : super(
          ScribbleState.drawing(
            sketch: const Sketch(lines: []),
            selectedWidth: widths[0],
          ),
          maxHistoryLength: maxHistoryLength,
        );

  /// The supported widths, mainly useful for rendering UI, you can still set
  /// the width to any arbitrary value from code.
  final List<double> widths;

  SketchLine get _currentLine =>
      state.sketch.lines.lastOrNull ??
      SketchLine(points: [], color: Colors.black.value, width: 0);

  /// Don't apply the pointer position from state that come from the undo
  /// history.
  @override
  @protected
  ScribbleState transformHistoryState(ScribbleState historyState) {
    return historyState.copyWith(
      pointerPosition: state.pointerPosition,
    );
  }

  /// Clear the entire drawing.
  void clear() {
    state = const ScribbleState.drawing(
      sketch: Sketch(lines: []),
    );
  }

  /// Sets the width of the next line
  void setStrokeWidth(double strokeWidth) {
    state = state.copyWith(
      selectedWidth: strokeWidth,
    );
  }

  /// Switches to eraser mode
  void setEraser() {
    state = ScribbleState.erasing(
      sketch: state.sketch,
      selectedWidth: widths.last,
    );
  }

  /// Sets the color of the pen to the given color.
  void setColor(Color color) {
    state = state.map(
      drawing: (s) => ScribbleState.drawing(
        sketch: s.sketch,
        selectedColor: color,
        selectedWidth: s.selectedWidth,
      ),
      erasing: (s) => ScribbleState.drawing(
        sketch: s.sketch,
        selectedColor: color,
        selectedWidth: s.selectedWidth,
      ),
    );
  }

  /// Used by the Listener callback to display the pen if desired
  void onPointerHover(PointerHoverEvent event) {
    temporaryState = state.copyWith(
      pointerPosition: event.distance > 1
          ? null
          : Point(event.localPosition.dx, event.localPosition.dy),
    );
  }

  /// Used by the Listener callback to start drawing
  void onPointerDown(PointerDownEvent event) {
    if (state is Drawing) {
      temporaryState = state.copyWith.sketch(
        lines: [
          ...state.sketch.lines,
          SketchLine(
            points: [_getPointFromEvent(event)],
            color: (state as Drawing).selectedColor.value,
            width: state.selectedWidth,
          )
        ],
      );
    }
  }

  /// Used by the Listener callback to update the drawing
  void onPointerUpdate(PointerMoveEvent event) {
    if (state is Drawing) {
      temporaryState = _addPoint(event).copyWith(
        pointerPosition: _getPointFromEvent(event),
      );
    } else if (state is Erasing) {
      temporaryState = _erasePoint(event).copyWith(
        pointerPosition: _getPointFromEvent(event),
      );
      ;
    }
  }

  /// Used by the Listener callback to finish a line
  void onPointerUp(PointerUpEvent event) {
    if (state is Drawing) {
      state = _addPoint(event);
    } else if (state is Erasing) {
      state = _erasePoint(event);
    }
  }

  /// Used by the Listener callback to stop displaying the cursor
  void onPointerCancel(PointerCancelEvent event) {
    if (state is Drawing) {
      state = _addPoint(event).copyWith(pointerPosition: null);
    } else if (state is Erasing) {
      state = _erasePoint(event).copyWith(pointerPosition: null);
    }
  }

  ScribbleState _erasePoint(PointerEvent event) {
    return state.copyWith.sketch(
      lines: state.sketch.lines
          .where((l) => l.points.none((p) =>
              (event.localPosition - p.asOffset).distance <=
              state.selectedWidth))
          .toList(),
    );
  }

  ScribbleState _addPoint(PointerEvent event) {
    final distanceToLast = _currentLine.points.isEmpty
        ? double.infinity
        : (_currentLine.points.last.asOffset - event.localPosition).distance;
    if (distanceToLast <= computePanSlop(event.kind)) return state;
    _checkStraightLineMode(event.localPosition);
    final prevLines = state.sketch.lines.isEmpty
        ? <SketchLine>[]
        : state.sketch.lines.sublist(0, state.sketch.lines.length - 1);
    return state.copyWith.sketch(
      lines: [
        ...prevLines,
        _currentLine.copyWith(
          points: [
            ..._currentLine.points,
            _getPointFromEvent(event),
          ],
        ),
      ],
    );
  }

  void _checkStraightLineMode(Offset currentPoint, {int windowSize = 30}) {
    if (_currentLine.points.length < windowSize) return;
    var values =
        _currentLine.points.skip(_currentLine.points.length - windowSize);
    var averageDist = values
        .map((o) =>
            sqrt(pow(currentPoint.dy - o.y, 2) + pow(o.x - currentPoint.dx, 2)))
        .reduce((a, b) => a + b / values.length);
    //print(averageDist);
  }

  Point _getPointFromEvent(PointerEvent event) {
    return Point(
      event.localPosition.dx,
      event.localPosition.dy,
      pressure: event.pressure,
    );
  }
}
