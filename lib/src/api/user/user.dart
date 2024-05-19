import 'package:modak/src/api/auth/auth.dart';
import 'package:modak/src/api/endpoint.dart';

enum UserVisibility { public, private }

extension UserVisibilityExtension on UserVisibility {
  String get toText {
    switch (this) {
      case UserVisibility.public:
        return "public";
      case UserVisibility.private:
        return "private";
      default:
        return "private";
    }
  }
}

class UserAPI {
  AuthAPI auth;
  Endpoint endpoint;
  UserAPI(this.auth, this.endpoint);

  /// set user visibility as public
  Future<void> setVisibiltyPublic() async {
    await _setVisibilty(UserVisibility.public);
  }

  /// set user visibility as private
  Future<void> setVisibiltyPrivate() async {
    await _setVisibilty(UserVisibility.private);
  }

  Future<void> _setVisibilty(UserVisibility visibility) async {
    await auth.post("${endpoint.baseurl}/user/visibility/${visibility.toText}",
        (res) => null);
  }
}
