import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/filter.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';

class SearchPageController extends GetxController {
  TextEditingController searchBarController = TextEditingController();
  final _productService = locator.get<ProductService>();
  static SearchPageController get to => Get.find();
  String errorMessage = "";
  bool searching = false;

  FilterProduct ctp = FilterProduct(products: []);
  Future<void> performSearch() async {
    // dPrint("called");
    errorMessage = "";
    searching = true;
    // print("searching");
    update();
    await Future.delayed(const Duration(seconds: 1), () async {
      if (searchBarController.text.isNotEmpty) {
        var response =
            await _productService.getFilteredList(searchBarController.text);
        response.fold(handleResponse, handleFailure);
      }
    });
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

  navigateToSearchPage(String pageName, bool enabled) {
    if (!enabled) {
      Get.toNamed(pageName);
    }
  }
}
