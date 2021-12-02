import 'package:get/get.dart';
import 'package:metrocoffee/modules/auth/custom/membership_login_controller.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/checkout/checkout_page_controller.dart';
import 'package:metrocoffee/modules/maps/new/google_map_controller.dart';
import 'package:metrocoffee/modules/notifications/notification_controller.dart';
// import 'package:metrocoffee/GetXController/contentcontrollers/profile/profile_controller.dart';
import 'package:metrocoffee/modules/payment/payment_page_controller.dart';
import 'package:metrocoffee/modules/products/product_detail_page_controller.dart';
import 'package:metrocoffee/modules/profile/contents/order_details_controller.dart';
import 'package:metrocoffee/modules/profile/contents/order_history_controller.dart';
import 'package:metrocoffee/modules/profile/personal_data_page_controller.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(RedirectionController());
    Get.put(ProfilePageController());
    // Get.put(HomeTabController());
    Get.put(CartController());
    Get.put(NotificationController());
    Get.put(PersonalDataPageController());
    Get.lazyPut(() => MemberShipLoginController());
    Get.put(ProductDetailPageController());
    Get.put(CheckoutPageController());
    Get.put(PaymentPageController());
    Get.put(OrderHistoryController());
    Get.put(OrderDetailsController());
    Get.put(CustomGoogleMapController());
  }
}
