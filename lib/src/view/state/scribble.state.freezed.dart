// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'scribble.state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
ScribbleState _$ScribbleStateFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'drawing':
      return Drawing.fromJson(json);
    case 'erasing':
      return Erasing.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ScribbleState',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ScribbleState {
  /// The current state of the sketch
  Sketch get sketch;

  /// Which pointers are allowed for drawing and will be captured by the
  /// scribble widget.
  ScribblePointerMode get allowedPointersMode;

  /// The ids of all supported pointers that are currently interacting with
  /// the widget.
  List<int> get activePointerIds;

  /// The current position of the pointer
  Point? get pointerPosition;

  /// The current width of the pen
  double get selectedWidth;

  /// {@template view.state.scribble_state.scale_factor}
  /// How much the widget is scaled at the moment.
  ///
  /// Can be used if zoom functionality is needed
  /// (e.g. through InteractiveViewer) so that the pen width remains the same.
  /// {@endtemplate}
  double get scaleFactor;

  /// {@template view.state.scribble_state.simplification_tolerance}
  /// The current tolerance of simplification, in pixels.
  ///
  /// Lines will be simplified when they are finished. A value of 0 (default)
  /// will mean no simplification.
  /// {@endtemplate}
  double get simplificationTolerance;

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ScribbleStateCopyWith<ScribbleState> get copyWith =>
      _$ScribbleStateCopyWithImpl<ScribbleState>(
          this as ScribbleState, _$identity);

  /// Serializes this ScribbleState to a JSON map.
  Map<String, dynamic> toJson();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ScribbleState &&
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
                other.scaleFactor == scaleFactor) &&
            (identical(
                    other.simplificationTolerance, simplificationTolerance) ||
                other.simplificationTolerance == simplificationTolerance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sketch,
      allowedPointersMode,
      const DeepCollectionEquality().hash(activePointerIds),
      pointerPosition,
      selectedWidth,
      scaleFactor,
      simplificationTolerance);

  @override
  String toString() {
    return 'ScribbleState(sketch: $sketch, allowedPointersMode: $allowedPointersMode, activePointerIds: $activePointerIds, pointerPosition: $pointerPosition, selectedWidth: $selectedWidth, scaleFactor: $scaleFactor, simplificationTolerance: $simplificationTolerance)';
  }
}

/// @nodoc
abstract mixin class $ScribbleStateCopyWith<$Res> {
  factory $ScribbleStateCopyWith(
          ScribbleState value, $Res Function(ScribbleState) _then) =
      _$ScribbleStateCopyWithImpl;
  @useResult
  $Res call(
      {Sketch sketch,
      ScribblePointerMode allowedPointersMode,
      List<int> activePointerIds,
      Point? pointerPosition,
      double selectedWidth,
      double scaleFactor,
      double simplificationTolerance});

  $SketchCopyWith<$Res> get sketch;
  $PointCopyWith<$Res>? get pointerPosition;
}

/// @nodoc
class _$ScribbleStateCopyWithImpl<$Res>
    implements $ScribbleStateCopyWith<$Res> {
  _$ScribbleStateCopyWithImpl(this._self, this._then);

  final ScribbleState _self;
  final $Res Function(ScribbleState) _then;

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? sketch = null,
    Object? allowedPointersMode = null,
    Object? activePointerIds = null,
    Object? pointerPosition = freezed,
    Object? selectedWidth = null,
    Object? scaleFactor = null,
    Object? simplificationTolerance = null,
  }) {
    return _then(_self.copyWith(
      sketch: null == sketch
          ? _self.sketch
          : sketch // ignore: cast_nullable_to_non_nullable
              as Sketch,
      allowedPointersMode: null == allowedPointersMode
          ? _self.allowedPointersMode
          : allowedPointersMode // ignore: cast_nullable_to_non_nullable
              as ScribblePointerMode,
      activePointerIds: null == activePointerIds
          ? _self.activePointerIds
          : activePointerIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      pointerPosition: freezed == pointerPosition
          ? _self.pointerPosition
          : pointerPosition // ignore: cast_nullable_to_non_nullable
              as Point?,
      selectedWidth: null == selectedWidth
          ? _self.selectedWidth
          : selectedWidth // ignore: cast_nullable_to_non_nullable
              as double,
      scaleFactor: null == scaleFactor
          ? _self.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      simplificationTolerance: null == simplificationTolerance
          ? _self.simplificationTolerance
          : simplificationTolerance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SketchCopyWith<$Res> get sketch {
    return $SketchCopyWith<$Res>(_self.sketch, (value) {
      return _then(_self.copyWith(sketch: value));
    });
  }

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res>? get pointerPosition {
    if (_self.pointerPosition == null) {
      return null;
    }

    return $PointCopyWith<$Res>(_self.pointerPosition!, (value) {
      return _then(_self.copyWith(pointerPosition: value));
    });
  }
}

/// Adds pattern-matching-related methods to [ScribbleState].
extension ScribbleStatePatterns on ScribbleState {
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
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Drawing value)? drawing,
    TResult Function(Erasing value)? erasing,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Drawing() when drawing != null:
        return drawing(_that);
      case Erasing() when erasing != null:
        return erasing(_that);
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
  TResult map<TResult extends Object?>({
    required TResult Function(Drawing value) drawing,
    required TResult Function(Erasing value) erasing,
  }) {
    final _that = this;
    switch (_that) {
      case Drawing():
        return drawing(_that);
      case Erasing():
        return erasing(_that);
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
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(Drawing value)? drawing,
    TResult? Function(Erasing value)? erasing,
  }) {
    final _that = this;
    switch (_that) {
      case Drawing() when drawing != null:
        return drawing(_that);
      case Erasing() when erasing != null:
        return erasing(_that);
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
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor,
            double simplificationTolerance)?
        drawing,
    TResult Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor,
            double simplificationTolerance)?
        erasing,
    required TResult orElse(),
  }) {
    final _that = this;
    switch (_that) {
      case Drawing() when drawing != null:
        return drawing(
            _that.sketch,
            _that.activeLine,
            _that.allowedPointersMode,
            _that.activePointerIds,
            _that.pointerPosition,
            _that.selectedColor,
            _that.selectedWidth,
            _that.scaleFactor,
            _that.simplificationTolerance);
      case Erasing() when erasing != null:
        return erasing(
            _that.sketch,
            _that.allowedPointersMode,
            _that.activePointerIds,
            _that.pointerPosition,
            _that.selectedWidth,
            _that.scaleFactor,
            _that.simplificationTolerance);
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
  TResult when<TResult extends Object?>({
    required TResult Function(
            Sketch sketch,
            SketchLine? activeLine,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor,
            double simplificationTolerance)
        drawing,
    required TResult Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor,
            double simplificationTolerance)
        erasing,
  }) {
    final _that = this;
    switch (_that) {
      case Drawing():
        return drawing(
            _that.sketch,
            _that.activeLine,
            _that.allowedPointersMode,
            _that.activePointerIds,
            _that.pointerPosition,
            _that.selectedColor,
            _that.selectedWidth,
            _that.scaleFactor,
            _that.simplificationTolerance);
      case Erasing():
        return erasing(
            _that.sketch,
            _that.allowedPointersMode,
            _that.activePointerIds,
            _that.pointerPosition,
            _that.selectedWidth,
            _that.scaleFactor,
            _that.simplificationTolerance);
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
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(
            Sketch sketch,
            SketchLine? activeLine,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            int selectedColor,
            double selectedWidth,
            double scaleFactor,
            double simplificationTolerance)?
        drawing,
    TResult? Function(
            Sketch sketch,
            ScribblePointerMode allowedPointersMode,
            List<int> activePointerIds,
            Point? pointerPosition,
            double selectedWidth,
            double scaleFactor,
            double simplificationTolerance)?
        erasing,
  }) {
    final _that = this;
    switch (_that) {
      case Drawing() when drawing != null:
        return drawing(
            _that.sketch,
            _that.activeLine,
            _that.allowedPointersMode,
            _that.activePointerIds,
            _that.pointerPosition,
            _that.selectedColor,
            _that.selectedWidth,
            _that.scaleFactor,
            _that.simplificationTolerance);
      case Erasing() when erasing != null:
        return erasing(
            _that.sketch,
            _that.allowedPointersMode,
            _that.activePointerIds,
            _that.pointerPosition,
            _that.selectedWidth,
            _that.scaleFactor,
            _that.simplificationTolerance);
      case _:
        return null;
    }
  }
}

/// @nodoc
@JsonSerializable()
class Drawing extends ScribbleState {
  const Drawing(
      {required this.sketch,
      this.activeLine,
      this.allowedPointersMode = ScribblePointerMode.all,
      final List<int> activePointerIds = const [],
      this.pointerPosition,
      this.selectedColor = 0xFF000000,
      this.selectedWidth = 5,
      this.scaleFactor = 1,
      this.simplificationTolerance = 0,
      final String? $type})
      : _activePointerIds = activePointerIds,
        $type = $type ?? 'drawing',
        super._();
  factory Drawing.fromJson(Map<String, dynamic> json) =>
      _$DrawingFromJson(json);

  /// The current state of the sketch
  @override
  final Sketch sketch;

  /// The line that is currently being drawn
  final SketchLine? activeLine;

  /// Which pointers are allowed for drawing and will be captured by the
  /// scribble widget.
  @override
  @JsonKey()
  final ScribblePointerMode allowedPointersMode;

  /// The ids of all supported pointers that are currently interacting with
  /// the widget.
  final List<int> _activePointerIds;

  /// The ids of all supported pointers that are currently interacting with
  /// the widget.
  @override
  @JsonKey()
  List<int> get activePointerIds {
    if (_activePointerIds is EqualUnmodifiableListView)
      return _activePointerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activePointerIds);
  }

  /// The current position of the pointer
  @override
  final Point? pointerPosition;

  /// The color that is currently being drawn with
  @JsonKey()
  final int selectedColor;

  /// The current width of the pen
  @override
  @JsonKey()
  final double selectedWidth;

  /// {@template view.state.scribble_state.scale_factor}
  /// How much the widget is scaled at the moment.
  ///
  /// Can be used if zoom functionality is needed
  /// (e.g. through InteractiveViewer) so that the pen width remains the same.
  /// {@endtemplate}
  @override
  @JsonKey()
  final double scaleFactor;

  /// {@template view.state.scribble_state.simplification_tolerance}
  /// The current tolerance of simplification, in pixels.
  ///
  /// Lines will be simplified when they are finished. A value of 0 (default)
  /// will mean no simplification.
  /// {@endtemplate}
  @override
  @JsonKey()
  final double simplificationTolerance;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $DrawingCopyWith<Drawing> get copyWith =>
      _$DrawingCopyWithImpl<Drawing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$DrawingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Drawing &&
            (identical(other.sketch, sketch) || other.sketch == sketch) &&
            (identical(other.activeLine, activeLine) ||
                other.activeLine == activeLine) &&
            (identical(other.allowedPointersMode, allowedPointersMode) ||
                other.allowedPointersMode == allowedPointersMode) &&
            const DeepCollectionEquality()
                .equals(other._activePointerIds, _activePointerIds) &&
            (identical(other.pointerPosition, pointerPosition) ||
                other.pointerPosition == pointerPosition) &&
            (identical(other.selectedColor, selectedColor) ||
                other.selectedColor == selectedColor) &&
            (identical(other.selectedWidth, selectedWidth) ||
                other.selectedWidth == selectedWidth) &&
            (identical(other.scaleFactor, scaleFactor) ||
                other.scaleFactor == scaleFactor) &&
            (identical(
                    other.simplificationTolerance, simplificationTolerance) ||
                other.simplificationTolerance == simplificationTolerance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sketch,
      activeLine,
      allowedPointersMode,
      const DeepCollectionEquality().hash(_activePointerIds),
      pointerPosition,
      selectedColor,
      selectedWidth,
      scaleFactor,
      simplificationTolerance);

  @override
  String toString() {
    return 'ScribbleState.drawing(sketch: $sketch, activeLine: $activeLine, allowedPointersMode: $allowedPointersMode, activePointerIds: $activePointerIds, pointerPosition: $pointerPosition, selectedColor: $selectedColor, selectedWidth: $selectedWidth, scaleFactor: $scaleFactor, simplificationTolerance: $simplificationTolerance)';
  }
}

/// @nodoc
abstract mixin class $DrawingCopyWith<$Res>
    implements $ScribbleStateCopyWith<$Res> {
  factory $DrawingCopyWith(Drawing value, $Res Function(Drawing) _then) =
      _$DrawingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Sketch sketch,
      SketchLine? activeLine,
      ScribblePointerMode allowedPointersMode,
      List<int> activePointerIds,
      Point? pointerPosition,
      int selectedColor,
      double selectedWidth,
      double scaleFactor,
      double simplificationTolerance});

  @override
  $SketchCopyWith<$Res> get sketch;
  $SketchLineCopyWith<$Res>? get activeLine;
  @override
  $PointCopyWith<$Res>? get pointerPosition;
}

/// @nodoc
class _$DrawingCopyWithImpl<$Res> implements $DrawingCopyWith<$Res> {
  _$DrawingCopyWithImpl(this._self, this._then);

  final Drawing _self;
  final $Res Function(Drawing) _then;

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sketch = null,
    Object? activeLine = freezed,
    Object? allowedPointersMode = null,
    Object? activePointerIds = null,
    Object? pointerPosition = freezed,
    Object? selectedColor = null,
    Object? selectedWidth = null,
    Object? scaleFactor = null,
    Object? simplificationTolerance = null,
  }) {
    return _then(Drawing(
      sketch: null == sketch
          ? _self.sketch
          : sketch // ignore: cast_nullable_to_non_nullable
              as Sketch,
      activeLine: freezed == activeLine
          ? _self.activeLine
          : activeLine // ignore: cast_nullable_to_non_nullable
              as SketchLine?,
      allowedPointersMode: null == allowedPointersMode
          ? _self.allowedPointersMode
          : allowedPointersMode // ignore: cast_nullable_to_non_nullable
              as ScribblePointerMode,
      activePointerIds: null == activePointerIds
          ? _self._activePointerIds
          : activePointerIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      pointerPosition: freezed == pointerPosition
          ? _self.pointerPosition
          : pointerPosition // ignore: cast_nullable_to_non_nullable
              as Point?,
      selectedColor: null == selectedColor
          ? _self.selectedColor
          : selectedColor // ignore: cast_nullable_to_non_nullable
              as int,
      selectedWidth: null == selectedWidth
          ? _self.selectedWidth
          : selectedWidth // ignore: cast_nullable_to_non_nullable
              as double,
      scaleFactor: null == scaleFactor
          ? _self.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      simplificationTolerance: null == simplificationTolerance
          ? _self.simplificationTolerance
          : simplificationTolerance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SketchCopyWith<$Res> get sketch {
    return $SketchCopyWith<$Res>(_self.sketch, (value) {
      return _then(_self.copyWith(sketch: value));
    });
  }

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SketchLineCopyWith<$Res>? get activeLine {
    if (_self.activeLine == null) {
      return null;
    }

    return $SketchLineCopyWith<$Res>(_self.activeLine!, (value) {
      return _then(_self.copyWith(activeLine: value));
    });
  }

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res>? get pointerPosition {
    if (_self.pointerPosition == null) {
      return null;
    }

    return $PointCopyWith<$Res>(_self.pointerPosition!, (value) {
      return _then(_self.copyWith(pointerPosition: value));
    });
  }
}

/// @nodoc
@JsonSerializable()
class Erasing extends ScribbleState {
  const Erasing(
      {required this.sketch,
      this.allowedPointersMode = ScribblePointerMode.all,
      final List<int> activePointerIds = const [],
      this.pointerPosition,
      this.selectedWidth = 5,
      this.scaleFactor = 1,
      this.simplificationTolerance = 0,
      final String? $type})
      : _activePointerIds = activePointerIds,
        $type = $type ?? 'erasing',
        super._();
  factory Erasing.fromJson(Map<String, dynamic> json) =>
      _$ErasingFromJson(json);

  /// The current state of the sketch
  @override
  final Sketch sketch;

  /// Which pointers are allowed for drawing and will be captured by the
  /// scribble widget.
  @override
  @JsonKey()
  final ScribblePointerMode allowedPointersMode;

  /// The ids of all supported pointers that are currently interacting with
  /// the widget.
  final List<int> _activePointerIds;

  /// The ids of all supported pointers that are currently interacting with
  /// the widget.
  @override
  @JsonKey()
  List<int> get activePointerIds {
    if (_activePointerIds is EqualUnmodifiableListView)
      return _activePointerIds;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_activePointerIds);
  }

  /// The current position of the pointer
  @override
  final Point? pointerPosition;

  /// The current width of the pen
  @override
  @JsonKey()
  final double selectedWidth;

  /// How much the widget is scaled at the moment.
  ///
  /// Can be used if zoom functionality is needed
  /// (e.g. through InteractiveViewer) so that the pen width remains the same.
  @override
  @JsonKey()
  final double scaleFactor;

  /// The current tolerance of simplification, in pixels.
  ///
  /// Lines will be simplified when they are finished. A value of 0 (default)
  /// will mean no simplification.
  @override
  @JsonKey()
  final double simplificationTolerance;

  @JsonKey(name: 'runtimeType')
  final String $type;

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ErasingCopyWith<Erasing> get copyWith =>
      _$ErasingCopyWithImpl<Erasing>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$ErasingToJson(
      this,
    );
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Erasing &&
            (identical(other.sketch, sketch) || other.sketch == sketch) &&
            (identical(other.allowedPointersMode, allowedPointersMode) ||
                other.allowedPointersMode == allowedPointersMode) &&
            const DeepCollectionEquality()
                .equals(other._activePointerIds, _activePointerIds) &&
            (identical(other.pointerPosition, pointerPosition) ||
                other.pointerPosition == pointerPosition) &&
            (identical(other.selectedWidth, selectedWidth) ||
                other.selectedWidth == selectedWidth) &&
            (identical(other.scaleFactor, scaleFactor) ||
                other.scaleFactor == scaleFactor) &&
            (identical(
                    other.simplificationTolerance, simplificationTolerance) ||
                other.simplificationTolerance == simplificationTolerance));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      sketch,
      allowedPointersMode,
      const DeepCollectionEquality().hash(_activePointerIds),
      pointerPosition,
      selectedWidth,
      scaleFactor,
      simplificationTolerance);

  @override
  String toString() {
    return 'ScribbleState.erasing(sketch: $sketch, allowedPointersMode: $allowedPointersMode, activePointerIds: $activePointerIds, pointerPosition: $pointerPosition, selectedWidth: $selectedWidth, scaleFactor: $scaleFactor, simplificationTolerance: $simplificationTolerance)';
  }
}

/// @nodoc
abstract mixin class $ErasingCopyWith<$Res>
    implements $ScribbleStateCopyWith<$Res> {
  factory $ErasingCopyWith(Erasing value, $Res Function(Erasing) _then) =
      _$ErasingCopyWithImpl;
  @override
  @useResult
  $Res call(
      {Sketch sketch,
      ScribblePointerMode allowedPointersMode,
      List<int> activePointerIds,
      Point? pointerPosition,
      double selectedWidth,
      double scaleFactor,
      double simplificationTolerance});

  @override
  $SketchCopyWith<$Res> get sketch;
  @override
  $PointCopyWith<$Res>? get pointerPosition;
}

/// @nodoc
class _$ErasingCopyWithImpl<$Res> implements $ErasingCopyWith<$Res> {
  _$ErasingCopyWithImpl(this._self, this._then);

  final Erasing _self;
  final $Res Function(Erasing) _then;

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? sketch = null,
    Object? allowedPointersMode = null,
    Object? activePointerIds = null,
    Object? pointerPosition = freezed,
    Object? selectedWidth = null,
    Object? scaleFactor = null,
    Object? simplificationTolerance = null,
  }) {
    return _then(Erasing(
      sketch: null == sketch
          ? _self.sketch
          : sketch // ignore: cast_nullable_to_non_nullable
              as Sketch,
      allowedPointersMode: null == allowedPointersMode
          ? _self.allowedPointersMode
          : allowedPointersMode // ignore: cast_nullable_to_non_nullable
              as ScribblePointerMode,
      activePointerIds: null == activePointerIds
          ? _self._activePointerIds
          : activePointerIds // ignore: cast_nullable_to_non_nullable
              as List<int>,
      pointerPosition: freezed == pointerPosition
          ? _self.pointerPosition
          : pointerPosition // ignore: cast_nullable_to_non_nullable
              as Point?,
      selectedWidth: null == selectedWidth
          ? _self.selectedWidth
          : selectedWidth // ignore: cast_nullable_to_non_nullable
              as double,
      scaleFactor: null == scaleFactor
          ? _self.scaleFactor
          : scaleFactor // ignore: cast_nullable_to_non_nullable
              as double,
      simplificationTolerance: null == simplificationTolerance
          ? _self.simplificationTolerance
          : simplificationTolerance // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $SketchCopyWith<$Res> get sketch {
    return $SketchCopyWith<$Res>(_self.sketch, (value) {
      return _then(_self.copyWith(sketch: value));
    });
  }

  /// Create a copy of ScribbleState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $PointCopyWith<$Res>? get pointerPosition {
    if (_self.pointerPosition == null) {
      return null;
    }

    return $PointCopyWith<$Res>(_self.pointerPosition!, (value) {
      return _then(_self.copyWith(pointerPosition: value));
    });
  }
}

// dart format on
