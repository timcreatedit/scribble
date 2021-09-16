// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Sketch _$$_SketchFromJson(Map<String, dynamic> json) => _$_Sketch(
      lines: (json['lines'] as List<dynamic>)
          .map((e) => SketchLine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_SketchToJson(_$_Sketch instance) => <String, dynamic>{
      'lines': instance.lines.map((e) => e.toJson()).toList(),
    };
