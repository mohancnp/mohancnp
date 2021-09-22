import 'package:get/get.dart';
import 'package:metrocoffee/constants/rest_instance.dart';
import 'package:metrocoffee/models/order.dart';
import 'package:metrocoffee/models/variants.dart';

class CartController extends GetxController {
  int tabindex = 0;

  settabindex(int index) {
    tabindex = index;
    // update();
  }

  Rx<bool> status = false.obs;
  RxList<OrderProducts> cartProducts = <OrderProducts>[].obs;

  ProductDetail? pd;

  Future checkProductExistence(productId) async {
    print("id on check $productId");
    for (int i = 0; i < cartProducts.length; i++) {
      if (cartProducts.elementAt(i).productVariantId == productId) {
        print("element found");
        return true;
      }
    }
    return false;
  }

  setCartStatus(int id) {}

  addOrderProducts(OrderProducts? product) {
    cartProducts.add(product!);
    print(" Cart Products after being added: ${cartProducts.length}");
    cartProducts.refresh();
  }

  removeOrderProducts(OrderProducts? product) {
    for (int i = 0; i < cartProducts.length; i++) {
      if (cartProducts.elementAt(i).productVariantId ==
          product?.productVariantId) {
        cartProducts.removeAt(i);
        break;
      }
    }
    cartProducts.refresh();
    print(" Cart Products after being removed: ${cartProducts.length}");
  }

  Future getProductDetailWithId(int id) async {
    productService.getSingleProduct(id: id).then((response) {
      // print("single product detail: $response");
      var prodObj = ProductDetail.fromJson(response['data']);
      print("Cart added product $prodObj");
      pd = prodObj;
      update();
    });
  }
}
