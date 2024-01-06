import 'dart:convert';
import 'dart:html';

import 'package:http/http.dart' as http;
import 'package:modak/src/token.dart';

Future<Token> authWithCallback(Uri uri) {
  return http.get(uri).then((resp) {
    if (resp.statusCode != HttpStatus.ok) {
      throw Exception("http status is not ok");
    }
    var json = jsonDecode(resp.body);
    var tokenString = json["token"] as String;
    return Token.parseFromString(tokenString);
  });
}