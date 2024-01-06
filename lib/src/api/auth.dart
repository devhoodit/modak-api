import 'package:modak/src/token.dart';

class Auth {
  static Map<String, String>? addTokenHeader(Token token,
      {Map<String, String>? header}) {
    header ??= <String, String>{};
    header["X-MD-Token"] = token.tokenString;
    return header;
  }
}
