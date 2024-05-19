import 'package:modak/modak.dart';
import 'package:modak/src/api/article/article.dart';
import 'package:modak/src/api/auth/auth.dart';
import 'package:modak/src/api/collection/collection.dart';
import 'package:modak/src/api/social/social.dart';
import 'package:modak/src/api/user/user.dart';

class Modak {
  final Token token;
  late Endpoint endpoint;
  late AuthAPI auth;
  late CollectionAPI collection;
  late ArticleAPI article;
  late UserAPI user;
  late SocialAPI social;
  final String name;
  Modak(
      {required this.token,
      required String refreshToken,
      required this.endpoint,
      required this.name,
      required RefreshCallback refreshCallback}) {
    auth = AuthAPI(token, refreshToken, endpoint, refreshCallback);
    collection = CollectionAPI(auth, endpoint);
    article = ArticleAPI(auth, endpoint);
    user = UserAPI(auth, endpoint);
    social = SocialAPI(auth, endpoint);
  }
}
