import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import 'config.dart';

class LoginService {
  var dio = Dio(options);
  Future emailLogin({required String email, required String password}) async {
    Map<String, String> data = {"email": email, "password": password};

    try {
      var response = await dio.post("$baseUrl/api/login", data: data,);
      return response.data;
    } on DioError catch (e) {
      print(" Email Login Exception: ${e.error}");
    }
  }

  Future memberShipLogin({
    required String memberNo,
    required String password,
  }) async {
    Map<String, String> data = {
      "membership_no": memberNo,
      "password": password
    };
    try {
      var response =
          await dio.post("$baseUrl/api/membership-login", data: data);
      // print(response.statusMessage);
      return response.data;
      // print(response.data);
    } on DioError catch (e) {
      print("Membership Login Exception: ${e.error}");
      // return e.response?.data;
      // throw e.response?.statusCode ?? unknownStatus;
      // if (e.response != null) {
      //   status = e.response?.statusCode;
      //   if (status! >= 100 && status <= 200) {
      //     return status;
      //   }
      // }
    }
  }

  Future socialLogin(
      {required String accessToken, required String provider}) async {
    var user = {
      "access_token": accessToken,
      "provider": provider,
      "grant_type": "social",
      "client_id": 1,
      "client_secret": "HbOPLQY8p3D7jIdFOtClxDDudDSIil7YjSM99oEj",
      "job": "random",
      "gender": "male",
    };

    try {
      var response = await dio.post("$baseUrl/oauth/token", data: user);
      // print(response.statusMessage);
      return response.data;
    } on DioError catch (exp) {
      print(" $provider Login Exception: ${exp.response?.data}");
      // return exp.response?.data;
    }
  }
}
