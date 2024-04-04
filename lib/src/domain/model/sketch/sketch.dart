import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scribble/src/domain/model/sketch_line/sketch_line.dart';

export '../point/point.dart';
export '../sketch_line/sketch_line.dart';

part 'sketch.freezed.dart';
part 'sketch.g.dart';

/// Represents a sketch with a list of [SketchLine]s.
@freezed
class Sketch with _$Sketch {
  /// Represents a sketch with a list of [SketchLine]s.
  const factory Sketch({
    required List<SketchLine> lines,
  }) = _Sketch;

  /// Constructs a sketch from a JSON object.
  factory Sketch.fromJson(Map<String, dynamic> json) => _$SketchFromJson(json);
}
