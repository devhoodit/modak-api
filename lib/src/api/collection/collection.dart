import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;

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
        responseJsonWrapper(CollectionsUUID.fromJson));
    return collectionsUUID.data.collections;
  }

  Future<Collection> getCollectionByUUID(String uuid) async {
    final collection = await auth.get("${endpoint.baseurl}/collection/$uuid",
        responseJsonWrapper(Collection.fromJson));
    return collection.data;
  }

  ByteData _getByteData(http.Response res) {
    return ByteData.view(res.bodyBytes.buffer);
  }

  Future<ByteData> getCollectionImage(String uuid) async {
    final res = await auth.get(
        "${endpoint.baseurl}/collection/image/$uuid", _getByteData);
    return res.data;
  }

  Future<String> postCollection(String imagePath, Collection collection) async {
    var multipatFiles = <http.MultipartFile>[];
    final jsonData = json.encode(collection.toJson());
    multipatFiles.add(http.MultipartFile.fromString('info', jsonData));

    final imageFile = await http.MultipartFile.fromPath('image', imagePath);
    multipatFiles.add(imageFile);
    final uuid = await auth.multipart<String>("${endpoint.baseurl}/collection/",
        responseJsonWrapper((json) => json["uuid"] ?? ""), multipatFiles);
    return uuid.data;
  }

  Future<void> deleteCollection(String uuid) async {
    await auth.delete("${endpoint.baseurl}/collection/$uuid");
  }
}
