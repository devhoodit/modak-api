import 'package:modak/src/token.dart';

class AuthorizeRequired {
  final Token _token;
  AuthorizeRequired(this._token);
  Map<String, String>? addTokenHeader({Map<String, String>? header}) {
    header ??= <String, String>{};
    header["X-MD-Token"] = _token.tokenString;
    return header;
  }
}
