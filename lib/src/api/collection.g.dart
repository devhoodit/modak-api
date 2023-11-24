// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Collections _$CollectionsFromJson(Map<String, dynamic> json) => Collections(
      (json['collections'] as List<dynamic>)
          .map((e) => Collection.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CollectionsToJson(Collections instance) =>
    <String, dynamic>{
      'collections': instance.collections,
    };

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      json['uuid'] as String,
      json['index'] as int,
      (json['long'] as num).toDouble(),
      (json['lat'] as num).toDouble(),
      (json['alt'] as num).toDouble(),
      Collection._dateFromJson(json['origin_at'] as String),
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'index': instance.index,
      'long': instance.longtitude,
      'lat': instance.latitude,
      'alt': instance.altitude,
      'origin_at': Collection._dateToJson(instance.originAt),
    };
