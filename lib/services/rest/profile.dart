import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:metrocoffee/services/dioerror_catcher.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';

import 'config.dart';

class ProfileService {
  ProfileService._instance();

  static final ProfileService _productService = ProfileService._instance();

  factory ProfileService.getInstance() {
    return _productService;
  }

  var dio = Dio(options);

  Future getUserProfileDataWithToken(token) async {
    try {
      dio.options.headers["Authorization"] = "Bearer ${token}";
      var profile = await dio.get('$baseUrl/api/profile');
      if (profile.statusCode == 200)
        return profile.data;
      else
        return null;
    } on DioError catch (e) {
      catchAndPrintDioError(e);
    }
  }

  Future updateUserProfile(dataToUpdate) async {
    var token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Content-Type"] = "application/json";
    var data = dataToUpdate;
    if (token == null) {
      print("token cannot be verifed");
      return null;
    } else {
      try {
        var afterUpdate = await dio.put(
          '$baseUrl/api/profile/update',
          data: data,
        );
        if (afterUpdate.statusCode == 200)
          return afterUpdate.data;
        else
          return null;
      } on DioError catch (e) {
        catchAndPrintDioError(e);
      }
      return null;
    }
  }

  Future changePassword(
      {required String newPassword,
      required String confirmPassword,
      required String oldPassword}) async {
    var token = await getToken();
    // print(token);
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Content-Type"] = "application/x-www-form-urlencoded";
    var data = {
      "current_password": oldPassword,
      "new_password": newPassword,
      "new_password_confirmation": confirmPassword
    };

    if (token == null) {
      print("token cannot be verifed");
      return null;
    } else {
      try {
        // print(data);
        var afterUpdate = await dio.post(
          '$baseUrl/api/profile/change-password',
          data: data,
        );
        return afterUpdate.data;
      } on DioError catch (e) {
        catchAndPrintDioError(e);
        print("${e.message}${e.requestOptions.path}");
      }
      return null;
    }
  }

}
