import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/sources/source_impl/remote_source_impl.dart';
import 'auth_service.dart';

class AuthServiceImpl extends AuthService {
  final _remoteSource = locator<RemoteSourceImpl>();

  @override
  Future<void> createUser(Map<String, dynamic> data) async {
    var response =
        _remoteSource.post("/api/auth/customer/register", body: data);
    print(response);
  }

  @override
  Future<void> loginUserWithEmail(Map<String, dynamic> data) async {
    var response = _remoteSource.post("/api/auth/customer/login", body: data);
    print(response);
  }

  @override
  Future<void> refreshToken() async {
    var response = _remoteSource.post("/api/auth/customer/refresh");
    print(response);
  }

  @override
  Future<void> logout() async {
    var response = _remoteSource.post("/api/auth/customer/logout");
    print(response);
  }

  @override
  Future<void> sendEmailForPasswordReset() async {
    var response = _remoteSource.post("/api/auth/customer/forgotpassword");
    print(response);
  }
}
