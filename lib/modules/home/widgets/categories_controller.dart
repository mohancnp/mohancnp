import 'package:get/get.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/category.dart';
import 'package:metrocoffee/core/services/product_service/product_service.dart';

class CategoriesController extends GetxController
    with StateMixin<List<Category>> {
  static CategoriesController get to => Get.find();
  List<Category> _categoryList = <Category>[];
  var _productService = locator.get<ProductService>();
  List<Category> get categoryList {
    return _categoryList;
  }

  set setActiveCategory(int index) {
    for (int i = 0; i < categoryList.length; i++) {
      if (i == index) {
        var status = categoryList[i].selected;
        if (status != null) {
          if (status = true) {
            categoryList[i].selected = status;
            // _activeCategory = categoryList[i].name;
          } else {
            categoryList[i].selected = !status;
          }
        }
      } else {
        categoryList[i].selected = false;
      }
    }
    update();
  }

  getCategories() async {
    change(null, status: RxStatus.loading());
    var categories = await _productService.getCatoriesList();
    unfoldData(categories);
  }

  unfoldData(categories) {
    categories.fold((l) {
      _categoryList = l;
      setDefaultCategory();
      change(_categoryList, status: RxStatus.success());
      if (l.length < 1) {
        change(l, status: RxStatus.empty());
      }
    }, (r) {
      change(null, status: RxStatus.error(r.message));
    });
  }


  setDefaultCategory() {
    for (var i = 0; i < _categoryList.length; i++) {
      var element = _categoryList[i];
      if (i == 0) {
        element.selected = true;
      } else {
        element.selected = false;
      }
    }
  }
}
