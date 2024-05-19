// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'heart_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

HeartState _$HeartStateFromJson(Map<String, dynamic> json) => HeartState(
      json['heart'] as bool,
    );

Map<String, dynamic> _$HeartStateToJson(HeartState instance) =>
    <String, dynamic>{
      'heart': instance.state,
    };

HeartCount _$HeartCountFromJson(Map<String, dynamic> json) => HeartCount(
      (json['counts'] as num).toInt(),
    );

Map<String, dynamic> _$HeartCountToJson(HeartCount instance) =>
    <String, dynamic>{
      'counts': instance.count,
    };
