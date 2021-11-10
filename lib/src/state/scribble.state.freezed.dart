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

ScribbleState _$ScribbleStateFromJson(Map<String, dynamic> json) {
  switch (json['type']) {
    case 'drawing':
      return Drawing.fromJson(json);
    case 'erasing':
      return Erasing.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'type', 'ScribbleState',
          'Invalid union type "${json['type']}"!');
  }
}

/// @nodoc
class _$ScribbleStateTearOff {
  const _$ScribbleStateTearOff();

  Drawing drawing(
      {required Sketch sketch,
      SketchLine? activeLine,
      ScribblePointerMode allowedPointersMode = ScribblePointerMode.all,
      List<int> activePointerIds = const [],
      Point? pointerPosition,
      int selectedColor = 0xFF000000,
      double selectedWidth = 5,
      double scaleFactor = 1}) {
    return Drawing(
      sketch: sketch,
      activeLine: activeLine,
      allowedPointersMode: allowedPointersMode,
      activePointerIds: activePointerIds,
      pointerPosition: pointerPosition,
      selectedColor: selectedColor,
      selectedWidth: selectedWidth,
      scaleFactor: scaleFactor,
    );
  }

  Erasing erasing(
      {required Sketch sketch,
      ScribblePointerMode allowedPointersMode = ScribblePointerMode.all,
      List<int> activePointerIds = const [],
      Point? pointerPosition,
      double selectedWidth = 5,
      double scaleFactor = 1}) {
    return Erasing(
      sketch: sketch,
      allowedPointersMode: allowedPointersMode,
      activePointerIds: activePointerIds,
      pointerPosition: pointerPosition,
      selectedWidth: selectedWidth,
      scaleFactor: scaleFactor,
    );
  }

  ScribbleState fromJson(Map<String, Object?> json) {
    return ScribbleState.fromJson(json);
  }
}

/// @nodoc
const $ScribbleState = _$ScribbleStateTearOff();

/// @nodoc
mixin _$ScribbleState {
  /// The current state of the sketch
  Sketch get sketch => throw _privateConstructorUsedError;

  /// Which pointers are allowed for drawing and will be captured by the
  /// scribble widget.
  ScribblePointerMode get allowedPointersMode =>
      throw _privateConstructorUsedError;

  /// The ids of all supported pointers that are currently interacting with
  /// the widget.
  List<int> get activePointerIds => throw _privateConstructorUsedError;

  /// The current position of the pointer
  Point? get pointerPosition => throw _privateConstructorUsedError;

  /// The current width of the pen
  double get selectedWidth => throw _privateConstructorUsedError;

  /// How much the widget is scaled at the moment.
  ///
  /// Can be used if zoom functionality is needed
  /// (e.g. through InteractiveViewer) so that the pen width remains the same.
  double get scaleFactor => throw _privateConstructorUsedError;

  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor)
        drawing,
    required TResult Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor)
        erasing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor)?
        drawing,
    TResult Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor)?
        erasing,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor)?
        drawing,
    TResult Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor)?
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
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
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
      ScribblePointerMode allowedPointersMode,
      List<int> activePointerIds,
      Point? pointerPosition,
      double selectedWidth,
      double scaleFactor});

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
    Object? allowedPointersMode = freezed,
    Object? activePointerIds = freezed,
    Object? pointerPosition = freezed,
    Object? selectedWidth = freezed,
    Object? scaleFactor = freezed,
  }) {
    return _then(_value.copyWith(
      sketch: sketch == freezed
          ? _value.sketch
          : sketch // ignore: cast_nullable_to_non_nullable
              as Sketch,
      allowedPointersMode: allowedPointersMode == freezed
          ? _value.allowedPointersMode
          : allowedPointersMode // ignore: cast_nullable_to_non_nullable
              as ScribblePointerMode,
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
      scaleFactor: scaleFactor == freezed
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
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
      ScribblePointerMode allowedPointersMode,
      List<int> activePointerIds,
      Point? pointerPosition,
      int selectedColor,
      double selectedWidth,
      double scaleFactor});

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
    Object? allowedPointersMode = freezed,
    Object? activePointerIds = freezed,
    Object? pointerPosition = freezed,
    Object? selectedColor = freezed,
    Object? selectedWidth = freezed,
    Object? scaleFactor = freezed,
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
      allowedPointersMode: allowedPointersMode == freezed
          ? _value.allowedPointersMode
          : allowedPointersMode // ignore: cast_nullable_to_non_nullable
              as ScribblePointerMode,
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
              as int,
      selectedWidth: selectedWidth == freezed
          ? _value.selectedWidth
          : selectedWidth // ignore: cast_nullable_to_non_nullable
              as double,
      scaleFactor: scaleFactor == freezed
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
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
@JsonSerializable()
class _$Drawing extends Drawing {
  const _$Drawing(
      {required this.sketch,
      this.activeLine,
      this.allowedPointersMode = ScribblePointerMode.all,
      this.activePointerIds = const [],
      this.pointerPosition,
      this.selectedColor = 0xFF000000,
      this.selectedWidth = 5,
      this.scaleFactor = 1,
      String? $type})
      : $type = $type ?? 'drawing',
        super._();

  factory _$Drawing.fromJson(Map<String, dynamic> json) =>
      _$$DrawingFromJson(json);

  @override

  /// The current state of the sketch
  final Sketch sketch;
  @override

  /// The line that is currently being drawn
  final SketchLine? activeLine;
  @JsonKey(defaultValue: ScribblePointerMode.all)
  @override

  /// Which pointers are allowed for drawing and will be captured by the
  /// scribble widget.
  final ScribblePointerMode allowedPointersMode;
  @JsonKey(defaultValue: const [])
  @override

  /// The ids of all supported pointers that are currently interacting with
  /// the widget.
  final List<int> activePointerIds;
  @override

  /// The current position of the pointer
  final Point? pointerPosition;
  @JsonKey(defaultValue: 0xFF000000)
  @override

  /// The color that is currently being drawn with
  final int selectedColor;
  @JsonKey(defaultValue: 5)
  @override

  /// The current width of the pen
  final double selectedWidth;
  @JsonKey(defaultValue: 1)
  @override

  /// How much the widget is scaled at the moment.
  ///
  /// Can be used if zoom functionality is needed
  /// (e.g. through InteractiveViewer) so that the pen width remains the same.
  final double scaleFactor;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ScribbleState.drawing(sketch: $sketch, activeLine: $activeLine, allowedPointersMode: $allowedPointersMode, activePointerIds: $activePointerIds, pointerPosition: $pointerPosition, selectedColor: $selectedColor, selectedWidth: $selectedWidth, scaleFactor: $scaleFactor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Drawing &&
            (identical(other.sketch, sketch) || other.sketch == sketch) &&
            (identical(other.activeLine, activeLine) ||
                other.activeLine == activeLine) &&
            (identical(other.allowedPointersMode, allowedPointersMode) ||
                other.allowedPointersMode == allowedPointersMode) &&
            const DeepCollectionEquality()
                .equals(other.activePointerIds, activePointerIds) &&
            (identical(other.pointerPosition, pointerPosition) ||
                other.pointerPosition == pointerPosition) &&
            (identical(other.selectedColor, selectedColor) ||
                other.selectedColor == selectedColor) &&
            (identical(other.selectedWidth, selectedWidth) ||
                other.selectedWidth == selectedWidth) &&
            (identical(other.scaleFactor, scaleFactor) ||
                other.scaleFactor == scaleFactor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sketch,
      activeLine,
      allowedPointersMode,
      const DeepCollectionEquality().hash(activePointerIds),
      pointerPosition,
      selectedColor,
      selectedWidth,
      scaleFactor);

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
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor)
        drawing,
    required TResult Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor)
        erasing,
  }) {
    return drawing(sketch, activeLine, allowedPointersMode, activePointerIds,
        pointerPosition, selectedColor, selectedWidth, scaleFactor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor)?
        drawing,
    TResult Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor)?
        erasing,
  }) {
    return drawing?.call(
        sketch,
        activeLine,
        allowedPointersMode,
        activePointerIds,
        pointerPosition,
        selectedColor,
        selectedWidth,
        scaleFactor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor)?
        drawing,
    TResult Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor)?
        erasing,
    required TResult orElse(),
  }) {
    if (drawing != null) {
      return drawing(sketch, activeLine, allowedPointersMode, activePointerIds,
          pointerPosition, selectedColor, selectedWidth, scaleFactor);
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

  @override
  Map<String, dynamic> toJson() {
    return _$$DrawingToJson(this);
  }
}

abstract class Drawing extends ScribbleState {
  const factory Drawing(
      {required Sketch sketch,
      SketchLine? activeLine,
      ScribblePointerMode allowedPointersMode,
      List<int> activePointerIds,
      Point? pointerPosition,
      int selectedColor,
      double selectedWidth,
      double scaleFactor}) = _$Drawing;
  const Drawing._() : super._();

  factory Drawing.fromJson(Map<String, dynamic> json) = _$Drawing.fromJson;

  @override

  /// The current state of the sketch
  Sketch get sketch;

  /// The line that is currently being drawn
  SketchLine? get activeLine;
  @override

  /// Which pointers are allowed for drawing and will be captured by the
  /// scribble widget.
  ScribblePointerMode get allowedPointersMode;
  @override

  /// The ids of all supported pointers that are currently interacting with
  /// the widget.
  List<int> get activePointerIds;
  @override

  /// The current position of the pointer
  Point? get pointerPosition;

  /// The color that is currently being drawn with
  int get selectedColor;
  @override

  /// The current width of the pen
  double get selectedWidth;
  @override

  /// How much the widget is scaled at the moment.
  ///
  /// Can be used if zoom functionality is needed
  /// (e.g. through InteractiveViewer) so that the pen width remains the same.
  double get scaleFactor;
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
      ScribblePointerMode allowedPointersMode,
      List<int> activePointerIds,
      Point? pointerPosition,
      double selectedWidth,
      double scaleFactor});

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
    Object? allowedPointersMode = freezed,
    Object? activePointerIds = freezed,
    Object? pointerPosition = freezed,
    Object? selectedWidth = freezed,
    Object? scaleFactor = freezed,
  }) {
    return _then(Erasing(
      sketch: sketch == freezed
          ? _value.sketch
          : sketch // ignore: cast_nullable_to_non_nullable
              as Sketch,
      allowedPointersMode: allowedPointersMode == freezed
          ? _value.allowedPointersMode
          : allowedPointersMode // ignore: cast_nullable_to_non_nullable
              as ScribblePointerMode,
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
      scaleFactor: scaleFactor == freezed
          ? _value.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$Erasing extends Erasing {
  const _$Erasing(
      {required this.sketch,
      this.allowedPointersMode = ScribblePointerMode.all,
      this.activePointerIds = const [],
      this.pointerPosition,
      this.selectedWidth = 5,
      this.scaleFactor = 1,
      String? $type})
      : $type = $type ?? 'erasing',
        super._();

  factory _$Erasing.fromJson(Map<String, dynamic> json) =>
      _$$ErasingFromJson(json);

  @override

  /// The current state of the sketch
  final Sketch sketch;
  @JsonKey(defaultValue: ScribblePointerMode.all)
  @override

  /// Which pointers are allowed for drawing and will be captured by the
  /// scribble widget.
  final ScribblePointerMode allowedPointersMode;
  @JsonKey(defaultValue: const [])
  @override

  /// The ids of all supported pointers that are currently interacting with
  /// the widget.
  final List<int> activePointerIds;
  @override

  /// The current position of the pointer
  final Point? pointerPosition;
  @JsonKey(defaultValue: 5)
  @override

  /// The current width of the pen
  final double selectedWidth;
  @JsonKey(defaultValue: 1)
  @override

  /// How much the widget is scaled at the moment.
  ///
  /// Can be used if zoom functionality is needed
  /// (e.g. through InteractiveViewer) so that the pen width remains the same.
  final double scaleFactor;

  @JsonKey(name: 'type')
  final String $type;

  @override
  String toString() {
    return 'ScribbleState.erasing(sketch: $sketch, allowedPointersMode: $allowedPointersMode, activePointerIds: $activePointerIds, pointerPosition: $pointerPosition, selectedWidth: $selectedWidth, scaleFactor: $scaleFactor)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Erasing &&
            (identical(other.sketch, sketch) || other.sketch == sketch) &&
            (identical(other.allowedPointersMode, allowedPointersMode) ||
                other.allowedPointersMode == allowedPointersMode) &&
            const DeepCollectionEquality()
                .equals(other.activePointerIds, activePointerIds) &&
            (identical(other.pointerPosition, pointerPosition) ||
                other.pointerPosition == pointerPosition) &&
            (identical(other.selectedWidth, selectedWidth) ||
                other.selectedWidth == selectedWidth) &&
            (identical(other.scaleFactor, scaleFactor) ||
                other.scaleFactor == scaleFactor));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      sketch,
      allowedPointersMode,
      const DeepCollectionEquality().hash(activePointerIds),
      pointerPosition,
      selectedWidth,
      scaleFactor);

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
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor)
        drawing,
    required TResult Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor)
        erasing,
  }) {
    return erasing(sketch, allowedPointersMode, activePointerIds,
        pointerPosition, selectedWidth, scaleFactor);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor)?
        drawing,
    TResult Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor)?
        erasing,
  }) {
    return erasing?.call(sketch, allowedPointersMode, activePointerIds,
        pointerPosition, selectedWidth, scaleFactor);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor)?
        drawing,
    TResult Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor)?
        erasing,
    required TResult orElse(),
  }) {
    if (erasing != null) {
      return erasing(sketch, allowedPointersMode, activePointerIds,
          pointerPosition, selectedWidth, scaleFactor);
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

  @override
  Map<String, dynamic> toJson() {
    return _$$ErasingToJson(this);
  }
}

abstract class Erasing extends ScribbleState {
  const factory Erasing(
      {required Sketch sketch,
      ScribblePointerMode allowedPointersMode,
      List<int> activePointerIds,
      Point? pointerPosition,
      double selectedWidth,
      double scaleFactor}) = _$Erasing;
  const Erasing._() : super._();

  factory Erasing.fromJson(Map<String, dynamic> json) = _$Erasing.fromJson;

  @override

  /// The current state of the sketch
  Sketch get sketch;
  @override

  /// Which pointers are allowed for drawing and will be captured by the
  /// scribble widget.
  ScribblePointerMode get allowedPointersMode;
  @override

  /// The ids of all supported pointers that are currently interacting with
  /// the widget.
  List<int> get activePointerIds;
  @override

  /// The current position of the pointer
  Point? get pointerPosition;
  @override

  /// The current width of the pen
  double get selectedWidth;
  @override

  /// How much the widget is scaled at the moment.
  ///
  /// Can be used if zoom functionality is needed
  /// (e.g. through InteractiveViewer) so that the pen width remains the same.
  double get scaleFactor;
  @override
  @JsonKey(ignore: true)
  $ErasingCopyWith<Erasing> get copyWith => throw _privateConstructorUsedError;
}
