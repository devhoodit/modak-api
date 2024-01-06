import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:json_annotation/json_annotation.dart';
import 'package:modak/src/api/auth.dart';
import 'package:modak/src/api/request.dart';
import 'package:modak/src/modak_base.dart';
import 'package:modak/src/token.dart';

part 'collection.g.dart';

@JsonSerializable()
class GeoLocation {
  final double longtitude;
  final double latitude;
  final double altitude;
  @JsonKey(name: "acc")
  final double accuracy;
  GeoLocation(this.longtitude, this.latitude, this.altitude, this.accuracy);
  factory GeoLocation.fromJson(Map<String, dynamic> json) =>
      _$GeoLocationFromJson(json);
  Map<String, dynamic> toJson() => _$GeoLocationToJson(this);
}

@JsonSerializable()
class CollectionsUUID {
  final List<String> collections;
  CollectionsUUID(this.collections);
  factory CollectionsUUID.fromJson(Map<String, dynamic> json) =>
      _$CollectionsUUIDFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionsUUIDToJson(this);
}

@JsonSerializable(explicitToJson: true)
class Collection {
  final int index;
  final GeoLocation geolocation;
  @JsonKey(fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime datetime;

  Collection(this.index, this.geolocation, this.datetime);
  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);

  static DateTime _dateFromJson(String timestamp) => DateTime.parse(timestamp);
  static String _dateToJson(DateTime time) => time.toIso8601String();
}

class CollectionAPI {
  Token token;
  Endpoint endpoint;
  CollectionAPI(this.token, this.endpoint);

  Future<List<String>> getCollectionsUUID() async {
    final collectionsUUID = await APIRequest.getWithToken(
        "${endpoint.baseurl}/collection", CollectionsUUID.fromJson, token);
    return collectionsUUID.collections;
  }

  Future<Collection> getCollectionByUUID(String uuid) async {
    final collection = await APIRequest.getWithToken(
        "${endpoint.baseurl}/collection/$uuid", Collection.fromJson, token);
    return collection;
  }

  Future<String> postCollection(String imagePath, Collection collection) async {
    final client = http.MultipartRequest(
        'post',
        Uri.parse(
          "${endpoint.baseurl}/collection",
        ));

    final jsonData = json.encode(collection.toJson());
    final jsonObj = http.MultipartFile.fromString('collection', jsonData,
        contentType: MediaType('applicaton', 'json'));
    client.files.add(jsonObj);

    final imageFile =
        await http.MultipartFile.fromPath('file.image', imagePath);
    client.files.add(imageFile);
    final streamResponse = await client.send();

    final res = await http.Response.fromStream(streamResponse);
    final jsonBody = json.decode(res.body);
    if (streamResponse.statusCode == 401) {
      throw AuthenticationError(jsonBody["message"]);
    } else if (streamResponse.statusCode != 200) {
      throw Exception("status code: ${streamResponse.statusCode}, ${res.body}");
    }
    return jsonBody["uuid"];
  }
}
