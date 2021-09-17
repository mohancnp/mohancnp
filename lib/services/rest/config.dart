import 'package:dio/dio.dart';

var baseUrl = "https://metro.clickandpress.com";
var unknownStatus=10;
BaseOptions options = BaseOptions(
  baseUrl: baseUrl,
  connectTimeout:   10000,
  sendTimeout: 50000,
  receiveTimeout: 50000,
);

