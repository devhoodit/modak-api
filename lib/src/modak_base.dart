import 'package:modak/modak.dart';
import 'package:modak/src/api/collection.dart';

class Endpoint {
  final String host;
  final int port;
  final String baseurl;
  Endpoint({required this.host, required this.port})
      : baseurl = "https://$host:$port";
}

class Modak {
  Token token;
  late Endpoint endpoint;
  late CollectionAPI collection;
  Modak({
    required this.token,
    required endpoint,
  }) {
    collection = CollectionAPI(token, endpoint);
  }
}
