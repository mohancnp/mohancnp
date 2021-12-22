import 'package:get/get.dart';
import 'package:metrocoffee/modules/home/home_controller.dart';
import 'package:metrocoffee/modules/home/widgets/categories_controller.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RedirectionController());
    Get.put(ProfilePageController());
   }
}
