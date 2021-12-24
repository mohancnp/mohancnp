import 'package:dio/dio.dart';

BaseOptions options = BaseOptions(
  baseUrl: AppConfig.baseUrl,
  connectTimeout: 10000,
  sendTimeout: 10000,
  receiveTimeout: 10000,
);

class AppConfig {
  static String appTitle = "Metro Coffee";
  static String baseUrl = "https://metro-new-api.clickandpress.com";
  static String metroCoffeeLogoAssetPath =
      "assets/images/metro_coffee_logo.png";
}
