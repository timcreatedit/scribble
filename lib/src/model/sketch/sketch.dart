import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scribble/src/model/sketch/sketch_line/sketch_line.dart';

export 'point/point.dart';
export 'sketch_line/sketch_line.dart';

part 'sketch.freezed.dart';
part 'sketch.g.dart';

@freezed
class Sketch with _$Sketch {
  const factory Sketch({
    required List<SketchLine> lines,
  }) = _Sketch;

  factory Sketch.fromJson(Map<String, dynamic> json) => _$SketchFromJson(json);
}
