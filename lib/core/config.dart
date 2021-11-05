import 'package:dio/dio.dart';

String baseUrl = "https://metro.clickandpress.com";

BaseOptions options = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout: 20000,
  sendTimeout: 50000,
  receiveTimeout: 50000,
);
var dio = Dio(options);
