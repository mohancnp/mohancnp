import 'package:dio/dio.dart';
import 'package:dio_http_cache/dio_http_cache.dart';
import 'package:flutter/material.dart';

import '../core/config.dart';

class ApiService {
  static const authorization_key = "Authorization";

  getAuthorization() {
    //  var tokenFromLocator = locator<UserService>().user.value.authToken;

    ////// //print('token from locator: $tokenFromLocator');
    return {
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYjgxYWU1NjhmMDFjODQzNTA5ZGNiZjA2NjhmYjVjY2YxZGY3OWIyN2EyZWUzOTUwODdjNzFmZWMyZDhhMTA3MjQ4ZDhkYTkzNmZkODJiMDciLCJpYXQiOjE2Mjc0Njg5NzguODA0MjE4LCJuYmYiOjE2Mjc0Njg5NzguODA0MjIyLCJleHAiOjE2NTkwMDQ5NzguODAwOTQ3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.EQSBzHTimsMCobDYkwCkYxcgz_hhWU_8elJc148m23b5WUNKXmR_TqxgINgNlG7gLtZtnPBnZm95lXn4J1lKVjJDwOwa6xmmjleZ9lqflU7-YHUpIuyenPo1WYvb0KAPFObd0knu4PB6Afg-W6K4xvgQpde_8k7BDznEp9ORm81moRosQXrX7EuKOpTbFOudm9maPIALOlQLBzqXNhPm3aBeN3Cc7fAFzD5e1nHnE5YPNgoKNHfE5StuR89Zc4157ZIdrhlIox4jruih-9vCDBH1gfQVSxpS6IzY7RbJCjH2ofkNsaWZ9wV-eTaKsKWBqi0A5u0uLcFhEOgPjiaqbwKWdtU08cXs6oGgCaEAFxAPLfmZ7dCZrhNrkANQFeRAr7Onxlc60DJ7NIcLWnsc15s5m1bG6YMENrjFxUqrak3ESJ-fn9jOcNB8YpMsvQCGaXsGS19T63YUZ9ERoUQJMJD8mPtD9o6nUl_Tf-LC2626NstFx3-9ztc8G31RhqxJG4jFzg8p7henqZFJMOgpgm9JkdXtmj_MvpXiyzM9x54nNfEeY5anpaivd7Lc_IGjm5dNm1CTAsnqw-vQ4s9g8hAHPFKlEs4sZxprdDW9-yshQeiJLpBjn9nPJ1RpYMs0UtNHPPRPOnzwCPcmLMDeKfkHWJ6u74xvfEizEgNM1vk"
    };
  }

  getAuthorizationWithSessionId() {
    //  var token = locator<UserService>().user.value.authToken;

    // //print(token);
    return {
      authorization_key:
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiYjgxYWU1NjhmMDFjODQzNTA5ZGNiZjA2NjhmYjVjY2YxZGY3OWIyN2EyZWUzOTUwODdjNzFmZWMyZDhhMTA3MjQ4ZDhkYTkzNmZkODJiMDciLCJpYXQiOjE2Mjc0Njg5NzguODA0MjE4LCJuYmYiOjE2Mjc0Njg5NzguODA0MjIyLCJleHAiOjE2NTkwMDQ5NzguODAwOTQ3LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.EQSBzHTimsMCobDYkwCkYxcgz_hhWU_8elJc148m23b5WUNKXmR_TqxgINgNlG7gLtZtnPBnZm95lXn4J1lKVjJDwOwa6xmmjleZ9lqflU7-YHUpIuyenPo1WYvb0KAPFObd0knu4PB6Afg-W6K4xvgQpde_8k7BDznEp9ORm81moRosQXrX7EuKOpTbFOudm9maPIALOlQLBzqXNhPm3aBeN3Cc7fAFzD5e1nHnE5YPNgoKNHfE5StuR89Zc4157ZIdrhlIox4jruih-9vCDBH1gfQVSxpS6IzY7RbJCjH2ofkNsaWZ9wV-eTaKsKWBqi0A5u0uLcFhEOgPjiaqbwKWdtU08cXs6oGgCaEAFxAPLfmZ7dCZrhNrkANQFeRAr7Onxlc60DJ7NIcLWnsc15s5m1bG6YMENrjFxUqrak3ESJ-fn9jOcNB8YpMsvQCGaXsGS19T63YUZ9ERoUQJMJD8mPtD9o6nUl_Tf-LC2626NstFx3-9ztc8G31RhqxJG4jFzg8p7henqZFJMOgpgm9JkdXtmj_MvpXiyzM9x54nNfEeY5anpaivd7Lc_IGjm5dNm1CTAsnqw-vQ4s9g8hAHPFKlEs4sZxprdDW9-yshQeiJLpBjn9nPJ1RpYMs0UtNHPPRPOnzwCPcmLMDeKfkHWJ6u74xvfEizEgNM1vk"
    };
  }

  membershiplogin({String? membershipnumber, String? password}) async {
    final url = '$baseUrl/api/membership-login';
    final Map<String?, String?> body = {
      'membership_no': membershipnumber,
      'password': password
    };
    final response = await postRequest(url: url, data: body);
    return response;
  }

  changepassword(
      {String? currentpassword,
      String? newpassword,
      String? confirmnewpassword}) async {
    final url = '$baseUrl/api/profile/change-password';
    final Map<String?, String?> body = {
      'current_password': currentpassword,
      'new_password': newpassword,
      'new_password_confirmation': confirmnewpassword
    };
    final response = await postRequest(
        url: url,
        data: body,
        options: Options(
          headers: getAuthorizationWithSessionId(),
        ));
    return response;
  }

  getprofiledata() async {
    final url = '$baseUrl/api/profile';
    final response = await getRequest(
        url: url, options: Options(headers: getAuthorization()));
    return response;
  }

  getallproducts() async {
    final url = '$baseUrl/api/product';
    final response = await getRequest(
        url: url, options: Options(headers: getAuthorization()));
    return response;
  }

  updateprofiledata(
      {String? name, String? phone, String? profilepic, String? email}) async {
    final url = '$baseUrl/api/profile/update';
    final Map<String?, String?> body = {
      'name': name,
      'phone': phone,
      'profile_pic': profilepic,
      'email': email,
    };
    final response = await postRequest(
        url: url,
        data: body,
        options: Options(
          headers: getAuthorizationWithSessionId(),
        ));
    return response;
  }

  emaillogin({String? email, String? password}) async {
    final url = '$baseUrl/api/login';
    final Map<String?, String?> body = {'email': email, 'password': password};
    final response = await postRequest(url: url, data: body);

    return response;
  }

  logout() async {
    final url = '$baseUrl/api/logout';
    final response = await postRequest(
      url: url,
    );

    return response;
  }

  Map<String, String> convertMapDynamicToString(Map<String, dynamic> json) {
    Map<String, String> temp = {};

    json.forEach((key, v) {
      temp[key] = v.toString();
    });

    return temp;
  }

  Future<Map<String, dynamic>>? getRequest(
      {var queryParameters,
      @required var url,
      Options? options,
      bool isRefreshRequest = false,
      List<String>? nonCachableList}) async {
    Map<String, dynamic> httpResponse = {};
    Dio _dio = Dio();
    // print(url);
    //   recordCrashlyticsLog("get request at $url");

    bool _isUrlNonCachable = false;

    if (nonCachableList != null && !isRefreshRequest) {
      _isUrlNonCachable = nonCachableList.contains(url);
    }

    if (_isUrlNonCachable == false) {
      final tempUri = Uri.https(
          "",
          url,
          queryParameters == null
              ? null
              : convertMapDynamicToString(queryParameters));

      var some = tempUri.toString();
      var urlAddress =
          Uri.parse("https://" + tempUri.toString().split("https://").last);

      final _config = CacheConfig(
        baseUrl: url,
        defaultMaxStale: Duration(days: 2),
        databaseName: "dio-http-cache",
        skipMemoryCache: true,
        defaultMaxAge: Duration(hours: 6),
      );

      final _cacheManager = DioCacheManager(_config);

      //    final firebasePerformanceInterceptor = DioFirebasePerformanceInterceptor();
      //  _dio.interceptors.add(firebasePerformanceInterceptor);

      if (isRefreshRequest)
        _cacheManager.deleteByPrimaryKeyWithUri(urlAddress,
            requestMethod: "GET");

      _dio.interceptors.add(_cacheManager.interceptor);
    }

    try {
      final response = await _dio.get(
        url,
        //options: options,
        options: _isUrlNonCachable
            ? options
            : buildCacheOptions(
                Duration(hours: 6),
                options: options,
                maxStale: Duration(days: 1),
              ),
        queryParameters: queryParameters,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        if (response != null) {
          //    handleSession(response, _sessionService);

          if (!_isUrlNonCachable) {}

          if (response.data['success'] == true) {
            httpResponse['data'] = response.data['data'];
            if (response.data.containsKey("page_meta"))
              httpResponse['page_meta'] = response.data["page_meta"];
            if (response.data.containsKey("description"))
              httpResponse['description'] = response.data["description"];
          } else {
            //// //print(response.data["error"]);
            httpResponse["error"] = response.data["error"];
          }
        }

        return httpResponse;
      }
    } on DioError catch (e, stackTrace) {
      //print("error:$e   at url : $url");
      //   Crashlytics.instance.recordError(
      //     'Api get request error at $url \n with message ${e.toString()} ',
      //   stackTrace);

//      handleError(e: e.toString(), httpResponse: httpResponse, stack: stackTrace);
      if (e.toString().toLowerCase().contains("socketexception")) {
        httpResponse["error"] = "No internet connection";
        return httpResponse;
      }

      return httpResponse;
    }
    return httpResponse;
  }

  Future<Map<String, dynamic>>? postRequest(
      {var queryParameters,
      var data,
      Options? options,
      @required var url}) async {
    //   SessionService _sessionService = locator<SessionService>();
    Map<String, dynamic> httpResponse = {};

    Dio _dio = Dio(BaseOptions(receiveDataWhenStatusError: true));
    //   final firebasePerformanceInterceptor = DioFirebasePerformanceInterceptor();
    // _dio.interceptors.add(firebasePerformanceInterceptor);

    //  recordCrashlyticsLog("post request at $url");
    // print(url);
    try {
      var response = await _dio.post(
        url,
        data: data,
        options: options,
        queryParameters: queryParameters,
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        // handleSession(response, _sessionService);

        if (response != null) {
          if (response.data["success"] == true) {
            httpResponse['data'] = response.data['data'];
            if (response.data.containsKey("message"))
              httpResponse["message"] = response.data["message"];
          } else {
            //// //print(response.data["error"]);
            httpResponse["error"] = response.data["error"];
          }

          return httpResponse;
        } // end of checking response

      }
    } on DioError catch (e, stackTrace) {
      var errorRes = e.response!.data;
      print(errorRes);
      if (e.toString().toLowerCase().contains("socketexception")) {
        httpResponse["error"] = "No internet connection";
        return httpResponse;
      }
      if (errorRes is Map) {
        if (errorRes.containsKey("error")) {
          httpResponse["error"] = errorRes["error"];
          return httpResponse;
        }
      }

//      handleError(e: e.toString(), httpResponse: httpResponse, stack: stackTrace);

      return httpResponse;
    }
    return httpResponse;
  }
}
