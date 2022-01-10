import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/user_order_preference.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/cart_instance.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/cart_service/cart_service.dart';

class CartController extends GetxController {
  List<CartInstance> cartProductList = <CartInstance>[];
  Rx<int> cartCount = 0.obs;
  Rx<double> totalAmount = 0.0.obs;
  var cartService = locator<CartService>();

  Future getAllCartProducts() async {
    var cartList = await cartService.getCartProducts();
    cartList.fold(
        (l) => handleCartProductSucess(l), (r) => handleCartProductFailure(r));
  }

  Future removeItemFromCart(int id, int atIndex) async {
    var response = await cartService.removeProductWithId(id);
    response.fold(
      (l) {
        cartProductList.removeAt(atIndex);
        calculateTotal();
        cartCount.value -= 1;
        update();
      },
      (r) {},
    );
  }

  void handleOrderPickUp() {
    //gettting the dialog back
    Get.back();
    Get.toNamed(
      PageName.checkoutpage,
      arguments: UserOrderPreference.pickup,
    );
  }

  void handleOrderDelivery() {
    Get.back();
    Get.toNamed(
      PageName.checkoutpage,
      arguments: UserOrderPreference.delivery,
    );
  }

  Future increaseItemQty(CartInstance cartInstance, atIndex) async {
    var newInstance = cartInstance;
    newInstance.qty += 1;
    var response = await cartService.addProductToCart(cartInstance.toJson());
    response.fold((l) {
      cartProductList[atIndex] = newInstance;
      update();
      calculateTotal();
    }, (r) => handleCartProductFailure(r));
  }

  Future decreaseItemQty(CartInstance cartInstance, atIndex) async {
    if (cartInstance.qty > 1) {
      var newInstance = cartInstance;
      newInstance.qty -= 1;
      var response = await cartService.addProductToCart(cartInstance.toJson());

      response.fold((l) {
        cartProductList[atIndex] = newInstance;
        update();
        calculateTotal();
      }, (r) => handleCartProductFailure(r));
    }
  }

  handleCartProductFailure(Failure r) {}

  handleCartProductSucess(List<CartInstance> l) {
    if (l.isNotEmpty) {
      cartProductList = l;
      cartCount.value = l.length;
      calculateTotal();
    }
    update();
  }

  @override
  void onInit() {
    getCartItemCount();
    super.onInit();
  }

  Future getCartItemCount() async {
    var response = await cartService.getCount();
    response.fold((l) => cartCount.value = l, (r) {});
  }

  void calculateTotal() async {
    var total = 0.0;
    for (var element in cartProductList) {
      total += element.totalPrice * element.qty;
    }
    totalAmount.value = total;
  }
}
