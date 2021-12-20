import 'package:dartz/dartz.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/models/new_user.dart';
import 'package:metrocoffee/core/sources/remote_source.dart';
import 'auth_service.dart';

class AuthServiceImpl extends AuthService {
  final RemoteSource _remoteSource;
  AuthServiceImpl(this._remoteSource);

  @override
  Future<Either<SignupResponse, Failure>> createUser(
      Map<String, dynamic> data) async {
    try {
      var response =
          await _remoteSource.post("/api/auth/customer/register", body: data);
      if (response.containsKey("access_token")) {
        var newUser = SignupResponse.fromJson(response);
        return Left(newUser);
      } else if (response.containsKey("errors")) {
        var newError = SignupError.fromJson(response);
        return Right(
            Failure(tag: "Signup Error:", message: newError.toString()));
      } else {
        return Right(Failure(tag: "Signup Error:", message: "Generic Error"));
      }
    } on ServerException catch (e) {
      // print("custom error: ${e.message}");
      return Right(Failure(tag: "Signup Error:", message: "${e.message}"));
    } catch (e) {
      // print("custom error 1: $e");
      return Right(Failure(tag: "Signup Error:", message: "Generice Error"));
    }
  }

  @override
  Future<Either<SignupResponse, Failure>> loginUserWithEmail(
      Map<String, dynamic> data) async {
    try {
      var response =
          await _remoteSource.post("/api/auth/customer/login", body: data);
      if (response.containsKey("access_token")) {
        var newUser = SignupResponse.fromJson(response);
        return Left(newUser);
      } else if (response.containsKey("error")) {
        return Right(Failure(tag: "Signup Error:", message: response['error']));
      } else {
        return Right(Failure(tag: "Signup Error:", message: "Generic Error"));
      }
    } on ServerException catch (e) {
      // print("custom error: ${e.message}");
      return Right(Failure(tag: "Signup Error:", message: "${e.message}"));
    } catch (e) {
      // print("custom error 1: $e");
      return Right(Failure(tag: "Signup Error:", message: "Generic Error"));
    }
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
