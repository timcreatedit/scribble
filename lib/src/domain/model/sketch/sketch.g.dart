// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Sketch _$SketchFromJson(Map<String, dynamic> json) => _Sketch(
      lines: (json['lines'] as List<dynamic>)
          .map((e) => SketchLine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SketchToJson(_Sketch instance) => <String, dynamic>{
      'lines': instance.lines.map((e) => e.toJson()).toList(),
    };
