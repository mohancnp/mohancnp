import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/older/cart_model.dart';
import 'package:metrocoffee/core/services/cart_service/cart_service.dart';

class CartController extends GetxController {
  RxList<CartModel>? cartProductList = <CartModel>[].obs;
  Rx<int> cartCount = 0.obs;
  Rx<double> totalAmount = 0.0.obs;
  var cartService = locator<CartService>();

  /* Get products from cart and also updates the count of cart item */

  Future getAllCartProducts() async {
    cartProductList?.clear();
    try {
      var list = await cartService.getCartProducts();
      // print(list.length);
      list.forEach((element) {
        var item = CartModel.fromJson(element);
        item.updatedPrice = item.price;
        cartProductList?.add(item);
      });

      if (list.length > 0) {
        cartCount.value = list.length;
      }
      // update();
      cartProductList?.refresh();
      getTotalAmountFromCartList();
    } on AppException catch (e) {
      print(e.message);
    }
  }

  void increaseTotal(double withAmount) {
    totalAmount.value += withAmount;
  }

  void decreaseTotal(double withAmount) {
    if (totalAmount.value > 0) {
      totalAmount.value -= withAmount;
    }
  }

  void getTotalAmountFromCartList() {
    var total = 0.0;
    cartProductList?.forEach((element) {
      total += element.updatedPrice!;
    });
    totalAmount.value = total;
  }

  // double getPriceAtI(int index) {
  //   if (cartProductList != null) {
  //     if (cartProductList!.isNotEmpty) {
  //       return cartProductList![index].price * cartProductList![index].qty;
  //     } else
  //       return 0.0;
  //   } else
  //     return 0.0;
  // }

/*increase item count,increase price of the item accordingly and updates db as well as ui */

  Future increaseItemCount(int index) async {
    CartModel cm = cartProductList![index];
    ++cm.qty;
    cm.updatedPrice = cm.updatedPrice! + cm.price;
    var count = await cartService.addProductToCart(cm.toJson());
    if (count > 0) {
      print("count more than 1 ");
      cartProductList![index].qty = cm.qty;
      cartProductList![index].updatedPrice = cm.updatedPrice;
    }
    // print(cartProductList![index].qty);
    cartProductList?.refresh();
    getTotalAmountFromCartList();
  }

/*decreases item count,decreases price of the item accordingly and updates db as well as ui */
  Future decreaseItemCount(index) async {
    CartModel cm = cartProductList![index];
    if (cm.qty > 1) {
      --cm.qty;
      cm.updatedPrice = cm.updatedPrice! - cm.price;
      var result = await cartService.addProductToCart(cm.toJson());
      if (result > 0) {
        // print("count more than 1 ");

        cartProductList![index].qty = cm.qty;
        cartProductList![index].updatedPrice = cm.updatedPrice;
      }

      cartProductList?.refresh();
      getTotalAmountFromCartList();
    }
  }

  Future<String> addProductToCart(Map<String, dynamic> orderData) async {
    var message = "";
    // print("item to cart: $orderData");
    try {
      var count = await cartService.addProductToCart(orderData);
      if (count > 0) {
        message = "Added To Cart";
        return message;
      }
    } on AppException catch (e) {
      message = "Error adding product to Cart";
      print(e.message);
    }
    return message;
  }

  //remove from the database if exists
  Future removeItemAtIndex(int index) async {
    CartModel? cm = cartProductList?.elementAt(index);
    cartProductList?.removeAt(index);
    if (cm != null) {
      try {
        var res = await cartService.removeProductWithId(cm.productId);
        if (res > 0) {
          if (cartProductList != null) {
            // print(cartProductList!.length);
            cartCount.value = cartProductList!.length;
            cartProductList?.refresh();
            getTotalAmountFromCartList();

            print("cart count${cartCount.value}");
          }
        }
        print("Affected rows on delete: $res");
      } on AppException catch (e) {
        print("${e.message}");
      }
    }
  }
}
