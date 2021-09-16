// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch_line.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_SketchLine _$$_SketchLineFromJson(Map<String, dynamic> json) =>
    _$_SketchLine(
      points: (json['points'] as List<dynamic>)
          .map((e) => Point.fromJson(e as Map<String, dynamic>))
          .toList(),
      color: json['color'] as int,
      width: (json['width'] as num).toDouble(),
    );

Map<String, dynamic> _$$_SketchLineToJson(_$_SketchLine instance) =>
    <String, dynamic>{
      'points': instance.points.map((e) => e.toJson()).toList(),
      'color': instance.color,
      'width': instance.width,
    };
