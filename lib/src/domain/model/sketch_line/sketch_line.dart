import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:scribble/src/domain/model/point/point.dart';

part 'sketch_line.freezed.dart';
part 'sketch_line.g.dart';

@freezed
class SketchLine with _$SketchLine {
  const factory SketchLine({
    required List<Point> points,
    required int color,
    required double width,
  }) = _SketchLine;

  factory SketchLine.fromJson(Map<String, dynamic> json) =>
      _$SketchLineFromJson(json);
}
