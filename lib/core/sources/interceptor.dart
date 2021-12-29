import 'dart:io';
import 'package:dio/dio.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/util/debug_printer.dart';
import '../locator.dart';

InterceptorsWrapper getTokenInterceptor(Dio dio) {
  final secureStore = locator<TempStorage>();

  return InterceptorsWrapper(
    onRequest: (options, handler) {
      final token = secureStore.readString(TempStorageKeys.authToken);
      options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      return handler.next(options);
    },
    onError: (DioError error, handler) async {
      if (error.response?.statusCode == 403 ||
          error.response?.statusCode == 401) {
        final response = await locator<AuthService>().refreshToken();
        response.fold((accessToken) {
          dPrint("Access Token: $accessToken");
          final requestOptions = error.requestOptions;
          final options = BaseOptions(
            method: requestOptions.method,
            headers: requestOptions.headers,
          );
          Dio _dio = Dio(options);
          _dio.request(requestOptions.path,
              data: requestOptions.data,
              queryParameters: requestOptions.queryParameters,
              options: Options(
                method: requestOptions.method,
                headers: requestOptions.headers,
              ));
        }, (failure) => {dPrint(failure.message)});
      }
      return handler.next(error);
    },
  );
}

final loggingInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) {
    // dPrint('APIRequest: ${options.method} ${options.uri}');
    // dPrint(options.headers);
    // dPrint(options.data);
    handler.next(options);
  },
  onResponse: (response, handler) {
    // dPrint('APIRequest: ${response.statusCode}');
    // dPrint('API Request: ${response.data}');
    handler.next(response);
  },
  onError: (error, handler) {
    // dPrint('APIRequest: ${error.response?.toString()}');
    // dPrint('APIRequest: ${error.response?.data}');
    handler.next(error);
  },
);
