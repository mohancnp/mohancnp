import 'package:dio/dio.dart';

import 'config.dart';

class LoginService {
  var dio = Dio(options);

  Future emailLogin({required String email, required String password}) async {
    Map<String, String> data = {"email": email, "password": password};

    try {
      var response = await dio.post(
        "$baseUrl/api/login",
        data: data,
      );
      if (response.statusCode == 200)
        return response.data;
      else
        throw DioError(
            requestOptions: RequestOptions(path: "$baseUrl/api/login"));
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
      if (response.statusCode == 200)
        return response.data;
      else
        throw DioError(
            requestOptions: RequestOptions(path: "$baseUrl/api/login"));

      // print(response.data);
    } on DioError catch (e) {
      print("Membership Login Exception: ${e.error}");
    }
  }

  Future socialLogin(
      {required String accessToken, required String provider}) async {
    var user = {
      "access_token": accessToken,
      "provider": provider,
    };

    try {
      var response = await dio.post("$baseUrl/oauth/token", data: user);
      print(" server response code social login: ${response.statusMessage}");
      return response.data;
    } on DioError catch (exp) {
      print(" $provider Login Exception: ${exp.response?.data}");
      // return exp.response?.data;
    }
  }
}
