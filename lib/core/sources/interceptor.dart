import 'dart:io';
import 'package:dio/dio.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import '../locator.dart';

InterceptorsWrapper getTokenInterceptor(Dio dio) {
  final secureStore = locator<TempStorage>();

  return InterceptorsWrapper(onRequest: (options, handler) {
    final token = secureStore.readString(TempStorageKeys.authToken);
    options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';

    return handler.next(options);
  }, onError: (DioError error, handler) {
    return handler.next(error);
  });
}

final loggingInterceptor = InterceptorsWrapper(
  onRequest: (options, handler) {
    print('APIRequest: ${options.method} ${options.uri}');
    // print(options.headers);
    // print(options.data);
    handler.next(options);
  },
  onResponse: (response, handler) {
    print('APIRequest: ${response.statusCode}');
    // print('API Request: ${response.data}');
    handler.next(response);
  },
  onError: (error, handler) {
    print('APIRequest: ${error.response?.toString()}');
    print('APIRequest: ${error.response?.data}');
    handler.next(error);
  },
);
