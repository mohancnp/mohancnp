import 'dart:io';

import 'package:dio/dio.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';

import 'auth_service.dart';

class AuthServiceImpl extends AuthService {
  @override
  Future<Map<String, dynamic>> performMemberShipLogin(
      String memberNo, String password) async {
    print(" implementation received: $memberNo, $password");

    Map<String, String> data = {
      "membership_no": memberNo,
      "password": password
    };
    try {
      var response =
          await dio.post("$baseUrl/api/membership-login", data: data);
      var user = response.data["data"];
      return user;
    } on SocketException catch (e) {
      throw (AppException(message: e.message));
    } on DioError catch (e) {
      throw (ServerException(
          code: e.response?.statusCode ?? 000, message: e.message));
    } catch (e) {
      throw (AppException(message: e.toString()));
    }
  }
}
