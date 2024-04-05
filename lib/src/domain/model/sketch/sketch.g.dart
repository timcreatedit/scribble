// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sketch.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SketchImpl _$$SketchImplFromJson(Map<String, dynamic> json) => _$SketchImpl(
      lines: (json['lines'] as List<dynamic>)
          .map((e) => SketchLine.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SketchImplToJson(_$SketchImpl instance) =>
    <String, dynamic>{
      'lines': instance.lines.map((e) => e.toJson()).toList(),
    };
