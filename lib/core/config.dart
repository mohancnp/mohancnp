import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  baseUrl: AppConfig.baseUrl,
  connectTimeout: 20000,
  sendTimeout: 50000,
  receiveTimeout: 50000,
);

class AppConfig {
  static String appTitle = "";
  static String baseUrl = "";
}
