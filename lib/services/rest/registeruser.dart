import 'package:dio/dio.dart';
import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/services/rest/config.dart';

class RegisterUser {

  Future<int> addUser(User user) async {
    var dio = Dio(options);
    var data = user.toJson();

    int? status = 0;

    try {
      var response = await dio.post('/register', data: data);
      print(response.statusMessage);
      // print(response.data);
    } on DioError catch (e) {
      print(e.error);
      throw e.response?.statusCode ?? unknownStatus;
      // if (e.response != null) {
      //   status = e.response?.statusCode;
      //   if (status! >= 100 && status <= 200) {
      //     return status;
      //   }
      // }
    }
    return status;
  }
}
