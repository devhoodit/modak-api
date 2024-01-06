// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collection.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GeoLocation _$GeoLocationFromJson(Map<String, dynamic> json) => GeoLocation(
      (json['longtitude'] as num).toDouble(),
      (json['latitude'] as num).toDouble(),
      (json['altitude'] as num).toDouble(),
      (json['acc'] as num).toDouble(),
    );

Map<String, dynamic> _$GeoLocationToJson(GeoLocation instance) =>
    <String, dynamic>{
      'longtitude': instance.longtitude,
      'latitude': instance.latitude,
      'altitude': instance.altitude,
      'acc': instance.accuracy,
    };

CollectionsUUID _$CollectionsUUIDFromJson(Map<String, dynamic> json) =>
    CollectionsUUID(
      (json['collections'] as List<dynamic>).map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CollectionsUUIDToJson(CollectionsUUID instance) =>
    <String, dynamic>{
      'collections': instance.collections,
    };

Collection _$CollectionFromJson(Map<String, dynamic> json) => Collection(
      json['index'] as int,
      GeoLocation.fromJson(json['geolocation'] as Map<String, dynamic>),
      Collection._dateFromJson(json['datetime'] as String),
    );

Map<String, dynamic> _$CollectionToJson(Collection instance) =>
    <String, dynamic>{
      'index': instance.index,
      'geolocation': instance.geolocation.toJson(),
      'datetime': Collection._dateToJson(instance.datetime),
    };
