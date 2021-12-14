import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/cart_instance_model.dart';
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
    response.fold((l) {
      // var elem = cartProductList.elementAt(atIndex).name;
      cartProductList.removeAt(atIndex);
      cartCount.value -= 1;
      update();
    }, (r) => print("${r.message}"));
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

  handleCartProductFailure(Failure r) {
    print("reached in failure");
  }

  handleCartProductSucess(List<CartInstance> l) {
    print("reached in sucess");
    if (l.length > 0) {
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
    response.fold((l) => cartCount.value = l, (r) => print("${r.message}"));
  }

  void calculateTotal() async {
    var total = 0.0;
    cartProductList.forEach((element) {
      total += element.totalPrice * element.qty;
    });
    totalAmount.value = total;
  }
}
