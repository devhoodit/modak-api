// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'setup_dto.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TestConfig _$TestConfigFromJson(Map<String, dynamic> json) => TestConfig(
      json['host'] as String,
      json['port'] as int,
      json['access_token'] as String,
      json['refresh_token'] as String,
      SpecificTestConfig.fromJson(json['tests'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$TestConfigToJson(TestConfig instance) =>
    <String, dynamic>{
      'host': instance.host,
      'port': instance.port,
      'access_token': instance.accessToken,
      'refresh_token': instance.refreshToken,
      'tests': instance.test,
    };

SpecificTestConfig _$SpecificTestConfigFromJson(Map<String, dynamic> json) =>
    SpecificTestConfig(
      CollectionTestConfig.fromJson(json['collection'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$SpecificTestConfigToJson(SpecificTestConfig instance) =>
    <String, dynamic>{
      'collection': instance.collection,
    };

CollectionTestConfig _$CollectionTestConfigFromJson(
        Map<String, dynamic> json) =>
    CollectionTestConfig(
      json['collectionUUID'] as String,
    );

Map<String, dynamic> _$CollectionTestConfigToJson(
        CollectionTestConfig instance) =>
    <String, dynamic>{
      'collectionUUID': instance.collectionUUID,
    };
