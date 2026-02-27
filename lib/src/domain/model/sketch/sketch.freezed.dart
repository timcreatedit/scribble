// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sketch.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Sketch {
  List<SketchLine> get lines;

  /// Create a copy of Sketch
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SketchCopyWith<Sketch> get copyWith =>
      _$SketchCopyWithImpl<Sketch>(this as Sketch, _$identity);

  /// Serializes this Sketch to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Sketch &&
            const DeepCollectionEquality().equals(other.lines, lines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(lines));

  @override
  String toString() {
    return 'Sketch(lines: $lines)';
  }
}

/// @nodoc
abstract mixin class $SketchCopyWith<$Res> {
  factory $SketchCopyWith(Sketch value, $Res Function(Sketch) _then) =
      _$SketchCopyWithImpl;
  @useResult
  $Res call({List<SketchLine> lines});
}

/// @nodoc
class _$SketchCopyWithImpl<$Res> implements $SketchCopyWith<$Res> {
  _$SketchCopyWithImpl(this._self, this._then);

  final Sketch _self;
  final $Res Function(Sketch) _then;

  /// Create a copy of Sketch
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? lines = null,
  }) {
    return _then(_self.copyWith(
      lines: null == lines
          ? _self.lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<SketchLine>,
    ));
  }
}

/// Adds pattern-matching-related methods to [Sketch].
extension SketchPatterns on Sketch {
  /// A variant of `map` that fallback to returning `orElse`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Sketch value)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sketch() when $default != null:
        return $default(_that);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// Callbacks receives the raw object, upcasted.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case final Subclass2 value:
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Sketch value) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sketch():
        return $default(_that);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `map` that fallback to returning `null`.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case final Subclass value:
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Sketch value)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sketch() when $default != null:
        return $default(_that);
      case _:
        return null;
    }
  }

  /// A variant of `when` that fallback to an `orElse` callback.
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return orElse();
  /// }
  /// ```

  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(List<SketchLine> lines)? $default, {
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case _Sketch() when $default != null:
        return $default(_that.lines);
      case _:
        return orElse();
    }
  }

  /// A `switch`-like method, using callbacks.
  ///
  /// As opposed to `map`, this offers destructuring.
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case Subclass2(:final field2):
  ///     return ...;
  /// }
  /// ```

  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(List<SketchLine> lines) $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sketch():
        return $default(_that.lines);
      case _:
        throw StateError('Unexpected subclass');
    }
  }

  /// A variant of `when` that fallback to returning `null`
  ///
  /// It is equivalent to doing:
  /// ```dart
  /// switch (sealedClass) {
  ///   case Subclass(:final field):
  ///     return ...;
  ///   case _:
  ///     return null;
  /// }
  /// ```

  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(List<SketchLine> lines)? $default,
  ) {
    final _that = this;
    switch (_that) {
      case _Sketch() when $default != null:
        return $default(_that.lines);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class _Sketch implements Sketch {
  const _Sketch({required final List<SketchLine> lines}) : _lines = lines;
  factory _Sketch.fromJson(Map<String, dynamic> json) => _$SketchFromJson(json);

  final List<SketchLine> _lines;
  @override
  List<SketchLine> get lines {
    if (_lines is EqualUnmodifiableListView) return _lines;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_lines);
  }

  /// Create a copy of Sketch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SketchCopyWith<_Sketch> get copyWith =>
      __$SketchCopyWithImpl<_Sketch>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$SketchToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _Sketch &&
            const DeepCollectionEquality().equals(other._lines, _lines));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_lines));

  @override
  String toString() {
    return 'Sketch(lines: $lines)';
  }
}

/// @nodoc
abstract mixin class _$SketchCopyWith<$Res> implements $SketchCopyWith<$Res> {
  factory _$SketchCopyWith(_Sketch value, $Res Function(_Sketch) _then) =
      __$SketchCopyWithImpl;
  @override
  @useResult
  $Res call({List<SketchLine> lines});
}

/// @nodoc
class __$SketchCopyWithImpl<$Res> implements _$SketchCopyWith<$Res> {
  __$SketchCopyWithImpl(this._self, this._then);

  final _Sketch _self;
  final $Res Function(_Sketch) _then;

  /// Create a copy of Sketch
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lines = null,
  }) {
    return _then(_Sketch(
      lines: null == lines
          ? _self._lines
          : lines // ignore: cast_nullable_to_non_nullable
              as List<SketchLine>,
    ));
  }
}

// dart format on
