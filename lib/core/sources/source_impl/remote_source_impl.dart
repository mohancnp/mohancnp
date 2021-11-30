
import 'package:dio/dio.dart';
import '../../config.dart';
import '../../exceptions/dio_exceptions.dart';
import '../interceptor.dart';
import '../remote_source.dart';

class RemoteSourceImpl implements RemoteSource {
  static final Dio _dio = Dio(options);

  RemoteSourceImpl() {
    // Interceptors
    final tokenInterceptor = getTokenInterceptor(_dio);
    _dio.interceptors.add(tokenInterceptor);
    _dio.interceptors.add(loggingInterceptor);
  }

  @override
  Future<Map<String, dynamic>> get(String url,
      {Map<String, dynamic>? queryParams}) async {
    try {
      final response = await _dio.get(url, queryParameters: queryParams);
      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      }
      return {'data': response.data};
    } on DioError catch (e) {
      throw getServerException(e);
    }
  }

  @override
  Future<Map<String, dynamic>> post(
    String url, {
    dynamic body = const {},
    Map<String, dynamic>? queryParams,
  }) async {

    try {
      final response = await _dio.post(
        url,
        queryParameters: queryParams,
        data: body,
      );
      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      }
      return {'data': response.data};
    } on DioError catch (e) {
      throw getServerException(e);
    }
  }

  @override
  Future<Map<String, dynamic>> put(
    String url, {
    dynamic body,
    Map<String, dynamic>? queryParams,
  }) async {
    try {
      final response = await _dio.put(
        url,
        queryParameters: queryParams,
        data: body,
      );
      if (response.data is Map<String, dynamic>) {
        return response.data as Map<String, dynamic>;
      }
      return {'data': response.data};
    } on DioError catch (e) {
      throw getServerException(e);
    }
  }
}
