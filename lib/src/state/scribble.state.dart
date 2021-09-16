import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scribble/src/model/sketch/sketch.dart';

part 'scribble.state.freezed.dart';

@freezed
class ScribbleState with _$ScribbleState {
  const factory ScribbleState.drawing({
    required Sketch sketch,
    Point? pointerPosition,
    @Default(Colors.black) Color selectedColor,
    @Default(5) double selectedWidth,
  }) = Drawing;

  const factory ScribbleState.erasing({
    required Sketch sketch,
    Point? pointerPosition,
    @Default(true) bool lineMode,
    @Default(5) double selectedWidth,
  }) = Erasing;
}
