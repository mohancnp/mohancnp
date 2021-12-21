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
      if (response.containsKey("error")) {
        var newError = SignupError.fromJson(response);
        print(newError.toString());
        return Right(Failure(
            tag: "Signup Error",
            message: "Validation Failed, Please try different credentials"));
      }
      var newUser = SignupResponse.fromJson(response);
      return Left(newUser);
    } on ServerException catch (e) {
      if (e.code == 400 || e.code == 401 || e.code == 422) {
        return Right(
            Failure(tag: "Signup Error:", message: "Server Validation Failed!!"));
      }
      return Right(Failure(
          tag: "Signup Error:", message: "Server Failed to Recognize!!"));
    } catch (e) {
      return Right(Failure(tag: "Signup Error:", message: "Generice Error"));
    }
  }

  @override
  Future<Either<SignupResponse, Failure>> loginUserWithEmail(
      Map<String, dynamic> data) async {
    try {
      var response =
          await _remoteSource.post("/api/auth/customer/login", body: data);
      if (response.containsKey("error")) {
        print(response);
        return Right(
            Failure(tag: "Login Error:", message: "Validation failed!"));
      }
      var newUser = SignupResponse.fromJson(response);
      return Left(newUser);
    } on ServerException catch (e) {
      print(e.code);
      if (e.code == 400 || e.code == 401 || e.code == 422) {
        return Right(
            Failure(tag: "Login Error:", message: "Validation Failed!!"));
      }
      return Right(Failure(
          tag: "Login Error:", message: "Server Failed to Recognize!!"));
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
