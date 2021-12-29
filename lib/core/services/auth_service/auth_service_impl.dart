import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/new_user.dart';
import 'package:metrocoffee/core/models/user_profile.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/core/sources/remote_source.dart';
import 'package:metrocoffee/util/debug_printer.dart';
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
        // can be used if the specific error shoue be used
        // var newError = SignupError.fromJson(response);
        return Right(Failure(
            tag: "Signup Error",
            message:
                "Credentials already used or are incorrectly formatted!!!"));
      }
      var newUser = SignupResponse.fromJson(response);
      return Left(newUser);
    } on ServerException catch (e) {
      if (e.code == 400 || e.code == 401 || e.code == 422) {
        return Right(Failure(
            tag: "Signup Error:",
            message:
                "Credentials already used or are incorrectly formatted!!!"));
      }
      return Right(
        Failure(
          tag: "Signup Error:",
          message: "Credentials already used or are incorrectly formatted!!!",
        ),
      );
    } catch (e, stacktrace) {
      // print(stacktrace);
      return Right(Failure(
          tag: "Signup Error:",
          message: "Generice Error, Contact at +0100000"));
    }
  }

  @override
  Future<Either<SignupResponse, Failure>> loginUserWithEmail(
      Map<String, dynamic> data) async {
    try {
      var response =
          await _remoteSource.post("/api/auth/customer/login", body: data);
      if (response.containsKey("error")) {
        // print(response);
        return Right(
            Failure(tag: "Login Error:", message: "Validation failed!"));
      }
      var newUser = SignupResponse.fromJson(response);
      return Left(newUser);
    } on ServerException catch (e) {
      // ignore: avoid_print
      print(e.code);
      if (e.code == 400 || e.code == 401 || e.code == 422) {
        return Right(
            Failure(tag: "Login Error:", message: "Credentials not found!!"));
      }
      return Right(Failure(
          tag: "Login Error:", message: "Server Failed to Recognize!!"));
    } catch (e) {
      return Right(Failure(tag: "Signup Error:", message: "Generic Error"));
    }
  }

  @override
  Future<Either<String, Failure>> refreshToken() async {
    try {
      var token = locator<TempStorage>().readString(TempStorageKeys.authToken);
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      options.headers[HttpHeaders.contentTypeHeader] = 'application/json';
      options.headers[HttpHeaders.acceptHeader] = 'application/json';
      if (token != null) {
        final response = await Dio(options).post('/api/auth/customer/refresh');
        if (response.statusCode == 200) {
          if (response.data is Map<String, dynamic>) {
            final accessToken = response.data["access_token"];
            locator<TempStorage>()
                .writeString(TempStorageKeys.authToken, accessToken);
            return Left(accessToken);
          }
        }
      }
      return Right(Failure(tag: "Error", message: "Token Refresh Error"));
    } on DioError catch (e) {
      dPrint(e.response?.statusCode);
      return Right(Failure(tag: "Error", message: "Token Refresh Error"));
    } catch (e) {
      dPrint(e);
      return Right(Failure(tag: "Error", message: "Token Refresh Error"));
    }
  }

  @override
  Future<void> logout() async {
    try {
      var response = await _remoteSource.post("/api/auth/customer/logout");
      dPrint(response);
    } on ServerException catch (e) {
      dPrint({e.message + e.code.toString()});
    } catch (error, stacktrace) {
      dPrint(stacktrace);
    }
  }

  @override
  Future<Either<String, Failure>> sendEmailForPasswordReset(
      Map<String, dynamic> data) async {
    try {
      var response =
          await _remoteSource.post("/api/auth/forgotpassword", body: data);
      if (response.containsKey("message")) {
        return Left(response["message"]);
      }
      return const Left("Please check your email for the code");
    } on ServerException catch (error) {
      return Right(Failure(
          tag: "Error sending mail", message: "${error.code} server error"));
    } catch (error, stacktrace) {
      return Right(Failure(tag: "Failure!!", message: "Generic Error"));
    }
  }

  @override
  Future<Either<String, Failure>> verifyOtp(Map<String, dynamic> data) async {
    try {
      var response =
          await _remoteSource.post("/api/auth/varify_pincode", body: data);
      if (response.containsKey("message")) {
        return Left(response["message"]);
      }
      return const Left("Please check your email for the code");
    } on ServerException catch (error) {
      // ignore: avoid_print
      print(error.message);
      return Right(Failure(
          tag: "Error Verfication", message: "${error.code} Invalid Pincode"));
    } catch (error) {
      return Right(Failure(tag: "Failure!!", message: "Generic Error"));
    }
  }

  @override
  Future<Either<String, Failure>> resetPassword(
      Map<String, dynamic> data) async {
    try {
      var response =
          await _remoteSource.post("/api/auth/newpassword", body: data);
      if (response.containsKey("message")) {
        return Left(response["message"]);
      }
      return const Left("Please check your email for the code");
    } on ServerException catch (error) {
      // ignore: avoid_print
      print(error.message);
      return Right(Failure(
          tag: "Error Verfication", message: "${error.code} Invalid Pincode"));
    } catch (error) {
      return Right(Failure(tag: "Failure!!", message: "Generic Error"));
    }
  }

  @override
  Future<Either<UserProfile, Failure>> getProfile() async {
    // print('came in the getprofile method');
    try {
      var response = await _remoteSource.get("/api/auth/customer/profile");
      // print(response);
      return Left(UserProfile.fromJson(response));
    } on ServerException catch (error) {
      // print(error.message);
      return Right(
        Failure(
          tag: "Profile Retreival Error",
          message: "${error.code} ${error.message}",
        ),
      );
    } catch (error) {
      return Right(Failure(tag: "Failure!!", message: "Generic Error"));
    }
  }
}
