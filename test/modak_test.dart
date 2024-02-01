import 'package:modak/modak.dart';
import 'package:modak/src/api/endpoint.dart';
import 'package:modak/src/token.dart';
import 'package:test/test.dart';

void main() {
  group('auth test', () {
    test('valid auth test', () {
      doing() => Modak(
          token: Token.parseFromString("your auth token"),
          refreshToken: "",
          endpoint: Endpoint(host: "localhost", port: 1234));

      final expected = returnsNormally;

      expect(doing, expected);
    });
    test('invalid auth invalid token', () {
      doing() => Modak(
          token: Token.parseFromString("tokenString"),
          refreshToken: "refreshToken",
          endpoint: Endpoint(host: "localhost", port: 1234));

      final expected = throwsA(isA<NoValidTokenError>()
          .having((p0) => p0.cause, 'invalid token', 'invalid token string'));

      expect(doing, expected);
    });
    test('invalid auth no uuid', () {
      doing() => Modak(
          token: Token.parseFromString("token.string"),
          refreshToken: "refreshToken",
          endpoint: Endpoint(host: "localhost", port: 1234));

      final expected = throwsA(isA<NoValidTokenError>()
          .having((p0) => p0.cause, 'invalid token', 'no uuid'));

      expect(doing, expected);
    });
  });
  group('collections', () {
    setUp(() {});

    test('valid get collections test', () async {
      var m = Modak(
          token: Token.parseFromString("tokenString"),
          refreshToken: "refreshToken",
          endpoint: Endpoint(host: "localhost", port: 1234));

      final res = await m.collection.getCollectionsUUID(0, 100);

      expect(true, true);
    });
  });
}
