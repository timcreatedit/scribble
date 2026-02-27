// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scribble.state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Drawing _$DrawingFromJson(Map<String, dynamic> json) => Drawing(
      sketch: Sketch.fromJson(json['sketch'] as Map<String, dynamic>),
      activeLine: json['activeLine'] == null
          ? null
          : SketchLine.fromJson(json['activeLine'] as Map<String, dynamic>),
      allowedPointersMode: $enumDecodeNullable(
              _$ScribblePointerModeEnumMap, json['allowedPointersMode']) ??
          ScribblePointerMode.all,
      activePointerIds: (json['activePointerIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      pointerPosition: json['pointerPosition'] == null
          ? null
          : Point.fromJson(json['pointerPosition'] as Map<String, dynamic>),
      selectedColor: (json['selectedColor'] as num?)?.toInt() ?? 0xFF000000,
      selectedWidth: (json['selectedWidth'] as num?)?.toDouble() ?? 5,
      scaleFactor: (json['scaleFactor'] as num?)?.toDouble() ?? 1,
      simplificationTolerance:
          (json['simplificationTolerance'] as num?)?.toDouble() ?? 0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$DrawingToJson(Drawing instance) => <String, dynamic>{
      'sketch': instance.sketch.toJson(),
      'activeLine': instance.activeLine?.toJson(),
      'allowedPointersMode':
          _$ScribblePointerModeEnumMap[instance.allowedPointersMode]!,
      'activePointerIds': instance.activePointerIds,
      'pointerPosition': instance.pointerPosition?.toJson(),
      'selectedColor': instance.selectedColor,
      'selectedWidth': instance.selectedWidth,
      'scaleFactor': instance.scaleFactor,
      'simplificationTolerance': instance.simplificationTolerance,
      'runtimeType': instance.$type,
    };

const _$ScribblePointerModeEnumMap = {
  ScribblePointerMode.all: 'all',
  ScribblePointerMode.mouseOnly: 'mouseOnly',
  ScribblePointerMode.penOnly: 'penOnly',
  ScribblePointerMode.mouseAndPen: 'mouseAndPen',
};

Erasing _$ErasingFromJson(Map<String, dynamic> json) => Erasing(
      sketch: Sketch.fromJson(json['sketch'] as Map<String, dynamic>),
      allowedPointersMode: $enumDecodeNullable(
              _$ScribblePointerModeEnumMap, json['allowedPointersMode']) ??
          ScribblePointerMode.all,
      activePointerIds: (json['activePointerIds'] as List<dynamic>?)
              ?.map((e) => (e as num).toInt())
              .toList() ??
          const [],
      pointerPosition: json['pointerPosition'] == null
          ? null
          : Point.fromJson(json['pointerPosition'] as Map<String, dynamic>),
      selectedWidth: (json['selectedWidth'] as num?)?.toDouble() ?? 5,
      scaleFactor: (json['scaleFactor'] as num?)?.toDouble() ?? 1,
      simplificationTolerance:
          (json['simplificationTolerance'] as num?)?.toDouble() ?? 0,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$ErasingToJson(Erasing instance) => <String, dynamic>{
      'sketch': instance.sketch.toJson(),
      'allowedPointersMode':
          _$ScribblePointerModeEnumMap[instance.allowedPointersMode]!,
      'activePointerIds': instance.activePointerIds,
      'pointerPosition': instance.pointerPosition?.toJson(),
      'selectedWidth': instance.selectedWidth,
      'scaleFactor': instance.scaleFactor,
      'simplificationTolerance': instance.simplificationTolerance,
      'runtimeType': instance.$type,
    };
