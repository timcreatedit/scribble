// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'scribble.state.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$Drawing _$$DrawingFromJson(Map<String, dynamic> json) => _$Drawing(
      sketch: Sketch.fromJson(json['sketch'] as Map<String, dynamic>),
      activeLine: json['activeLine'] == null
          ? null
          : SketchLine.fromJson(json['activeLine'] as Map<String, dynamic>),
      activePointerIds: (json['activePointerIds'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      pointerPosition: json['pointerPosition'] == null
          ? null
          : Point.fromJson(json['pointerPosition'] as Map<String, dynamic>),
      selectedColor: json['selectedColor'] as int? ?? 4278190080,
      selectedWidth: (json['selectedWidth'] as num?)?.toDouble() ?? 5,
      scaleFactor: (json['scaleFactor'] as num?)?.toDouble() ?? 1,
    );

Map<String, dynamic> _$$DrawingToJson(_$Drawing instance) => <String, dynamic>{
      'sketch': instance.sketch.toJson(),
      'activeLine': instance.activeLine?.toJson(),
      'activePointerIds': instance.activePointerIds,
      'pointerPosition': instance.pointerPosition?.toJson(),
      'selectedColor': instance.selectedColor,
      'selectedWidth': instance.selectedWidth,
      'scaleFactor': instance.scaleFactor,
    };

_$Erasing _$$ErasingFromJson(Map<String, dynamic> json) => _$Erasing(
      sketch: Sketch.fromJson(json['sketch'] as Map<String, dynamic>),
      activePointerIds: (json['activePointerIds'] as List<dynamic>?)
              ?.map((e) => e as int)
              .toList() ??
          [],
      pointerPosition: json['pointerPosition'] == null
          ? null
          : Point.fromJson(json['pointerPosition'] as Map<String, dynamic>),
      lineMode: json['lineMode'] as bool? ?? true,
      selectedWidth: (json['selectedWidth'] as num?)?.toDouble() ?? 5,
      scaleFactor: (json['scaleFactor'] as num?)?.toDouble() ?? 1,
    );

Map<String, dynamic> _$$ErasingToJson(_$Erasing instance) => <String, dynamic>{
      'sketch': instance.sketch.toJson(),
      'activePointerIds': instance.activePointerIds,
      'pointerPosition': instance.pointerPosition?.toJson(),
      'lineMode': instance.lineMode,
      'selectedWidth': instance.selectedWidth,
      'scaleFactor': instance.scaleFactor,
    };
