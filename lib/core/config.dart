import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  baseUrl: AppConfig.baseUrl,
  connectTimeout: 10000,
  sendTimeout: 10000,
  receiveTimeout: 10000,
);

class AppConfig {
  static String appTitle = "";
  static String baseUrl = "";
}
