import 'dart:math';

import 'package:collection/collection.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kimchi/kimchi.dart';
import 'package:scribble/src/model/sketch/sketch.dart';
import 'package:scribble/src/state/scribble.state.dart';

class ScribbleNotifier extends HistoryStateNotifier<ScribbleState> {
  ScribbleNotifier({
    int maxHistoryLength = 30,
    this.widths = const [5, 10, 15],
  }) : super(
          const ScribbleState.drawing(
            sketch: Sketch(lines: []),
            selectedWidth: 5,
          ),
          maxHistoryLength: maxHistoryLength,
        );

  final List<double> widths;

  SketchLine get currentLine =>
      state.sketch.lines.lastOrNull ??
      SketchLine(points: [], color: Colors.black.value, width: 0);

  /// Don't apply the pointer position from state that come from the undo
  /// history.
  @override
  ScribbleState transformHistoryState(ScribbleState historyState) {
    return historyState.copyWith(
      pointerPosition: state.pointerPosition,
    );
  }

  /// Clear the entire drawing.
  void clear() {
    state = const ScribbleState.drawing(
      sketch: const Sketch(lines: []),
    );
  }

  void setStrokeWidth(double strokeWidth) {
    state = state.copyWith(
      selectedWidth: strokeWidth,
    );
  }

  void setEraser() {
    state = ScribbleState.erasing(
      sketch: state.sketch,
      selectedWidth: widths.last,
    );
  }

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

  void onPointerHover(PointerHoverEvent event) {
    temporaryState = state.copyWith(
      pointerPosition: event.distance > 1
          ? null
          : Point(event.localPosition.dx, event.localPosition.dy),
    );
  }

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

  void onPointerUp(PointerUpEvent event) {
    if (state is Drawing) {
      state = _addPoint(event);
    } else if (state is Erasing) {
      state = _erasePoint(event);
    }
  }

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
    final distanceToLast = currentLine.points.isEmpty
        ? double.infinity
        : (currentLine.points.last.asOffset - event.localPosition).distance;
    if (distanceToLast <= computePanSlop(event.kind)) return state;
    _checkStraightLineMode(event.localPosition);
    final prevLines = state.sketch.lines.isEmpty
        ? <SketchLine>[]
        : state.sketch.lines.sublist(0, state.sketch.lines.length - 1);
    return state.copyWith.sketch(
      lines: [
        ...prevLines,
        currentLine.copyWith(
          points: [
            ...currentLine.points,
            _getPointFromEvent(event),
          ],
        ),
      ],
    );
  }

  void _checkStraightLineMode(Offset currentPoint, {int windowSize = 30}) {
    if (currentLine.points.length < windowSize) return;
    var values =
        currentLine.points.skip(currentLine.points.length - windowSize);
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
