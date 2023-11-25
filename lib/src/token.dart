import 'dart:convert';

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
    String tokenBody = splitString[0];
    if (tokenBody.length % 4 != 0) {
      tokenBody += "=" * (4 - tokenBody.length % 4);
    }
    final decodedBody = stringToBase64.decode(tokenBody);
    Map<String, dynamic> jsonBody = jsonDecode(decodedBody);

    final String uuid = jsonBody["uuid"];
    final exp = DateTime.fromMillisecondsSinceEpoch(jsonBody["exp"] * 1000);

    return Token(uuid, exp, tokenString);
  }
}
