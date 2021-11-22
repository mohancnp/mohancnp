import 'dart:async';
import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/product_type.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/cart_model.dart';
import 'package:metrocoffee/core/models/new_product_model.dart';
import 'package:metrocoffee/core/models/product_detail_model.dart';
import 'package:metrocoffee/core/models/product_model.dart';
import 'package:metrocoffee/core/models/user_model.dart';
import 'package:metrocoffee/core/services/cart_service/cart_service.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/home/widgets/categories_controller.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';
import 'package:metrocoffee/ui/widgets/custom_snackbar_widget.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/internet.dart';

class HomeTabController extends GetxController {
  int currentpageindex = 0;
  bool internetConnected = false;
  Map<String, NewProduct?> data = {
    ProductType.drinks: null,
    ProductType.bakery: null,
    ProductType.snacks: null
  };
  NewProduct? actualProduct;
  DataState _dataState = DataState.NA;
  var _productService = locator<ProductService>();
  var _cartService = locator<CartService>();

  //shared variable with profile page
  Rx<User> _user = User().obs;

  set user(User newUser) {
    // print("Name received: ${newUser.name}");
    this._user.value = newUser;
    this._user.refresh();
  }

  get dataState => this._dataState;
  set dataState(value) => this._dataState = value;

  User get user {
    return _user.value;
  }

  getUser() async {
    user = await Get.find<ProfilePageController>().getProfile();
  }

  Future initializeAllData() async {
    dataState = DataState.loading;
    var loaded = await getProductsOfType(ProductType.drinks);
    if (loaded) {
      var l = await getProductsOfType(ProductType.bakery);
      if (l) {
        var completed = await getProductsOfType(ProductType.snacks);
        if (completed) {
          dataState = DataState.loaded;
          getRightList();
        } else
          dataState = DataState.error;
      } else
        dataState = DataState.error;
    } else
      dataState = DataState.error;

    //used to display cart product count in the home page
    await Get.find<CartController>().getAllCartProducts();
  }

  Future initializePublicData() async {
    dataState = DataState.loading;
    var loaded = await getPublicProductsOfType(ProductType.drinks);
    if (loaded) {
      var l = await getPublicProductsOfType(ProductType.bakery);
      if (l) {
        var completed = await getPublicProductsOfType(ProductType.snacks);
        if (completed) {
          dataState = DataState.loaded;
          getRightList();
        } else
          dataState = DataState.error;
      } else
        dataState = DataState.error;
    } else
      dataState = DataState.error;

    //used to display cart product count in the home page
    await Get.find<CartController>().getAllCartProducts();
  }

  Future checkInternet() async {
    bool ready = await InternetConnectionHelper.isConnectionReady();
    return ready;
    // getProducts();
  }

  Future getProductsOfType(String type) async {
    try {
      var products = await _productService.handleProductsOfType(type: type);
      var newProduct = NewProduct.fromJson(products["data"]);
      data[type] = newProduct;
      return true;
    } on ServerException catch (e) {
      print(e.message);
      return false;
    }
  }

  Future addToCart(int id) async {
    bool verifiedUser = Get.find<RedirectionController>().userExists;
    showCustomDialog();
    var prodObj;
    try {
      if (verifiedUser) {
        prodObj = await getProductDetail(id);
      } else {
        prodObj = await getPublicProductDetail(id);
        // showCustomSnackBarMessage(
        //     title: "Message", message: "Functionality Not Available");
      }
      var product = CartModel(
        productId: prodObj.id!,
        variantId: prodObj.allVariants![0].id,
        qty: 1,
        price: prodObj.allVariants![0].price,
        addons: jsonEncode([]),
        imageUri: prodObj.imageUri ?? "",
        options: jsonEncode(['']),
        name: prodObj.name!,
        size: prodObj.allVariants![0].name,
        extras: "",
      );
      var count = await _cartService.addProductToCart(product.toJson());
      if (count > 0) {
        Get.back();
        Get.find<CartController>().cartCount.value++;
        showCustomSnackBarMessage(title: "Message", message: "added to cart");
      }
    } on AppException catch (e) {
      Get.back();
      showCustomSnackBarMessage(
          title: "Message", message: "something went wrong");
      print(e);
    } on Exception catch (e) {
      Get.back();
      showCustomSnackBarMessage(
          title: "Message", message: "something went wrong");
    }

    // try {
    //   showCustomDialog();
    //   var prodObj = await getProductDetail(id);
    //   var product = CartModel(
    //     productId: prodObj.id!,
    //     variantId: prodObj.allVariants![0].id,
    //     qty: 1,
    //     price: prodObj.allVariants![0].price,
    //     addons: jsonEncode([]),
    //     imageUri: prodObj.imageUri ?? "",
    //     options: jsonEncode(['']),
    //     name: prodObj.name!,
    //     size: prodObj.allVariants![0].name,
    //     extras: "",
    //   );
    //   var count = await _cartService.addProductToCart(product.toJson());
    //   if (count > 0) {
    //     Get.back();
    //     Get.find<CartController>().cartCount.value++;
    //     showCustomSnackBarMessage(title: "Message", message: "added to cart");
    //   }
    // } on AppException catch (e) {
    //   print(e);
    // } on ServerException catch (e) {
    //   print("Server Error $e");
    // }
  }

  Future<ProductDetail> getProductDetail(int id) async {
    try {
      ProductDetail prodObj =
          await locator<ProductService>().handleProductDetail(id: id);
      return prodObj;
    } on ServerException catch (e) {
      throw (AppException(message: "${e.message}"));
    }
  }

  Future<ProductDetail> getPublicProductDetail(int id) async {
    try {
      ProductDetail prodObj =
          await locator<ProductService>().getPublicProductDetail(id: id);
      return prodObj;
    } on ServerException catch (e) {
      throw (AppException(message: "${e.message}"));
    }
  }

  Future<bool> getPublicProductsOfType(String type) async {
    try {
      var products = await _productService.getPublicProductsOfType(type: type);
      var newProduct = NewProduct.fromJson(products["data"]);
      data[type] = newProduct;
      return true;
    } on ServerException catch (e) {
      print(e.message);
      return false;
    }
  }

  getRightList() {
    NewProduct? np;
    var controller = Get.find<CategoriesController>();
    if (controller.activeCategory == ProductType.bakery) {
      np = data[ProductType.bakery];
    } else if (controller.activeCategory == ProductType.drinks) {
      np = data[ProductType.drinks];
    } else {
      np = data[ProductType.snacks];
    }
    actualProduct = np;
    update();
  }
}
