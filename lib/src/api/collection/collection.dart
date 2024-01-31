import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:modak/src/api/auth/auth.dart';
import 'package:modak/src/api/endpoint.dart';
import 'package:modak/src/api/request.dart';

import 'collection_dto.dart';

class CollectionAPI {
  AuthAPI auth;
  Endpoint endpoint;
  CollectionAPI(this.auth, this.endpoint);

  Future<List<String>> getCollectionsUUID(int offset, int limit) async {
    final collectionsUUID = await auth.get(
        "${endpoint.baseurl}/collection?offset=$offset&limit=$limit",
        CollectionsUUID.fromJson);
    return collectionsUUID.collections;
  }

  Future<Collection> getCollectionByUUID(String uuid) async {
    final collection = await auth.get(
        "${endpoint.baseurl}/collection/$uuid", Collection.fromJson);
    return collection;
  }

  Future<String> postCollection(String imagePath, Collection collection) async {
    final client = http.MultipartRequest(
        'post',
        Uri.parse(
          "${endpoint.baseurl}/collection",
        ));

    final jsonData = json.encode(collection.toJson());
    final jsonObj = http.MultipartFile.fromString('info', jsonData,
        contentType: MediaType('applicaton', 'json'));
    client.files.add(jsonObj);

    final imageFile = await http.MultipartFile.fromPath('image', imagePath);
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
