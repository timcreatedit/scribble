// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PointImpl _$$PointImplFromJson(Map<String, dynamic> json) => _$PointImpl(
      (json['x'] as num).toDouble(),
      (json['y'] as num).toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble() ?? 0.5,
    );

Map<String, dynamic> _$$PointImplToJson(_$PointImpl instance) =>
    <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'pressure': instance.pressure,
    };
