import 'dart:convert';
import 'package:http/http.dart' as http;

Codec<String, String> stringToBase64 = utf8.fuse(base64);

class Token {
  final String uuid;
  final DateTime exp;
  final String _tokenString;
  String get tokenString => _tokenString;

  Token(this.uuid, this.exp, this._tokenString);

  static Token parseFromString(String tokenString) {
    final splitString = tokenString.split(".");
    if (splitString.length != 2) {
      throw Exception("Invalid token string");
    }
    final tokenBody = splitString[0];
    final decodedBody = stringToBase64.decode(tokenBody);
    Map<String, dynamic> jsonBody = jsonDecode(decodedBody);

    final String uuid = jsonBody["uuid"];
    final exp = DateTime.fromMillisecondsSinceEpoch(jsonBody["exp"] * 1000);

    return Token(uuid, exp, tokenString);
  }

  // must refac, hard coded, no error handling
  static Future<Token?> githubOAuthCallback(String callbackURL) async {
    var res = await http.get(Uri.parse(callbackURL));
    if (res.statusCode != 200) return null;
    var body = json.decode(res.body);
    return Token.parseFromString(body['token']);
  }
}
