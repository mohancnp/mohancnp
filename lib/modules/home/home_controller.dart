import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/placeholder.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/new_user.dart';
import 'package:metrocoffee/core/models/product.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';
import 'package:metrocoffee/modules/home/widgets/categories_controller.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/util/internet.dart';

class HomeController extends GetxController with StateMixin<CategoryProduct> {
  static HomeController get to => Get.find();

  int currentpageindex = 0;
  bool internetConnected = false;
  ProductService _productService = locator.get<ProductService>();

  Rx<Customer> _user = Customer.fromJson(defaultUser).obs;
  set user(Customer newUser) {
    this._user.value = newUser;
    this._user.refresh();
  }

  Customer get user => _user.value;

  void getUser() async {
    user = await Get.find<ProfilePageController>().getProfile();
  }

  void getDataForCategoryId({required int id}) async {
    var categoryProduct = await _productService.getProductForCategory(id: id);
    print("getting products data");
    unfoldData(categoryProduct);
  }

  void unfoldData(Either<CategoryProduct, Failure> categoryProduct) {
    categoryProduct.fold((l) {
      change(l, status: RxStatus.success());
    }, (r) {
      change(null, status: RxStatus.error(r.message));
    });
  }

  Future initializeAllData() async {}

  Future initializePublicData() async {}

  Future checkInternet() async {
    bool ready = await InternetConnectionHelper.isConnectionReady();
    return ready;
    // getProducts();
  }

  Future<bool> getPublicProductsOfType(String type) async {
    return false;
  }

  void getRightList() {}

  @override
  void onInit() {
    print("on init home");
    getCategoryData();

    super.onInit();
  }

  void getCategoryData() async {
    print("getting category data loading");
    change(null, status: RxStatus.loading());
    var list = CategoriesController.to.categoryList;
    if (list.isEmpty) {
      await CategoriesController.to.getCategories();
      list = CategoriesController.to.categoryList;
    }
    if (list.isNotEmpty) {
      // print("category list is available");
      for (var i = 0; i < list.length; i++) {
        var element = list.elementAt(i);
        if (element.selected != null) {
          if (element.selected!) {
            getDataForCategoryId(id: element.id);
          }
        }
      }
    } else {
      // print("empty category list");
      change(null, status: RxStatus.error("No Products For Category"));
    }
  }

  void navigateToPageDetail(String PageNameName, int id) {
    Get.toNamed(PageNameName + "/$id");
  }

  void navigateToPageName(String PageNameName) {
    Get.toNamed(PageNameName);
  }
}
