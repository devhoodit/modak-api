class Endpoint {
  final String host;
  final int? port;
  late final String baseurl;
  Endpoint({required this.host, this.port}) {
    if (port == null) {
      baseurl = host;
    } else {
      baseurl = "$host:$port";
    }
  }
}
