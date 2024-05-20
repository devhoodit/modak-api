import 'dart:convert';
import 'dart:typed_data';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';

import 'package:modak/src/api/article/article_dto.dart';
import 'package:modak/src/api/article/heart_dto.dart';
import 'package:modak/src/api/auth/auth.dart';
import 'package:modak/src/api/request.dart';
import 'package:modak/src/api/endpoint.dart';
import 'package:modak/src/api/validator.dart';
import 'package:modak/src/types/uuid.dart';

import 'comment_dto.dart';

class ArticleAPI {
  AuthAPI auth;
  Endpoint endpoint;
  ArticleAPI(this.auth, this.endpoint);

  /// get [Article] by [link]
  Future<Article> getArticle(UUID link) async {
    final article = await APIRequest().get("${endpoint.baseurl}/article/$link",
        responseJsonWrapper(Article.fromJson));
    return article.data;
  }

  ByteData _getByteData(http.Response res) {
    return ByteData.view(res.bodyBytes.buffer);
  }

  /// get image [ByteData] by image [uuid]
  Future<ByteData> getArticleImage(UUID uuid) async {
    final res = await auth.get("${endpoint.baseurl}/image/$uuid", _getByteData);
    return res.data;
  }

  /// post article, [title], [content], [collectionOrderInfo], [imagePaths]
  Future<void> postArticle(String title, String content,
      List<OrderInfo> collectionOrderInfo, List<String> imagePaths) async {
    var multipartFiles = <http.MultipartFile>[];
    final postArticle = PostArticle(title, content, collectionOrderInfo);
    final jsonData = json.encode(postArticle.toJson());
    multipartFiles.add(http.MultipartFile.fromString('article', jsonData,
        contentType: MediaType('application', 'json')));

    for (var imagePath in imagePaths) {
      final imageFile = await http.MultipartFile.fromPath('image[]', imagePath);
      multipartFiles.add(imageFile);
    }
    await auth.multipart(
        "${endpoint.baseurl}/article", (res) => null, multipartFiles);
  }

  Future<ArticleLinks> getPublicLinks({int offset = 0, int limit = 16}) async {
    validateRange(offset, limit, 64);
    final links = await auth.get(
        "${endpoint.baseurl}/article/get-links?offset=$offset&limit=$limit",
        responseJsonWrapper(ArticleLinks.fromJson));
    return links.data;
  }

  /// get [username]'s article links ([offset], [limit])
  Future<ArticleLinks> getLinksByUsername(String username,
      {int offset = 0, int limit = 8}) async {
    validateRange(offset, limit, 64);
    final links = await auth.get(
        "${endpoint.baseurl}/article/get-links/$username?offset=$offset&limit=$limit",
        responseJsonWrapper(ArticleLinks.fromJson));
    return links.data;
  }

  /// delete [link] article
  Future<void> deleteArticleByLink(UUID link) async {
    await auth.delete("${endpoint.baseurl}/article/$link");
  }

  /// post [comment] on [link] article
  Future<void> postComment(UUID link, String comment) async {
    await auth.post(
        "${endpoint.baseurl}/article/$link/comment",
        body: Comment(null, comment).toJson(),
        (res) => null);
  }

  /// get list of [Comment] of [link] article ([offset], [limit])
  Future<List<Comment>> getComments(UUID link,
      {int offset = 0, int limit = 16}) async {
    validateRange(offset, limit, 64);
    final comments = await auth.get(
        "${endpoint.baseurl}/article/$link/comment?offset=$offset&limit=$limit",
        (res) {
      final j = json.decode(res.body) as List;
      return List<Comment>.from(j.map((e) => Comment.fromJson(e)));
    });
    return comments.data;
  }

  /// get requesters heart state of [link] article
  Future<bool> getHeartState(UUID link) async {
    final heartState = await auth.get("${endpoint.baseurl}/article/$link/heart",
        responseJsonWrapper(HeartState.fromJson));
    return heartState.data.state;
  }

  /// get heart count of [link] article
  Future<int> getHeartCount(UUID link) async {
    final heartCount = await auth.get(
        "${endpoint.baseurl}/article/$link/heart/count",
        responseJsonWrapper(HeartCount.fromJson));
    return heartCount.data.count;
  }
}
