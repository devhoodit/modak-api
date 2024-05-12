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

  /// get collection uuids by [user], [offset] and [limit]
  Future<List<String>> getCollectionsUUID(
      String user, int offset, int limit) async {
    final apires = await auth.get(
        "${endpoint.baseurl}/collection/list/$user?offset=$offset&limit=$limit",
        responseJsonWrapper(CollectionsUUID.fromJson));
    return apires.data.collections;
  }

  /// get collection information by collection [uuid]
  Future<Collection> getCollectionByUUID(String uuid) async {
    final apires = await auth.get("${endpoint.baseurl}/collection/$uuid",
        responseJsonWrapper(Collection.fromJson));
    return apires.data;
  }

  ByteData _getByteData(http.Response res) {
    return ByteData.view(res.bodyBytes.buffer);
  }

  /// get collection image [ByteData] by [uuid]
  Future<ByteData> getCollectionImage(String uuid) async {
    final res = await auth.get(
        "${endpoint.baseurl}/collection/image/$uuid", _getByteData);
    return res.data;
  }

  /// post [collection] with image by [imagePath]
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

  /// delete collection by collection [uuid]
  Future<void> deleteCollection(String uuid) async {
    await auth.delete("${endpoint.baseurl}/collection/$uuid");
  }
}
