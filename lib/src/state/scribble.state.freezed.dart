// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'scribble.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$ScribbleStateTearOff {
  const _$ScribbleStateTearOff();

  Drawing drawing(
      {required Sketch sketch,
      SketchLine? activeLine,
      List<int> activePointerIds = const [],
      Point? pointerPosition,
      Color selectedColor = Colors.black,
      double selectedWidth = 5}) {
    return Drawing(
      sketch: sketch,
      activeLine: activeLine,
      activePointerIds: activePointerIds,
      pointerPosition: pointerPosition,
      selectedColor: selectedColor,
      selectedWidth: selectedWidth,
    );
  }

  Erasing erasing(
      {required Sketch sketch,
      List<int> activePointerIds = const [],
      Point? pointerPosition,
      bool lineMode = true,
      double selectedWidth = 5}) {
    return Erasing(
      sketch: sketch,
      activePointerIds: activePointerIds,
      pointerPosition: pointerPosition,
      lineMode: lineMode,
      selectedWidth: selectedWidth,
    );
  }
}

/// @nodoc
const $ScribbleState = _$ScribbleStateTearOff();

/// @nodoc
mixin _$ScribbleState {
  Sketch get sketch => throw _privateConstructorUsedError;
  List<int> get activePointerIds => throw _privateConstructorUsedError;
  Point? get pointerPosition => throw _privateConstructorUsedError;
  double get selectedWidth => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            List<int> activePointerIds,
            Point? pointerPosition,
            Color selectedColor,
            double selectedWidth)
        drawing,
    required TResult Function(Sketch sketch, List<int> activePointerIds,
            Point? pointerPosition, bool lineMode, double selectedWidth)
        erasing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            List<int> activePointerIds,
            Point? pointerPosition,
            Color selectedColor,
            double selectedWidth)?
        drawing,
    TResult Function(Sketch sketch, List<int> activePointerIds,
            Point? pointerPosition, bool lineMode, double selectedWidth)?
        erasing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            List<int> activePointerIds,
            Point? pointerPosition,
            Color selectedColor,
            double selectedWidth)?
        drawing,
    TResult Function(Sketch sketch, List<int> activePointerIds,
            Point? pointerPosition, bool lineMode, double selectedWidth)?
        erasing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Drawing value) drawing,
    required TResult Function(Erasing value) erasing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Drawing value)? drawing,
    TResult Function(Erasing value)? erasing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Drawing value)? drawing,
    TResult Function(Erasing value)? erasing,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ScribbleStateCopyWith<ScribbleState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ScribbleStateCopyWith<$Res> {
  factory $ScribbleStateCopyWith(
          ScribbleState value, $Res Function(ScribbleState) then) =
      _$ScribbleStateCopyWithImpl<$Res>;
  $Res call(
      {Sketch sketch,
      List<int> activePointerIds,
      Point? pointerPosition,
      double selectedWidth});

  $SketchCopyWith<$Res> get sketch;
  $PointCopyWith<$Res>? get pointerPosition;
}

/// @nodoc
class _$ScribbleStateCopyWithImpl<$Res>
    implements $ScribbleStateCopyWith<$Res> {
  _$ScribbleStateCopyWithImpl(this._value, this._then);

  final ScribbleState _value;
  // ignore: unused_field
  final $Res Function(ScribbleState) _then;

  @override
  $Res call({
    Object? sketch = freezed,
    Object? activePointerIds = freezed,
    Object? pointerPosition = freezed,
    Object? selectedWidth = freezed,
  }) {
    return _then(_value.copyWith(
      sketch: sketch == freezed
          ? _value.sketch
          : sketch // ignore: cast_nullable_to_non_nullable
              as Sketch,
      activePointerIds: activePointerIds == freezed
          ? _value.activePointerIds
          : activePointerIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      pointerPosition: pointerPosition == freezed
          ? _value.pointerPosition
          : pointerPosition // ignore: cast_nullable_to_non_nullable
              as Point?,
      selectedWidth: selectedWidth == freezed
          ? _value.selectedWidth
          : selectedWidth // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $SketchCopyWith<$Res> get sketch {
    return $SketchCopyWith<$Res>(_value.sketch, (value) {
      return _then(_value.copyWith(sketch: value));
    });
  }

  @override
  $PointCopyWith<$Res>? get pointerPosition {
    if (_value.pointerPosition == null) {
      return null;
    }

    return $PointCopyWith<$Res>(_value.pointerPosition!, (value) {
      return _then(_value.copyWith(pointerPosition: value));
    });
  }
}

/// @nodoc
abstract class $DrawingCopyWith<$Res> implements $ScribbleStateCopyWith<$Res> {
  factory $DrawingCopyWith(Drawing value, $Res Function(Drawing) then) =
      _$DrawingCopyWithImpl<$Res>;
  @override
  $Res call(
      {Sketch sketch,
      SketchLine? activeLine,
      List<int> activePointerIds,
      Point? pointerPosition,
      Color selectedColor,
      double selectedWidth});

  @override
  $SketchCopyWith<$Res> get sketch;
  $SketchLineCopyWith<$Res>? get activeLine;
  @override
  $PointCopyWith<$Res>? get pointerPosition;
}

/// @nodoc
class _$DrawingCopyWithImpl<$Res> extends _$ScribbleStateCopyWithImpl<$Res>
    implements $DrawingCopyWith<$Res> {
  _$DrawingCopyWithImpl(Drawing _value, $Res Function(Drawing) _then)
      : super(_value, (v) => _then(v as Drawing));

  @override
  Drawing get _value => super._value as Drawing;

  @override
  $Res call({
    Object? sketch = freezed,
    Object? activeLine = freezed,
    Object? activePointerIds = freezed,
    Object? pointerPosition = freezed,
    Object? selectedColor = freezed,
    Object? selectedWidth = freezed,
  }) {
    return _then(Drawing(
      sketch: sketch == freezed
          ? _value.sketch
          : sketch // ignore: cast_nullable_to_non_nullable
              as Sketch,
      activeLine: activeLine == freezed
          ? _value.activeLine
          : activeLine // ignore: cast_nullable_to_non_nullable
              as SketchLine?,
      activePointerIds: activePointerIds == freezed
          ? _value.activePointerIds
          : activePointerIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      pointerPosition: pointerPosition == freezed
          ? _value.pointerPosition
          : pointerPosition // ignore: cast_nullable_to_non_nullable
              as Point?,
      selectedColor: selectedColor == freezed
          ? _value.selectedColor
          : selectedColor // ignore: cast_nullable_to_non_nullable
              as Color,
      selectedWidth: selectedWidth == freezed
          ? _value.selectedWidth
          : selectedWidth // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  @override
  $SketchLineCopyWith<$Res>? get activeLine {
    if (_value.activeLine == null) {
      return null;
    }

    return $SketchLineCopyWith<$Res>(_value.activeLine!, (value) {
      return _then(_value.copyWith(activeLine: value));
    });
  }
}

/// @nodoc

class _$Drawing extends Drawing {
  const _$Drawing(
      {required this.sketch,
      this.activeLine,
      this.activePointerIds = const [],
      this.pointerPosition,
      this.selectedColor = Colors.black,
      this.selectedWidth = 5})
      : super._();

  @override
  final Sketch sketch;
  @override
  final SketchLine? activeLine;
  @JsonKey(defaultValue: const [])
  @override
  final List<int> activePointerIds;
  @override
  final Point? pointerPosition;
  @JsonKey(defaultValue: Colors.black)
  @override
  final Color selectedColor;
  @JsonKey(defaultValue: 5)
  @override
  final double selectedWidth;

  @override
  String toString() {
    return 'ScribbleState.drawing(sketch: $sketch, activeLine: $activeLine, activePointerIds: $activePointerIds, pointerPosition: $pointerPosition, selectedColor: $selectedColor, selectedWidth: $selectedWidth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Drawing &&
            (identical(other.sketch, sketch) ||
                const DeepCollectionEquality().equals(other.sketch, sketch)) &&
            (identical(other.activeLine, activeLine) ||
                const DeepCollectionEquality()
                    .equals(other.activeLine, activeLine)) &&
            (identical(other.activePointerIds, activePointerIds) ||
                const DeepCollectionEquality()
                    .equals(other.activePointerIds, activePointerIds)) &&
            (identical(other.pointerPosition, pointerPosition) ||
                const DeepCollectionEquality()
                    .equals(other.pointerPosition, pointerPosition)) &&
            (identical(other.selectedColor, selectedColor) ||
                const DeepCollectionEquality()
                    .equals(other.selectedColor, selectedColor)) &&
            (identical(other.selectedWidth, selectedWidth) ||
                const DeepCollectionEquality()
                    .equals(other.selectedWidth, selectedWidth)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sketch) ^
      const DeepCollectionEquality().hash(activeLine) ^
      const DeepCollectionEquality().hash(activePointerIds) ^
      const DeepCollectionEquality().hash(pointerPosition) ^
      const DeepCollectionEquality().hash(selectedColor) ^
      const DeepCollectionEquality().hash(selectedWidth);

  @JsonKey(ignore: true)
  @override
  $DrawingCopyWith<Drawing> get copyWith =>
      _$DrawingCopyWithImpl<Drawing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            List<int> activePointerIds,
            Point? pointerPosition,
            Color selectedColor,
            double selectedWidth)
        drawing,
    required TResult Function(Sketch sketch, List<int> activePointerIds,
            Point? pointerPosition, bool lineMode, double selectedWidth)
        erasing,
  }) {
    return drawing(sketch, activeLine, activePointerIds, pointerPosition,
        selectedColor, selectedWidth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            List<int> activePointerIds,
            Point? pointerPosition,
            Color selectedColor,
            double selectedWidth)?
        drawing,
    TResult Function(Sketch sketch, List<int> activePointerIds,
            Point? pointerPosition, bool lineMode, double selectedWidth)?
        erasing,
  }) {
    return drawing?.call(sketch, activeLine, activePointerIds, pointerPosition,
        selectedColor, selectedWidth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            List<int> activePointerIds,
            Point? pointerPosition,
            Color selectedColor,
            double selectedWidth)?
        drawing,
    TResult Function(Sketch sketch, List<int> activePointerIds,
            Point? pointerPosition, bool lineMode, double selectedWidth)?
        erasing,
    required TResult orElse(),
  }) {
    if (drawing != null) {
      return drawing(sketch, activeLine, activePointerIds, pointerPosition,
          selectedColor, selectedWidth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Drawing value) drawing,
    required TResult Function(Erasing value) erasing,
  }) {
    return drawing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Drawing value)? drawing,
    TResult Function(Erasing value)? erasing,
  }) {
    return drawing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Drawing value)? drawing,
    TResult Function(Erasing value)? erasing,
    required TResult orElse(),
  }) {
    if (drawing != null) {
      return drawing(this);
    }
    return orElse();
  }
}

abstract class Drawing extends ScribbleState {
  const factory Drawing(
      {required Sketch sketch,
      SketchLine? activeLine,
      List<int> activePointerIds,
      Point? pointerPosition,
      Color selectedColor,
      double selectedWidth}) = _$Drawing;
  const Drawing._() : super._();

  @override
  Sketch get sketch => throw _privateConstructorUsedError;
  SketchLine? get activeLine => throw _privateConstructorUsedError;
  @override
  List<int> get activePointerIds => throw _privateConstructorUsedError;
  @override
  Point? get pointerPosition => throw _privateConstructorUsedError;
  Color get selectedColor => throw _privateConstructorUsedError;
  @override
  double get selectedWidth => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $DrawingCopyWith<Drawing> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ErasingCopyWith<$Res> implements $ScribbleStateCopyWith<$Res> {
  factory $ErasingCopyWith(Erasing value, $Res Function(Erasing) then) =
      _$ErasingCopyWithImpl<$Res>;
  @override
  $Res call(
      {Sketch sketch,
      List<int> activePointerIds,
      Point? pointerPosition,
      bool lineMode,
      double selectedWidth});

  @override
  $SketchCopyWith<$Res> get sketch;
  @override
  $PointCopyWith<$Res>? get pointerPosition;
}

/// @nodoc
class _$ErasingCopyWithImpl<$Res> extends _$ScribbleStateCopyWithImpl<$Res>
    implements $ErasingCopyWith<$Res> {
  _$ErasingCopyWithImpl(Erasing _value, $Res Function(Erasing) _then)
      : super(_value, (v) => _then(v as Erasing));

  @override
  Erasing get _value => super._value as Erasing;

  @override
  $Res call({
    Object? sketch = freezed,
    Object? activePointerIds = freezed,
    Object? pointerPosition = freezed,
    Object? lineMode = freezed,
    Object? selectedWidth = freezed,
  }) {
    return _then(Erasing(
      sketch: sketch == freezed
          ? _value.sketch
          : sketch // ignore: cast_nullable_to_non_nullable
              as Sketch,
      activePointerIds: activePointerIds == freezed
          ? _value.activePointerIds
          : activePointerIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      pointerPosition: pointerPosition == freezed
          ? _value.pointerPosition
          : pointerPosition // ignore: cast_nullable_to_non_nullable
              as Point?,
      lineMode: lineMode == freezed
          ? _value.lineMode
          : lineMode // ignore: cast_nullable_to_non_nullable
              as bool,
      selectedWidth: selectedWidth == freezed
          ? _value.selectedWidth
          : selectedWidth // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$Erasing extends Erasing {
  const _$Erasing(
      {required this.sketch,
      this.activePointerIds = const [],
      this.pointerPosition,
      this.lineMode = true,
      this.selectedWidth = 5})
      : super._();

  @override
  final Sketch sketch;
  @JsonKey(defaultValue: const [])
  @override
  final List<int> activePointerIds;
  @override
  final Point? pointerPosition;
  @JsonKey(defaultValue: true)
  @override
  final bool lineMode;
  @JsonKey(defaultValue: 5)
  @override
  final double selectedWidth;

  @override
  String toString() {
    return 'ScribbleState.erasing(sketch: $sketch, activePointerIds: $activePointerIds, pointerPosition: $pointerPosition, lineMode: $lineMode, selectedWidth: $selectedWidth)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is Erasing &&
            (identical(other.sketch, sketch) ||
                const DeepCollectionEquality().equals(other.sketch, sketch)) &&
            (identical(other.activePointerIds, activePointerIds) ||
                const DeepCollectionEquality()
                    .equals(other.activePointerIds, activePointerIds)) &&
            (identical(other.pointerPosition, pointerPosition) ||
                const DeepCollectionEquality()
                    .equals(other.pointerPosition, pointerPosition)) &&
            (identical(other.lineMode, lineMode) ||
                const DeepCollectionEquality()
                    .equals(other.lineMode, lineMode)) &&
            (identical(other.selectedWidth, selectedWidth) ||
                const DeepCollectionEquality()
                    .equals(other.selectedWidth, selectedWidth)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(sketch) ^
      const DeepCollectionEquality().hash(activePointerIds) ^
      const DeepCollectionEquality().hash(pointerPosition) ^
      const DeepCollectionEquality().hash(lineMode) ^
      const DeepCollectionEquality().hash(selectedWidth);

  @JsonKey(ignore: true)
  @override
  $ErasingCopyWith<Erasing> get copyWith =>
      _$ErasingCopyWithImpl<Erasing>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            List<int> activePointerIds,
            Point? pointerPosition,
            Color selectedColor,
            double selectedWidth)
        drawing,
    required TResult Function(Sketch sketch, List<int> activePointerIds,
            Point? pointerPosition, bool lineMode, double selectedWidth)
        erasing,
  }) {
    return erasing(
        sketch, activePointerIds, pointerPosition, lineMode, selectedWidth);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            List<int> activePointerIds,
            Point? pointerPosition,
            Color selectedColor,
            double selectedWidth)?
        drawing,
    TResult Function(Sketch sketch, List<int> activePointerIds,
            Point? pointerPosition, bool lineMode, double selectedWidth)?
        erasing,
  }) {
    return erasing?.call(
        sketch, activePointerIds, pointerPosition, lineMode, selectedWidth);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            List<int> activePointerIds,
            Point? pointerPosition,
            Color selectedColor,
            double selectedWidth)?
        drawing,
    TResult Function(Sketch sketch, List<int> activePointerIds,
            Point? pointerPosition, bool lineMode, double selectedWidth)?
        erasing,
    required TResult orElse(),
  }) {
    if (erasing != null) {
      return erasing(
          sketch, activePointerIds, pointerPosition, lineMode, selectedWidth);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Drawing value) drawing,
    required TResult Function(Erasing value) erasing,
  }) {
    return erasing(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Drawing value)? drawing,
    TResult Function(Erasing value)? erasing,
  }) {
    return erasing?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Drawing value)? drawing,
    TResult Function(Erasing value)? erasing,
    required TResult orElse(),
  }) {
    if (erasing != null) {
      return erasing(this);
    }
    return orElse();
  }
}

abstract class Erasing extends ScribbleState {
  const factory Erasing(
      {required Sketch sketch,
      List<int> activePointerIds,
      Point? pointerPosition,
      bool lineMode,
      double selectedWidth}) = _$Erasing;
  const Erasing._() : super._();

  @override
  Sketch get sketch => throw _privateConstructorUsedError;
  @override
  List<int> get activePointerIds => throw _privateConstructorUsedError;
  @override
  Point? get pointerPosition => throw _privateConstructorUsedError;
  bool get lineMode => throw _privateConstructorUsedError;
  @override
  double get selectedWidth => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  $ErasingCopyWith<Erasing> get copyWith => throw _privateConstructorUsedError;
}
