import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:modak/modak.dart';
import 'package:modak/src/api/auth.dart';

class AuthenticationError implements Exception {
  final String message;
  AuthenticationError(this.message);
}

class APIRequest {
  APIRequest._();
  static final APIRequest _instance = APIRequest._();
  factory APIRequest() => _instance;
  static Future<T> getWithToken<T, G>(
      String url, T Function(G json) task, Token token,
      [Map<String, String>? headers]) async {
    final reqheaders = Auth.addTokenHeader(token, header: headers);
    try {
      return await APIRequest.get(url, task, reqheaders);
    } on AuthenticationError catch (e) {
      if (e.message == "Token is expired") {
        // token refresh needed
        final reqheaders = Auth.addTokenHeader(token, header: headers);
        return await APIRequest.get(url, task, reqheaders);
      }
      rethrow;
    } catch (e) {
      rethrow;
    }
  }

  static Future<T> get<T, G>(String url, T Function(G json) task,
      [Map<String, String>? headers]) async {
    final res = await http.get(Uri.parse(url), headers: headers);
    final j = json.decode(res.body);
    switch (res.statusCode) {
      case 200:
        return task(j);
      case 401:
        throw AuthenticationError(j["message"]);
      default:
        throw Exception("status code: ${res.statusCode} body: ${res.body}");
    }
  }
}
