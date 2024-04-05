import 'dart:ui';

import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scribble/src/domain/model/sketch/sketch.dart';

part 'scribble.state.freezed.dart';

part 'scribble.state.g.dart';

/// Which pointers are allowed for drawing and will be captured by the scribble
/// widget.
enum ScribblePointerMode {
  /// Allow drawing with all pointers.
  all,

  /// Allow drawing with mouse only.
  mouseOnly,

  /// Allow drawing with pen only.
  ///
  /// This is useful if you want to place the scribble widget in an
  /// `InteractiveViewer` for example, so that it can be zoomed in and out
  /// without drawing on it.
  penOnly,

  /// Allow drawing with both mouse and pen.
  mouseAndPen,
}

/// Represents the state of the scribble widget.
@freezed
sealed class ScribbleState with _$ScribbleState {
  /// The state of the scribble widget when it is being drawn on.
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

    /// {@template view.state.scribble_state.scale_factor}
    /// How much the widget is scaled at the moment.
    ///
    /// Can be used if zoom functionality is needed
    /// (e.g. through InteractiveViewer) so that the pen width remains the same.
    /// {@endtemplate}
    @Default(1) double scaleFactor,
  }) = Drawing;

  /// The state of the scribble widget when the user is currently erasing.
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

  /// Constructs a [ScribbleState] from a JSON object.
  factory ScribbleState.fromJson(Map<String, dynamic> json) =>
      _$ScribbleStateFromJson(json);
  const ScribbleState._();

  /// Returns whether the widget is currently active, meaning that only one
  /// pointer is interacting with the widget.
  bool get active => activePointerIds.length <= 1;

  /// Returns the list of lines that should be drawn on the canvas by
  /// combining the sketches lines with the current active line if it exists.
  List<SketchLine> get lines => map(
        drawing: (d) => d.activeLine == null
            ? sketch.lines
            : [...sketch.lines, d.activeLine!],
        erasing: (d) => d.sketch.lines,
      );

  /// Returns a set of [PointerDeviceKind] that represents the currently
  /// supported devices, depending on [ScribbleState.allowedPointersMode].
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
}
