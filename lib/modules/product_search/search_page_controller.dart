import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/filter.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';

class SearchPageController extends GetxController {
  TextEditingController searchBarController = TextEditingController();
  var _productService = locator.get<ProductService>();
  static SearchPageController get to => Get.find();
  String errorMessage = "";
  bool searching = false;
  FilterProduct ctp = FilterProduct(products: []);
  Future performSearch() async {
    errorMessage = "";
    searching = true;
    update();
    var response =
        await _productService.getFilteredList(searchBarController.text);
    response.fold((l) => handleResponse(l), (r) => handleFailure(r));
  }

  handleResponse(FilterProduct cp) {
    ctp = cp;
    searching = false;
    update();
  }

  handleFailure(Failure f) {
    errorMessage = f.message;
    searching = false;
    update();
  }

  navigateToSearchPage(String routeName, bool enabled) {
    if (!enabled) {
      Get.toNamed(routeName);
    }
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
