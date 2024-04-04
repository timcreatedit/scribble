import 'dart:ui' as ui;

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:history_value_notifier/history_value_notifier.dart';
import 'package:scribble/src/model/sketch/sketch.dart';
import 'package:scribble/src/state/scribble.state.dart';

abstract class ScribbleNotifierBase extends ValueNotifier<ScribbleState> {
  ScribbleNotifierBase(super.state);

  /// You need to provide a key that the [RepointBoundary] can use so you can
  /// access it from the [renderImage] method.
  GlobalKey get repaintBoundaryKey;

  void onPointerHover(PointerHoverEvent event);

  void onPointerDown(PointerDownEvent event);

  void onPointerUpdate(PointerMoveEvent event);

  void onPointerUp(PointerUpEvent event);

  void onPointerCancel(PointerCancelEvent event);

  void onPointerExit(PointerExitEvent event);

  /// Used to render the image to ByteData which can then be stored or reused
  /// for example in an [Image.memory] widget.
  ///
  /// Use [pixelRatio] to increase the resolution of the resulting image.
  /// You can specify a different [format], by default this method
  /// generates pngs.
  Future<ByteData> renderImage({
    double pixelRatio = 1.0,
    ui.ImageByteFormat format = ui.ImageByteFormat.png,
  }) async {
    final RenderRepaintBoundary? renderObject =
        repaintBoundaryKey.currentContext?.findRenderObject()
            as RenderRepaintBoundary?;
    if (renderObject == null) {
      throw StateError(
          "Tried to convert Scribble to Image, but no valid RenderObject was found!");
    }
    final img = await renderObject.toImage(pixelRatio: pixelRatio);
    return (await img.toByteData(format: format))!;
  }
}

/// This class controls the state and behavior for a [Scribble] widget.
class ScribbleNotifier extends ScribbleNotifierBase
    with HistoryValueNotifierMixin<ScribbleState> {
  ScribbleNotifier({
    /// If you pass a sketch here, the notifier will use that sketch as a
    /// starting point.
    Sketch? sketch,

    /// Which pointers can be drawn with and are captured.
    ScribblePointerMode allowedPointersMode = ScribblePointerMode.all,

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
            allowedPointersMode: allowedPointersMode,
          ),
        ) {
    value = ScribbleState.drawing(
      sketch: sketch ?? const Sketch(lines: []),
      selectedWidth: widths[0],
      allowedPointersMode: allowedPointersMode,
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
  Sketch get currentSketch => value.sketch;

  final GlobalKey _repaintBoundaryKey = GlobalKey();

  @override
  GlobalKey get repaintBoundaryKey => _repaintBoundaryKey;

  /// Only apply the sketch from the undo history, otherwise keep current state
  @override
  @protected
  ScribbleState transformHistoryValue(
      ScribbleState historyValue, ScribbleState currentState) {
    return currentState.copyWith(
      sketch: historyValue.sketch,
    );
  }

  /// Can be used to update the state of the Sketch externally (e.g. when
  /// fetching from a server) to what is passed in as [sketch];
  ///
  /// Per default, this state of the sketch gets added to the undo history. If
  /// this is not desired, set [addToUndoHistory] to ``false``.
  void setSketch({required Sketch sketch, bool addToUndoHistory = true}) {
    final newState = value.copyWith(
      sketch: sketch,
    );
    if (addToUndoHistory) {
      value = newState;
    } else {
      temporaryValue = newState;
    }
  }

  /// Clear the entire drawing.
  void clear() {
    value = value.map(
      drawing: (s) => ScribbleState.drawing(
        sketch: const Sketch(lines: []),
        selectedColor: s.selectedColor,
        selectedWidth: s.selectedWidth,
        allowedPointersMode: s.allowedPointersMode,
        activePointerIds: s.activePointerIds,
        scaleFactor: s.scaleFactor,
        pointerPosition: s.pointerPosition,
      ),
      erasing: (s) => ScribbleState.erasing(
        sketch: const Sketch(lines: []),
        selectedWidth: s.selectedWidth,
        allowedPointersMode: s.allowedPointersMode,
        activePointerIds: s.activePointerIds,
        scaleFactor: s.scaleFactor,
        pointerPosition: s.pointerPosition,
      ),
    );
  }

  /// Sets the width of the next line
  void setStrokeWidth(double strokeWidth) {
    temporaryValue = value.copyWith(
      selectedWidth: strokeWidth,
    );
  }

  /// Switches to eraser mode
  void setEraser() {
    temporaryValue = ScribbleState.erasing(
      sketch: value.sketch,
      selectedWidth: value.selectedWidth,
      scaleFactor: value.scaleFactor,
      allowedPointersMode: value.allowedPointersMode,
      activePointerIds: value.activePointerIds,
    );
  }

  /// Sets the current mode of allowed pointers to the given [ScribblePointerMode]
  void setAllowedPointersMode(ScribblePointerMode allowedPointersMode) {
    temporaryValue = value.copyWith(
      allowedPointersMode: allowedPointersMode,
    );
  }

  /// Sets the zoom factor to allow for adjusting line width.
  ///
  /// If the factor is 2 for example, lines will be drawn half as thick as
  /// actually selected to allow for drawing details.
  void setScaleFactor(double factor) {
    assert(factor >= 0);
    temporaryValue = value.copyWith(
      scaleFactor: factor,
    );
  }

  /// Sets the color of the pen to the given color.
  void setColor(Color color) {
    temporaryValue = value.map(
      drawing: (s) => ScribbleState.drawing(
        sketch: s.sketch,
        selectedColor: color.value,
        selectedWidth: s.selectedWidth,
        allowedPointersMode: s.allowedPointersMode,
      ),
      erasing: (s) => ScribbleState.drawing(
        sketch: s.sketch,
        selectedColor: color.value,
        selectedWidth: s.selectedWidth,
        allowedPointersMode: s.allowedPointersMode,
        scaleFactor: value.scaleFactor,
        activePointerIds: value.activePointerIds,
      ),
    );
  }

  /// Used by the Listener callback to display the pen if desired
  @override
  void onPointerHover(PointerHoverEvent event) {
    if (!value.supportedPointerKinds.contains(event.kind)) return;
    temporaryValue = value.copyWith(
      pointerPosition:
          event.distance > 10000 ? null : _getPointFromEvent(event),
    );
  }

  /// Used by the Listener callback to start drawing
  @override
  void onPointerDown(PointerDownEvent event) {
    if (!value.supportedPointerKinds.contains(event.kind)) return;
    ScribbleState s = value;

    // Are there already pointers on the screen?
    if (value.activePointerIds.isNotEmpty) {
      s = value.map(
          drawing: (s) =>
              // If the current line already contains something
              (s.activeLine != null && s.activeLine!.points.length > 2)
                  ? _finishLineForState(s)
                  : s.copyWith(
                      activeLine: null,
                    ),
          erasing: (s) => s);
    } else if (value is Drawing) {
      s = (value as Drawing).copyWith(
        pointerPosition: _getPointFromEvent(event),
        activeLine: SketchLine(
          points: [_getPointFromEvent(event)],
          color: (value as Drawing).selectedColor,
          width: value.selectedWidth / value.scaleFactor,
        ),
      );
    }
    temporaryValue = s.copyWith(
      activePointerIds: [...value.activePointerIds, event.pointer],
    );
  }

  /// Used by the Listener callback to update the drawing
  @override
  void onPointerUpdate(PointerMoveEvent event) {
    if (!value.supportedPointerKinds.contains(event.kind)) return;
    if (!value.active) {
      temporaryValue = value.copyWith(
        pointerPosition: null,
      );
      return;
    }
    if (value is Drawing) {
      temporaryValue = _addPoint(event, value).copyWith(
        pointerPosition: _getPointFromEvent(event),
      );
    } else if (value is Erasing) {
      temporaryValue = _erasePoint(event).copyWith(
        pointerPosition: _getPointFromEvent(event),
      );
    }
  }

  /// Used by the Listener callback to finish a line
  @override
  void onPointerUp(PointerUpEvent event) {
    if (!value.supportedPointerKinds.contains(event.kind)) return;
    final pos =
        event.kind == PointerDeviceKind.mouse ? value.pointerPosition : null;
    if (value is Drawing) {
      value = _finishLineForState(_addPoint(event, value)).copyWith(
        pointerPosition: pos,
        activePointerIds:
            value.activePointerIds.where((id) => id != event.pointer).toList(),
      );
    } else if (value is Erasing) {
      value = _erasePoint(event).copyWith(
        pointerPosition: pos,
        activePointerIds:
            value.activePointerIds.where((id) => id != event.pointer).toList(),
      );
    }
  }

  /// Used by the Listener callback to stop displaying the cursor
  @override
  void onPointerCancel(PointerCancelEvent event) {
    if (!value.supportedPointerKinds.contains(event.kind)) return;
    if (value is Drawing) {
      value = _finishLineForState(_addPoint(event, value)).copyWith(
        pointerPosition: null,
        activePointerIds:
            value.activePointerIds.where((id) => id != event.pointer).toList(),
      );
    } else if (value is Erasing) {
      value = _erasePoint(event).copyWith(
        pointerPosition: null,
        activePointerIds:
            value.activePointerIds.where((id) => id != event.pointer).toList(),
      );
    }
  }

  @override
  void onPointerExit(PointerExitEvent event) {
    if (!value.supportedPointerKinds.contains(event.kind)) return;
    temporaryValue = _finishLineForState(value).copyWith(
      pointerPosition: null,
      activePointerIds:
          value.activePointerIds.where((id) => id != event.pointer).toList(),
    );
  }

  ScribbleState _addPoint(PointerEvent event, ScribbleState s) {
    if (s is Erasing || !s.active) return s;
    if (s is Drawing && s.activeLine == null) return s;
    final currentLine = (s as Drawing).activeLine!;
    final distanceToLast = currentLine.points.isEmpty
        ? double.infinity
        : (currentLine.points.last.asOffset - event.localPosition).distance;
    if (distanceToLast <= kPrecisePointerPanSlop / s.scaleFactor) return s;
    return s.copyWith(
      activeLine: currentLine.copyWith(
        points: [
          ...currentLine.points,
          _getPointFromEvent(event),
        ],
      ),
    );
  }

  ScribbleState _erasePoint(PointerEvent event) {
    return value.copyWith.sketch(
      lines: value.sketch.lines
          .where((l) => l.points.every((p) =>
              (event.localPosition - p.asOffset).distance >
              l.width + value.selectedWidth))
          .toList(),
    );
  }

  /// Converts a pointer event to the [Point] on the canvas.
  Point _getPointFromEvent(PointerEvent event) {
    final p = kIsWeb || event.pressureMin == event.pressureMax
        ? 0.5
        : (event.pressure - event.pressureMin) /
            (event.pressureMax - event.pressureMin);
    return Point(
      event.localPosition.dx,
      event.localPosition.dy,
      pressure: pressureCurve.transform(p),
    );
  }

  ScribbleState _finishLineForState(ScribbleState s) {
    if (s is Erasing || (s as Drawing).activeLine == null) {
      return s;
    }
    return s.copyWith(
      activeLine: null,
      sketch: s.sketch.copyWith(
        lines: [...s.sketch.lines, s.activeLine!],
      ),
    );
  }
}
