import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scribble/src/model/sketch/sketch.dart';

part 'scribble.state.freezed.dart';

@freezed
class ScribbleState with _$ScribbleState {
  const ScribbleState._();

  const factory ScribbleState.drawing({
    required Sketch sketch,
    SketchLine? activeLine,
    @Default([]) List<int> activePointerIds,
    Point? pointerPosition,
    @Default(Colors.black) Color selectedColor,
    @Default(5) double selectedWidth,
  }) = Drawing;

  const factory ScribbleState.erasing({
    required Sketch sketch,
    @Default([]) List<int> activePointerIds,
    Point? pointerPosition,
    @Default(true) bool lineMode,
    @Default(5) double selectedWidth,
  }) = Erasing;

  bool get active => activePointerIds.length <= 1;

  List<SketchLine> get lines => map(
      drawing: (d) => d.activeLine == null
          ? sketch.lines
          : [...sketch.lines, d.activeLine!],
      erasing: (d) => d.sketch.lines);
}
