import 'package:dio/dio.dart';
import 'package:metrocoffee/core/constants/app_message.dart';
import 'server_exceptions.dart';

ServerException getServerException(DioError e) {
  switch (e.type) {
    case DioErrorType.response:
      final responseMsg =
          e.response!.data['message'] ?? AppMessage.somethingWentWrong;
      return ServerException(
        code: e.response!.statusCode!,
        message: responseMsg.toString(),
      );
    case DioErrorType.other:
      return ServerException(code: 400, message: AppMessage.dioDefaultMessage);
    default:
      return ServerException(code: 404, message: AppMessage.notFound);
  }
}