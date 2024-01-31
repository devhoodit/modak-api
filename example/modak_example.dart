import 'package:modak/src/api/endpoint.dart';
import 'package:modak/src/api/request.dart';
import 'package:modak/src/modak_base.dart';
import 'package:modak/src/token.dart';

void main() async {
  var m = Modak(
      token: Token.parseFromString("your access token"),
      refreshToken: "your refresh token",
      endpoint: Endpoint(host: "host", port: 1234));
  try {
    var collections = await m.collection.getCollectionsUUID(0, 100);
    print(collections);
  } on RequestAPIError catch (e) {
    print(e.statusCode);
    print(e.body);
  }
}
