import 'package:get/get.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RedirectionController());
    Get.put(ProfilePageController());
    // Get.put(CartController());
    // Get.put(NotificationController());
    // // Get.put(PersonalDataPageController());
    // Get.put(CheckoutPageController());
    // // Get.put(PaymentPageController());
    // Get.put(OrderHistoryController());
    // Get.put(OrderDetailsController());
    // Get.put(CustomGoogleMapController());
    // Get.lazyPut(() => MemberShipLoginController());
  }
}
