import 'package:modak/modak.dart';
import 'package:modak/src/api/collection.dart';

class Endpoint {
  final String host;
  final int port;
  Endpoint({this.host = "hocalhost", this.port = 8080});
}

class Modak {
  Token token;
  late Endpoint endpoint;
  late CollectionAPI collection;
  Modak({
    required this.token,
    Endpoint? endpoint,
  }) {
    this.endpoint = endpoint ?? Endpoint();
    collection = CollectionAPI(token, this.endpoint);
  }
}
