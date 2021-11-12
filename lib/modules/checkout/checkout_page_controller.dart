import 'package:get/get.dart';
// import 'package:metrocoffee/modules/cart/cart_controller.dart';

class CheckoutPageController extends GetxController {
  List<String> timeValues =
      ["As Soon as possible", "1:00-1:10 PM", "1:10-2:10"].obs;
  Rx<int> selectedTimeIndex = (-1).obs;
  Rx<String> selectedTimeFrame = "Enter Time".obs;

  // final _cartController = Get.find<CartController>();

  // Future getProductsToCheckout() async {
  //   await _cartController.getAllCartProducts();
  // }
}
