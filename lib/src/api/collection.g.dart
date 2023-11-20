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
      json['collectionIndex'] as int,
      (json['longtitude'] as num).toDouble(),
      (json['latitude'] as num).toDouble(),
      (json['altitude'] as num).toDouble(),
      Collection._dateFromJson(json['originAt'] as String),
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'collectionIndex': instance.collectionIndex,
      'longtitude': instance.longtitude,
      'latitude': instance.latitude,
      'altitude': instance.altitude,
      'originAt': Collection._dateToJson(instance.originAt),
    };
