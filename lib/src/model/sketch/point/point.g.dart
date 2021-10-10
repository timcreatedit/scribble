// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'point.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Point _$$_PointFromJson(Map<String, dynamic> json) => _$_Point(
      (json['x'] as num).toDouble(),
      (json['y'] as num).toDouble(),
      pressure: (json['pressure'] as num?)?.toDouble() ?? 1,
    );

Map<String, dynamic> _$$_PointToJson(_$_Point instance) => <String, dynamic>{
      'x': instance.x,
      'y': instance.y,
      'pressure': instance.pressure,
    };
