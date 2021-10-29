import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/basecontroller.dart';
import 'package:metrocoffee/GetXController/productcontroller/drinkdetailscontroller.dart';
import 'package:metrocoffee/GetXController/productcontroller/productdetailscontroller.dart';
import 'package:metrocoffee/core/constants/instances.dart';
import 'package:metrocoffee/models/cart_data.dart';
import 'package:metrocoffee/models/order.dart';
import 'package:metrocoffee/models/variants.dart';
import 'package:metrocoffee/screens/widgets/dialogs/userpreference.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/user_detail.dart';

class CartController extends GetxController {
  int tabindex = 0;

  settabindex(int index) {
    tabindex = index;
    update();
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
    var id = await getUserId();
    // if(id==null &&)
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
        // print("Cart widget data $prodObj");
        pd.value = prodObj;
        pd.refresh();
      }
    });
  }

  Future updateCartProductCountWithId(int atIndex, int id, int count) async {
    //update the database if exists
    // print("product detail Price: ${pd.value?.price}");
    bool affected = await cartHandlerDB.updateCart(id, count);

    // print(count);
    if (!affected) {
      print('error updating cart in db');
    } else {
      cartDataList.elementAt(atIndex).orderProducts.qty = count;
      // print(cartDataList[atIndex]);
    }
    cartDataList.refresh();
    // print(" Cart Products count updated
    // to $count");
  }

  Future buildDataAndAddToCart(
      {required ProductDetail? productDetail,
      required int id,
      required int? tag,
      required ProductDetailController productDetailsController,
      required DrinkDetailsController drinkDetailsController,
      required OrderProducts orderProducts}) async {
    status.toggle();
    //variant id of selected variant type
    int selectedVariantIndex = 0;
    if (tag == 1) {
      //for snacks
      selectedVariantIndex = productDetailsController.currentsize;
    } else {
      //for drinks
      selectedVariantIndex = drinkDetailsController.currentsize;
    }
    orderProducts.productVariantId =
        productDetail?.allVariants?.elementAt(selectedVariantIndex).id;
    //actual product id
    orderProducts.productId = id;

    //for drink options only
    if (tag == 0) {
      //....building temprature option......///
      String name = productDetail?.options?.elementAt(1).name ?? "None";

      String selectedTemprature = productDetail?.options
              ?.elementAt(1)
              .options
              .elementAt(drinkDetailsController.currenttabindex) ??
          "Error";

      int id = productDetail?.options?.elementAt(1).id ?? -1;

      //....building toppings opions.....//
      String selectedToppings = drinkDetailsController.currenttopping;
      //.....building milk options...//
      String selectedMilk = drinkDetailsController.currentmilk;

      //collecting the option and build the order
      orderProducts.orderProductOptions = [
        selectedMilk,
        selectedTemprature,
        selectedToppings
      ];

      //collecting the addons
      orderProducts.orderProductAddons = drinkDetailsController.selectedIds;
    }
    CartData cartData = CartData(
      orderProducts: orderProducts,
      name: productDetail?.name,
      imageUri: productDetail?.imageUri,
      price: (tag == 0)
          ? drinkDetailsController.totalPrice.value
          : productDetailsController.totalPrice.value,
    );

    //check before adding new data to the cart
    if (status.isTrue) {
      addOrderProducts(cartData);
    } else if (status.isFalse) {
      removeOrderProducts(cartData);
    }
  }

  Future buildAndProcessOrder(
      {required int? tag,
      required BuildContext context,
      required ProductDetail? productDetail,
      required OrderProducts orderProducts,
      required DrinkDetailsController drinkDetailsController,
      required ProductDetailController productDetailsController,
      required int id}) async {
    if (tag == 0) {
      //the size selected(variant) med,small or large is detected here
      orderProducts.productVariantId = productDetail?.allVariants
          ?.elementAt(drinkDetailsController.currentsize)
          .id;
      //....building temprature option......///
      int id = productDetail?.options?.elementAt(1).id ?? -1;
      String name = productDetail?.options?.elementAt(1).name ?? "None";

      String selectedTemprature = productDetail?.options
              ?.elementAt(1)
              .options
              .elementAt(drinkDetailsController.currenttabindex) ??
          "Error";
      var tempOption = ProductOption(
              id: id,
              options: [selectedTemprature],
              defaultValue: "0",
              name: name)
          .toJson();

      String selectedToppings = drinkDetailsController.currenttopping;

      //.....building milk options...//
      String selectedMilk = drinkDetailsController.currentmilk;

      //collecting the option and build the order
      orderProducts.orderProductOptions = [
        selectedMilk,
        selectedTemprature,
        selectedToppings
      ];

      //collecting the addons
      orderProducts.orderProductAddons = drinkDetailsController.selectedIds;
    } else {
      //the size selected(variant) med,small or large is detected here
      orderProducts.productVariantId = productDetail?.allVariants
          ?.elementAt(productDetailsController.currentsize)
          .id;
    }
    orderProducts.productId = id;

    //building the selected option
    // print("reached here");
    CartData cartData = CartData(
      orderProducts: orderProducts,
      name: productDetail?.name,
      imageUri: productDetail?.imageUri,
      price: drinkDetailsController.totalPrice.value,
    );
    List<CartData> orders = <CartData>[
      cartData,
    ];
    if (status.isTrue) {
      Get.find<BaseController>().setindex(2);
      Get.back();
    } else {
      showDialog<String>(
          context: context,
          builder: (BuildContext context) => AlertDialog(
                content: UserPreference(orders: orders, oldContext: context),
              ));
    }
  }
}
