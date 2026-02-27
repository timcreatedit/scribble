// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SketchLine _$SketchLineFromJson(Map<String, dynamic> json) => _SketchLine(
      points: (json['points'] as List<dynamic>)
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: (json['color'] as num).toInt(),
      width: (json['width'] as num).toDouble(),
    );

Map<String, dynamic> _$SketchLineToJson(_SketchLine instance) =>
    <String, dynamic>{
      'points': instance.points.map((e) => e.toJson()).toList(),
      'color': instance.color,
      'width': instance.width,
    };
