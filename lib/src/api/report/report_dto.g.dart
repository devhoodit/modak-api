// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ReportUser _$ReportUserFromJson(Map<String, dynamic> json) => ReportUser(
      (json['report_detail_type'] as num).toInt(),
      json['targetname'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$ReportUserToJson(ReportUser instance) =>
    <String, dynamic>{
      'report_detail_type': instance.type,
      'targetname': instance.targetname,
      'description': instance.description,
    };

ReportBug _$ReportBugFromJson(Map<String, dynamic> json) => ReportBug(
      json['title'] as String,
      json['description'] as String,
    );

Map<String, dynamic> _$ReportBugToJson(ReportBug instance) => <String, dynamic>{
      'title': instance.title,
      'description': instance.description,
    };
