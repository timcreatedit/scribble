// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sketch_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SketchLine _$SketchLineFromJson(Map<String, dynamic> json) {
  return _SketchLine.fromJson(json);
}

/// @nodoc
class _$SketchLineTearOff {
  const _$SketchLineTearOff();

  _SketchLine call(
      {required List<Point> points,
      required int color,
      required double width}) {
    return _SketchLine(
      points: points,
      color: color,
      width: width,
    );
  }

  SketchLine fromJson(Map<String, Object?> json) {
    return SketchLine.fromJson(json);
  }
}

/// @nodoc
const $SketchLine = _$SketchLineTearOff();

/// @nodoc
mixin _$SketchLine {
  List<Point> get points => throw _privateConstructorUsedError;
  int get color => throw _privateConstructorUsedError;
  double get width => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SketchLineCopyWith<SketchLine> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SketchLineCopyWith<$Res> {
  factory $SketchLineCopyWith(
          SketchLine value, $Res Function(SketchLine) then) =
      _$SketchLineCopyWithImpl<$Res>;
  $Res call({List<Point> points, int color, double width});
}

/// @nodoc
class _$SketchLineCopyWithImpl<$Res> implements $SketchLineCopyWith<$Res> {
  _$SketchLineCopyWithImpl(this._value, this._then);

  final SketchLine _value;
  // ignore: unused_field
  final $Res Function(SketchLine) _then;

  @override
  $Res call({
    Object? points = freezed,
    Object? color = freezed,
    Object? width = freezed,
  }) {
    return _then(_value.copyWith(
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
abstract class _$SketchLineCopyWith<$Res> implements $SketchLineCopyWith<$Res> {
  factory _$SketchLineCopyWith(
          _SketchLine value, $Res Function(_SketchLine) then) =
      __$SketchLineCopyWithImpl<$Res>;
  @override
  $Res call({List<Point> points, int color, double width});
}

/// @nodoc
class __$SketchLineCopyWithImpl<$Res> extends _$SketchLineCopyWithImpl<$Res>
    implements _$SketchLineCopyWith<$Res> {
  __$SketchLineCopyWithImpl(
      _SketchLine _value, $Res Function(_SketchLine) _then)
      : super(_value, (v) => _then(v as _SketchLine));

  @override
  _SketchLine get _value => super._value as _SketchLine;

  @override
  $Res call({
    Object? points = freezed,
    Object? color = freezed,
    Object? width = freezed,
  }) {
    return _then(_SketchLine(
      points: points == freezed
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as List<Point>,
      color: color == freezed
          ? _value.color
          : color // ignore: cast_nullable_to_non_nullable
              as int,
      width: width == freezed
          ? _value.width
          : width // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_SketchLine implements _SketchLine {
  const _$_SketchLine(
      {required this.points, required this.color, required this.width});

  factory _$_SketchLine.fromJson(Map<String, dynamic> json) =>
      _$$_SketchLineFromJson(json);

  @override
  final List<Point> points;
  @override
  final int color;
  @override
  final double width;

  @override
  String toString() {
    return 'SketchLine(points: $points, color: $color, width: $width)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SketchLine &&
            const DeepCollectionEquality().equals(other.points, points) &&
            (identical(other.color, color) || other.color == color) &&
            (identical(other.width, width) || other.width == width));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(points), color, width);

  @JsonKey(ignore: true)
  @override
  _$SketchLineCopyWith<_SketchLine> get copyWith =>
      __$SketchLineCopyWithImpl<_SketchLine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SketchLineToJson(this);
  }
}

abstract class _SketchLine implements SketchLine {
  const factory _SketchLine(
      {required List<Point> points,
      required int color,
      required double width}) = _$_SketchLine;

  factory _SketchLine.fromJson(Map<String, dynamic> json) =
      _$_SketchLine.fromJson;

  @override
  List<Point> get points;
  @override
  int get color;
  @override
  double get width;
  @override
  @JsonKey(ignore: true)
  _$SketchLineCopyWith<_SketchLine> get copyWith =>
      throw _privateConstructorUsedError;
}
