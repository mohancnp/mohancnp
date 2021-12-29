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
  static String publishableKey =
      "pk_test_51K9SU9KMZ7M71898ZFw3vUq17tQNh0zMPmPRMizzxwHN3wOKlOt1ohY1jCrFQPMkaKq6XSgF8wLDWPvWhg1yzKSa004yobTFFg";
  static String stripeBaseUrl = "https://api.stripe.com";
}
