import 'package:get/get.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/cart_service/cart_service.dart';

class OrderReceiptController extends GetxController {
  final cartService = locator<CartService>();
  Future<void> clearCartAndNavigateToHome() async {
    await cartService.clearCart();
    Get.offNamed(PageName.homepage);
  }

  
}
