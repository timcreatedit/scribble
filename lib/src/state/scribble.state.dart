import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scribble/src/model/sketch/sketch.dart';

part 'scribble.state.freezed.dart';

part 'scribble.state.g.dart';

enum ScribblePointerMode {
  all,
  mouseOnly,
  penOnly,
  mouseAndPen,
}

@freezed
class ScribbleState with _$ScribbleState {
  const ScribbleState._();

  const factory ScribbleState.drawing({
    /// The current state of the sketch
    required Sketch sketch,

    /// The line that is currently being drawn
    SketchLine? activeLine,

    /// Which pointers are allowed for drawing and will be captured by the
    /// scribble widget.
    @Default(ScribblePointerMode.all) ScribblePointerMode allowedPointersMode,

    /// The ids of all supported pointers that are currently interacting with
    /// the widget.
    @Default([]) List<int> activePointerIds,

    /// The current position of the pointer
    Point? pointerPosition,

    /// The color that is currently being drawn with
    @Default(0xFF000000) int selectedColor,

    /// The current width of the pen
    @Default(5) double selectedWidth,

    /// How much the widget is scaled at the moment.
    ///
    /// Can be used if zoom functionality is needed
    /// (e.g. through InteractiveViewer) so that the pen width remains the same.
    @Default(1) double scaleFactor,
  }) = Drawing;

  const factory ScribbleState.erasing({
    /// The current state of the sketch
    required Sketch sketch,

    /// Which pointers are allowed for drawing and will be captured by the
    /// scribble widget.
    @Default(ScribblePointerMode.all) ScribblePointerMode allowedPointersMode,

    /// The ids of all supported pointers that are currently interacting with
    /// the widget.
    @Default([]) List<int> activePointerIds,

    /// The current position of the pointer
    Point? pointerPosition,

    /// The current width of the pen
    @Default(5) double selectedWidth,

    /// How much the widget is scaled at the moment.
    ///
    /// Can be used if zoom functionality is needed
    /// (e.g. through InteractiveViewer) so that the pen width remains the same.
    @Default(1) double scaleFactor,
  }) = Erasing;

  bool get active => activePointerIds.length <= 1;

  List<SketchLine> get lines => map(
      drawing: (d) => d.activeLine == null
          ? sketch.lines
          : [...sketch.lines, d.activeLine!],
      erasing: (d) => d.sketch.lines);

  /// Returns a set of [PointerDeviceKind] that represents the currently
  /// supported devices, depending on [state.allowedPointersMode].
  Set<PointerDeviceKind> get supportedPointerKinds {
    switch (allowedPointersMode) {
      case ScribblePointerMode.all:
        return Set.from(PointerDeviceKind.values);
      case ScribblePointerMode.mouseOnly:
        return const {PointerDeviceKind.mouse};
      case ScribblePointerMode.penOnly:
        return const {
          PointerDeviceKind.stylus,
          PointerDeviceKind.invertedStylus,
        };
      case ScribblePointerMode.mouseAndPen:
        return const {
          PointerDeviceKind.mouse,
          PointerDeviceKind.stylus,
          PointerDeviceKind.invertedStylus,
        };
    }
  }

  factory ScribbleState.fromJson(Map<String, dynamic> json) =>
      _$ScribbleStateFromJson(json);
}
