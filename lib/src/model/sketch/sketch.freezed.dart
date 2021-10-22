// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'sketch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Sketch _$SketchFromJson(Map<String, dynamic> json) {
  return _Sketch.fromJson(json);
}

/// @nodoc
class _$SketchTearOff {
  const _$SketchTearOff();

  _Sketch call({required List<SketchLine> lines}) {
    return _Sketch(
      lines: lines,
    );
  }

  Sketch fromJson(Map<String, Object?> json) {
    return Sketch.fromJson(json);
  }
}

/// @nodoc
const $Sketch = _$SketchTearOff();

/// @nodoc
mixin _$Sketch {
  List<SketchLine> get lines => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SketchCopyWith<Sketch> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SketchCopyWith<$Res> {
  factory $SketchCopyWith(Sketch value, $Res Function(Sketch) then) =
      _$SketchCopyWithImpl<$Res>;
  $Res call({List<SketchLine> lines});
}

/// @nodoc
class _$SketchCopyWithImpl<$Res> implements $SketchCopyWith<$Res> {
  _$SketchCopyWithImpl(this._value, this._then);

  final Sketch _value;
  // ignore: unused_field
  final $Res Function(Sketch) _then;

  @override
  $Res call({
    Object? lines = freezed,
  }) {
    return _then(_value.copyWith(
      lines: lines == freezed
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<SketchLine>,
    ));
  }
}

/// @nodoc
abstract class _$SketchCopyWith<$Res> implements $SketchCopyWith<$Res> {
  factory _$SketchCopyWith(_Sketch value, $Res Function(_Sketch) then) =
      __$SketchCopyWithImpl<$Res>;
  @override
  $Res call({List<SketchLine> lines});
}

/// @nodoc
class __$SketchCopyWithImpl<$Res> extends _$SketchCopyWithImpl<$Res>
    implements _$SketchCopyWith<$Res> {
  __$SketchCopyWithImpl(_Sketch _value, $Res Function(_Sketch) _then)
      : super(_value, (v) => _then(v as _Sketch));

  @override
  _Sketch get _value => super._value as _Sketch;

  @override
  $Res call({
    Object? lines = freezed,
  }) {
    return _then(_Sketch(
      lines: lines == freezed
          ? _value.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<SketchLine>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Sketch implements _Sketch {
  const _$_Sketch({required this.lines});

  factory _$_Sketch.fromJson(Map<String, dynamic> json) =>
      _$$_SketchFromJson(json);

  @override
  final List<SketchLine> lines;

  @override
  String toString() {
    return 'Sketch(lines: $lines)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sketch &&
            const DeepCollectionEquality().equals(other.lines, lines));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(lines));

  @JsonKey(ignore: true)
  @override
  _$SketchCopyWith<_Sketch> get copyWith =>
      __$SketchCopyWithImpl<_Sketch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_SketchToJson(this);
  }
}

abstract class _Sketch implements Sketch {
  const factory _Sketch({required List<SketchLine> lines}) = _$_Sketch;

  factory _Sketch.fromJson(Map<String, dynamic> json) = _$_Sketch.fromJson;

  @override
  List<SketchLine> get lines;
  @override
  @JsonKey(ignore: true)
  _$SketchCopyWith<_Sketch> get copyWith => throw _privateConstructorUsedError;
}
