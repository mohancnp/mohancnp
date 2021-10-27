import 'package:dio/dio.dart';

void catchAndPrintDioError(DioError e) {
  print("Exception Message: ${e.message}");
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
