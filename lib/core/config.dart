import 'package:dio/dio.dart';
import 'package:metrocoffee/resource/app_config.dart';

BaseOptions options = BaseOptions(
  baseUrl: AppConfig.baseUrl,
  connectTimeout: 20000,
  sendTimeout: 50000,
  receiveTimeout: 50000,
);
var dio = Dio(options);
