class Endpoint {
  final String host;
  Endpoint({
    this.host = "hocalhost:8080",
  });
}

class Modak {
  late Endpoint endpoint;
  Modak({
    Endpoint? endpoint,
  }) {
    this.endpoint = endpoint ?? Endpoint();
  }
}
