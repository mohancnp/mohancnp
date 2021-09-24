import 'package:dio/dio.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';

import 'config.dart';

class ProfileService {
  ProfileService._instance();

  static final ProfileService _productService = ProfileService._instance();

  factory ProfileService.getInstance() {
    return _productService;
  }

  var dio = Dio(options);

  Future getUserAddresses() async {
    var token = await getToken();
    if (token == null) {
      print("token cannot be verifed");
      return;
    } else {
      try {
        dio.options.headers["Authorization"] = "Bearer ${token}";
        var addresses = await dio.get('$baseUrl/api/address');
        if (addresses.statusCode == 200)
          return addresses.data;
        else
          return null;
      } on DioError catch (e) {
        switch (e.type) {
          case DioErrorType.connectTimeout:
            print("connection time out for the request");
            break;
          case DioErrorType.sendTimeout:
            print("send time out for the request");
            break;
          case DioErrorType.receiveTimeout:
            print("receive time out for the request");
            break;
          case DioErrorType.cancel:
            print("The request has been cancelled");
            break;
          case DioErrorType.response:
            print("Server Responded with incorrect status,4xx and 5xx");
            break;
          case DioErrorType.other:
            print("undefined other type of error");
            break;
        }
      }
      return null;
    }
  }
}
