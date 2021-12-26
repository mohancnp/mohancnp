import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/user_order_preference.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';

class CheckoutPageController extends GetxController {
  Rx<String> selectedTimeFrame = "Enter Time".obs;
  final cartController = Get.find<CartController>();
  RemoteOrder remoteOrder = RemoteOrder.empty();
  UserOrderPreference userPreference = UserOrderPreference.pickup;
  var c = Get.find<RedirectionController>();

  void navigateToPageName({required String pageName, String? defaultPageName}) {
    if (c.userExists) {
      Get.toNamed(pageName);
    } else {
      if (defaultPageName != null) {
        c.fromPaymentPage = true;
        Get.toNamed(defaultPageName);
      }
    }
  }

  @override
  void onInit() {
    var userPref = Get.arguments;
    if (userPref != null) {
      userPreference = userPref;
    }
    super.onInit();
  }
}
