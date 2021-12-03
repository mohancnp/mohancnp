import 'dart:async';
import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/cart_model.dart';
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

class HomeTabController extends GetxController
    with StateMixin<CategoryProduct> {
  static HomeTabController get to => Get.find();

  int currentpageindex = 0;
  bool internetConnected = false;
  var _productService = locator<ProductService>();
  var _cartService = locator<CartService>();

  //shared variable with profile page
  Rx<User> _user = User().obs;

  set user(User newUser) {
    this._user.value = newUser;
    this._user.refresh();
  }

  User get user {
    return _user.value;
  }

  getUser() async {
    user = await Get.find<ProfilePageController>().getProfile();
  }

  getDataForCategoryId({required int id}) async {
    var categoryProduct = await _productService.getProductForCategory(id: id);
    print("getting products data");
    unfoldData(categoryProduct);
  }

  unfoldData(Either<CategoryProduct, Failure> categoryProduct) {
    categoryProduct.fold((l) {
      // print(l.products);
      change(l, status: RxStatus.success());
    }, (r) {
      change(null, status: RxStatus.error(r.message));
    });
  }

  Future initializeAllData() async {
    // dataState = DataState.loading;
    // var loaded = await getProductsOfType(ProductType.drinks);
    // if (loaded) {
    //   var l = await getProductsOfType(ProductType.bakery);
    //   if (l) {
    //     var completed = await getProductsOfType(ProductType.snacks);
    //     if (completed) {
    //       dataState = DataState.loaded;
    //       getRightList();
    //     } else
    //       dataState = DataState.error;
    //   } else
    //     dataState = DataState.error;
    // } else
    //   dataState = DataState.error;

    // //used to display cart product count in the home page
    // await Get.find<CartController>().getAllCartProducts();
  }

  Future initializePublicData() async {
    // dataState = DataState.loading;
    // var loaded = await getPublicProductsOfType(ProductType.drinks);
    // if (loaded) {
    //   var l = await getPublicProductsOfType(ProductType.bakery);
    //   if (l) {
    //     var completed = await getPublicProductsOfType(ProductType.snacks);
    //     if (completed) {
    //       dataState = DataState.loaded;
    //       // getRightList();
    //     } else
    //       dataState = DataState.error;
    //   } else
    //     dataState = DataState.error;
    // } else
    //   dataState = DataState.error;

    //used to display cart product count in the home page
    // await Get.find<CartController>().getAllCartProducts();
  }

  Future checkInternet() async {
    bool ready = await InternetConnectionHelper.isConnectionReady();
    return ready;
    // getProducts();
  }

  Future getProductsOfType(String type) async {
    // try {
    //   var products = await _productService.handleProductsOfType(type: type);
    //   var newProduct = NewProduct.fromJson(products["data"]);
    //   data[type] = newProduct;
    //   return true;
    // } on ServerException catch (e) {
    //   print(e.message);
    //   return false;
    // }
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
    // try {
    //   var products = await _productService.getPublicProductsOfType(type: type);
    //   var newProduct = NewProduct.fromJson(products["data"]);
    //   data[type] = newProduct;
    //   return true;
    // } on ServerException catch (e) {
    //   print(e.message);
    //   return false;
    // }
    return false;
  }

  getRightList() {
    // NewProduct? np;
    // var controller = Get.find<CategoriesController>();
    // if (controller.activeCategory == ProductType.bakery) {
    //   np = data[ProductType.bakery];
    // } else if (controller.activeCategory == ProductType.drinks) {
    //   np = data[ProductType.drinks];
    // } else {
    //   np = data[ProductType.snacks];
    // }
    // actualProduct = np;
    // update();
  }

  @override
  void onInit() {
    // print("on init home");
    getCategoryData();
    // getUser();
    super.onInit();
  }

  getCategoryData() async {
    print("getting category data loading");
    change(null, status: RxStatus.loading());
    var list = CategoriesController.to.categoryList;
    if (list.isEmpty) {
      await CategoriesController.to.getCategories();
      list = CategoriesController.to.categoryList;
    }
    if (list.isNotEmpty) {
      print("category list is available");
      for (var i = 0; i < list.length; i++) {
        var element = list.elementAt(i);
        if (element.selected != null) {
          if (element.selected!) {
            getDataForCategoryId(id: element.id);
          }
        }
      }
    } else {
      print("empty category list");
      change(null, status: RxStatus.error("No Products For Category"));
    }
  }
}
