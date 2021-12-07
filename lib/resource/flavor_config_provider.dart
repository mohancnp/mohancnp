import 'package:get/get.dart';
import 'package:metrocoffee/resource/app_config.dart';

class FlavorConfigProvider extends GetxController {
  AppConfig config = AppConfig(
      appTitle: "Caffeinator", baseUrl: "https://metro.clickandpress.com");
  static FlavorConfigProvider get to => Get.find();

  FlavorConfigProvider(config) {
    print(config);
    this.config = config;
  }
}
