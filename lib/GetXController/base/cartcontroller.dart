import 'package:get/get.dart';
import 'package:metrocoffee/constants/instances.dart';
import 'package:metrocoffee/models/cart_data.dart';
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
  RxList<CartData> cartDataList = <CartData>[].obs;

  Rx<ProductDetail?> pd =
      ProductDetail(id: 0, isFavorite: false, price: 0, name: 'N/A', type: "1")
          .obs;

  Future checkProductExistence(productId) async {
    // print("id on check $productId");
    var exists = await cartHandlerDB.getProductWithId(productId);
    status.value = exists;

    // for (int i = 0; i < cartProducts.length; i++) {
    //   if (cartProducts.elementAt(i).productVariantId == productId) {
    //     print("element found");
    //     return true;
    //   }
    // }
  }

  Future emptyCart() async {
    int num = await cartHandlerDB.emptyCart();
    if (num > 0) {
      cartDataList.clear();
      cartDataList.refresh();
    }
  }

  Future getOrderProducts() async {
    cartDataList.clear();
    var allData = await cartHandlerDB.getCartProducts();
    if (allData.length < 1) {
      print('no data returned from local db');
    } else {
      allData.forEach((element) {
        // print(element['orderId']);
        // print(element['name']);
        OrderProducts orderProduct = OrderProducts();
        orderProduct.productId = element['productId'];
        orderProduct.productVariantId = element['variantId'];
        orderProduct.qty = element['qty'];
        String options = element['options'];
        print(options.split(',').last);
        // orderProduct.orderProductOptions=element
        var item = CartData(
          orderProducts: orderProduct,
          name: element['name'],
          price: element['price'],
          imageUri: element['imageUri'],
        );
        cartDataList.add(item);
      });
    }
    cartDataList.refresh();
  }

  addOrderProducts(CartData cartData) async {
    var optionString = "";
    var addonString = "";
    cartData.orderProducts.orderProductOptions?.forEach((element) {
      optionString = optionString + "$element,";
    });
    cartData.orderProducts.orderProductAddons?.forEach((element) {
      addonString = addonString + "$element,";
    });
    var orderData = {
      'variantId': cartData.orderProducts.productVariantId,
      'productId': cartData.orderProducts.productId,
      'qty': cartData.orderProducts.qty,
      'name': cartData.name,
      'imageUri': cartData.imageUri,
      'options': optionString,
      'addons': addonString,
      'price': cartData.price,
    };
    print("storedData:- $orderData");
    var res = await cartHandlerDB.addToCart(orderData);
    if (res >= 1) {
      cartDataList.add(cartData);
      print(
          "id: ${cartData.orderProducts.productVariantId}name:${cartData.name} ");
    } else {
      print('error adding to db');
    }
    print(" Cart Products after being added: ${cartDataList.length}");
    cartDataList.refresh();
  }

  removeOrderProducts(CartData cartData) async {
    //remove from the database if exists
    var res =
        await cartHandlerDB.removeFromCart(cartData.orderProducts.productId);

    if (res <= 0) {
      print('error removing from db');
    } else {
      print('removed from db');
      cartDataList.remove(cartData);
    }
    cartDataList.refresh();
    print(" Cart Products after being removed: ${cartDataList.length}");
  }

  Future getProductDetailWithId(int id) async {
    productService.getSingleProduct(id: id).then((response) {
      // print("single product detail: $response");
      if (response != null) {
        var prodObj = ProductDetail.fromJson(response['data']);
        print("Cart widget data $prodObj");
        pd.value = prodObj;
        pd.refresh();
      }
    });
  }
}
