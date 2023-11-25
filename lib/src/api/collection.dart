import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:json_annotation/json_annotation.dart';
import 'package:modak/src/api/auth.dart';
import 'package:modak/src/modak_base.dart';
import 'package:modak/src/token.dart';

part 'collection.g.dart';

@JsonSerializable()
class Collections {
  @JsonKey(name: "collections")
  List<Collection> collections;

  Collections(this.collections);
  factory Collections.fromJson(Map<String, dynamic> json) =>
      _$CollectionsFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionsToJson(this);
}

@JsonSerializable()
class Collection {
  final String uuid;
  final int index;
  @JsonKey(name: "long")
  final double longtitude;
  @JsonKey(name: "lat")
  final double latitude;
  @JsonKey(name: "alt")
  final double altitude;
  @JsonKey(name: "origin_at", fromJson: _dateFromJson, toJson: _dateToJson)
  final DateTime originAt;

  Collection(this.uuid, this.index, this.longtitude, this.latitude,
      this.altitude, this.originAt);
  factory Collection.fromJson(Map<String, dynamic> json) =>
      _$CollectionFromJson(json);
  Map<String, dynamic> toJson() => _$CollectionToJson(this);

  static DateTime _dateFromJson(String timestamp) => DateTime.parse(timestamp);
  static String _dateToJson(DateTime time) => time.toIso8601String();
}

class CollectionAPI {
  Token token;
  Endpoint endpoint;
  AuthorizeRequired auth;
  CollectionAPI(this.token, this.endpoint) : auth = AuthorizeRequired(token);

  Future<Collections> getCollections() async {
    final res = await http.get(
        Uri(
            scheme: "http",
            host: endpoint.host,
            port: endpoint.port,
            path: "collect",
            queryParameters: {"offset": "0", "limit": "5"}),
        headers: auth.addTokenHeader());
    return Collections.fromJson(jsonDecode(res.body));
  }
}
