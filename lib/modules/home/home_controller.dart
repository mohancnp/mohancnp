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
import 'package:metrocoffee/util/internet.dart';

class HomeController extends GetxController with StateMixin<CategoryProduct> {
  static HomeController get to => Get.find();

  int currentpageindex = 0;
  bool internetConnected = false;
  final ProductService _productService = locator.get<ProductService>();

  final Rx<Customer> _user = Customer.fromJson(defaultUser).obs;
  set user(Customer newUser) {
    _user.value = newUser;
    _user.refresh();
  }

  void getDataForCategoryId({required int id}) async {
    var categoryProduct = await _productService.getProductForCategory(id: id);
    unfoldData(categoryProduct);
  }

  void unfoldData(Either<CategoryProduct, Failure> categoryProduct) {
    categoryProduct.fold((l) {
      change(l, status: RxStatus.success());
    }, (r) {
      change(null, status: RxStatus.error(r.message));
    });
  }

  Future<bool> checkInternet() async {
    bool ready = await InternetConnectionHelper.isConnectionReady();
    return ready;
  }


  @override
  void onInit() {
    getCategoryData();
    super.onInit();
  }

  void getCategoryData() async {
    change(null, status: RxStatus.loading());
    var list = CategoriesController.to.categoryList;
    if (list.isEmpty) {
      await CategoriesController.to.getCategories();
      list = CategoriesController.to.categoryList;
    }
    if (list.isNotEmpty) {
      for (var i = 0; i < list.length; i++) {
        var element = list.elementAt(i);
        if (element.selected != null) {
          if (element.selected!) {
            getDataForCategoryId(id: element.id);
          }
        }
      }
    } else {
      change(null, status: RxStatus.error("No Products For Category"));
    }
  }

  void navigateToPageDetail(String pageNmae, int id) {
    Get.toNamed(pageNmae + "/$id");
  }

  void navigateToPageName(String pageName) {
    Get.toNamed(pageName);
  }
}
