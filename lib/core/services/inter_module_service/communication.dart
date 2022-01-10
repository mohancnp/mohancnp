import 'package:get/get.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';

class InterModuleService {
  static void updateProfileController() {
    Get.find<ProfilePageController>().update();
  }

  get profile => Get.find<ProfilePageController>();
}
