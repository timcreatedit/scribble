// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sketch_line.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SketchLine _$SketchLineFromJson(Map<String, dynamic> json) {
  return _SketchLine.fromJson(json);
}

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
abstract class _$$_SketchLineCopyWith<$Res>
    implements $SketchLineCopyWith<$Res> {
  factory _$$_SketchLineCopyWith(
          _$_SketchLine value, $Res Function(_$_SketchLine) then) =
      __$$_SketchLineCopyWithImpl<$Res>;
  @override
  $Res call({List<Point> points, int color, double width});
}

/// @nodoc
class __$$_SketchLineCopyWithImpl<$Res> extends _$SketchLineCopyWithImpl<$Res>
    implements _$$_SketchLineCopyWith<$Res> {
  __$$_SketchLineCopyWithImpl(
      _$_SketchLine _value, $Res Function(_$_SketchLine) _then)
      : super(_value, (v) => _then(v as _$_SketchLine));

  @override
  _$_SketchLine get _value => super._value as _$_SketchLine;

  @override
  $Res call({
    Object? points = freezed,
    Object? color = freezed,
    Object? width = freezed,
  }) {
    return _then(_$_SketchLine(
      points: points == freezed
          ? _value._points
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
      {required final List<Point> points,
      required this.color,
      required this.width})
      : _points = points;

  factory _$_SketchLine.fromJson(Map<String, dynamic> json) =>
      _$$_SketchLineFromJson(json);

  final List<Point> _points;
  @override
  List<Point> get points {
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_points);
  }

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
            other is _$_SketchLine &&
            const DeepCollectionEquality().equals(other._points, _points) &&
            const DeepCollectionEquality().equals(other.color, color) &&
            const DeepCollectionEquality().equals(other.width, width));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(_points),
      const DeepCollectionEquality().hash(color),
      const DeepCollectionEquality().hash(width));

  @JsonKey(ignore: true)
  @override
  _$$_SketchLineCopyWith<_$_SketchLine> get copyWith =>
      __$$_SketchLineCopyWithImpl<_$_SketchLine>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SketchLineToJson(this);
  }
}

abstract class _SketchLine implements SketchLine {
  const factory _SketchLine(
      {required final List<Point> points,
      required final int color,
      required final double width}) = _$_SketchLine;

  factory _SketchLine.fromJson(Map<String, dynamic> json) =
      _$_SketchLine.fromJson;

  @override
  List<Point> get points => throw _privateConstructorUsedError;
  @override
  int get color => throw _privateConstructorUsedError;
  @override
  double get width => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$$_SketchLineCopyWith<_$_SketchLine> get copyWith =>
      throw _privateConstructorUsedError;
}
