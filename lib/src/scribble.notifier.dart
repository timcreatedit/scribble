import 'dart:math';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:history_state_notifier/history_state_notifier.dart';
import 'package:scribble/src/model/sketch/sketch.dart';
import 'package:scribble/src/state/scribble.state.dart';
import 'package:state_notifier/state_notifier.dart';

abstract class ScribbleNotifierBase extends StateNotifier<ScribbleState> {
  ScribbleNotifierBase(ScribbleState state) : super(state);

  void onPointerHover(PointerHoverEvent event);

  void onPointerDown(PointerDownEvent event);

  void onPointerUpdate(PointerMoveEvent event);

  void onPointerUp(PointerUpEvent event);

  void onPointerCancel(PointerCancelEvent event);
}

/// This class controls the state and behavior for a [Scribble] widget.
class ScribbleNotifier extends StateNotifier<ScribbleState>
    with HistoryStateNotifierMixin<ScribbleState>
    implements ScribbleNotifierBase {
  ScribbleNotifier({
    /// If you pass a sketch here, the notifier will use that sketch as a
    /// starting point.
    Sketch? sketch,

    /// How many states you want stored in the undo history, 30 by default.
    int maxHistoryLength = 30,

    /// The supported widths, mainly useful for rendering UI, you can still set
    /// the width to any arbitrary value from code. The first entry in this list
    /// will be the starting width.
    this.widths = const [5, 10, 15],

    /// The curve that's used to map pen pressure to the pressure value when
    /// recording, by default it's linear.
    this.pressureCurve = Curves.linear,
  }) : super(
          ScribbleState.drawing(
            sketch: sketch ?? const Sketch(lines: []),
            selectedWidth: widths[0],
          ),
        ) {
    state = ScribbleState.drawing(
      sketch: sketch ?? const Sketch(lines: []),
      selectedWidth: widths[0],
    );
    this.maxHistoryLength = maxHistoryLength;
  }

  /// The supported widths, mainly useful for rendering UI, you can still set
  /// the width to any arbitrary value from code.
  final List<double> widths;

  /// The curve that's used to map pen pressure to the pressure value when
  /// recording.
  final Curve pressureCurve;

  /// The state of the sketch at this moment.
  ///
  /// If you want to store it somewhere you can call ``.toJson()`` on it to
  /// receive a map.
  Sketch get currentSketch => state.sketch;

  SketchLine get _currentLine => state.sketch.lines.isNotEmpty
      ? state.sketch.lines.last
      : SketchLine(points: [], color: Colors.black.value, width: 0);

  /// Don't apply the pointer position from state that come from the undo
  /// history.
  @override
  @protected
  ScribbleState transformHistoryState(
      ScribbleState historyState, ScribbleState currentState) {
    return historyState.copyWith(
      pointerPosition: currentState.pointerPosition,
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
    temporaryState = state.copyWith(
      selectedWidth: strokeWidth,
    );
  }

  /// Switches to eraser mode
  void setEraser() {
    temporaryState = ScribbleState.erasing(
      sketch: state.sketch,
      selectedWidth: widths.last,
    );
  }

  /// Sets the color of the pen to the given color.
  void setColor(Color color) {
    temporaryState = state.map(
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
  @override
  void onPointerHover(PointerHoverEvent event) {
    temporaryState = state.copyWith(
      pointerPosition: event.distance > 1
          ? null
          : Point(event.localPosition.dx, event.localPosition.dy),
    );
  }

  /// Used by the Listener callback to start drawing
  @override
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
  @override
  void onPointerUpdate(PointerMoveEvent event) {
    if (state is Drawing) {
      temporaryState = _addPoint(event).copyWith(
        pointerPosition: _getPointFromEvent(event),
      );
    } else if (state is Erasing) {
      temporaryState = _erasePoint(event).copyWith(
        pointerPosition: _getPointFromEvent(event),
      );
    }
  }

  /// Used by the Listener callback to finish a line
  @override
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

  ScribbleState _erasePoint(PointerEvent event) {
    return state.copyWith.sketch(
      lines: state.sketch.lines
          .where((l) => l.points.every((p) =>
              (event.localPosition - p.asOffset).distance >
              state.selectedWidth))
          .toList(),
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

  /// Converts a pointer event to the [Point] on the canvas.
  Point _getPointFromEvent(PointerEvent event) {
    final p = event.kind == PointerDeviceKind.mouse ? 0.5 : event.pressure;
    return Point(
      event.localPosition.dx,
      event.localPosition.dy,
      pressure: pressureCurve.transform(p),
    );
  }
}
