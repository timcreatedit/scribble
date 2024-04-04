import 'package:freezed_annotation/freezed_annotation.dart';

part 'point.freezed.dart';
part 'point.g.dart';

/// {@template point}
/// Represents a point in a sketch with an x and y coordinate and an optional
/// pressure value.
/// {@endtemplate}
@freezed
class Point with _$Point {
  /// {@macro point}
  const factory Point(
    double x,
    double y, {
    @Default(1) double pressure,
  }) = _Point;
  const Point._();

  /// Constructs a point from a JSON object.
  factory Point.fromJson(Map<String, dynamic> json) => _$PointFromJson(json);
}
