import 'package:dio/dio.dart';
import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/services/rest/config.dart';

class RegisterUser {
  RegisterUser._instance();

  static final RegisterUser _registerUser = RegisterUser._instance();

  factory RegisterUser.getInstance() {
    return _registerUser;
  }

  Future<int> addUser(Map<String, dynamic> data) async {
    var dio = Dio(options);

    int status = 0;

    try {
      var response = await dio.post('/api/register', data: data);
      if (response.statusCode == 200) {
        return 1;
      }
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
    return status;
  }
}
