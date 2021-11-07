import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/auth/membershipcontroller.dart';
import 'package:metrocoffee/GetXController/auth/social_login_controller.dart';
import 'package:metrocoffee/modules/auth/custom/membership_login_controller.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/GetXController/base/profile/personaldatapagecontroller.dart';
import 'package:metrocoffee/modules/home/categories_controller.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/notificationcontroller.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/profile/profile_controller.dart';
import 'package:metrocoffee/GetXController/productcontroller/drinkdetailscontroller.dart';
import 'package:metrocoffee/GetXController/productcontroller/productdetailscontroller.dart';
import 'package:metrocoffee/modules/products/product_detail_page_controller.dart';

class ControllerBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeTabController());
    Get.put(CartController());
    Get.put(BaseController());

    Get.put(DrinkDetailsController());
    Get.put(ProfileController());
    Get.put(ProductDetailController());
    Get.put(NotificationController());
    Get.put(CategoriesController());
    Get.put(PersonalDataPageController());
    Get.put(SocialLoginController());
    Get.put(MemberShipController());
    Get.lazyPut(() => MemberShipLoginController());
    Get.put(ProductDetailPageController());
  }
}
