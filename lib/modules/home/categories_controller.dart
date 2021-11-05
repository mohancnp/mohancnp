import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/icons/recommendationicons.dart';
import 'package:metrocoffee/core/constants/product_type.dart';
import 'package:metrocoffee/core/models/category.dart';

class CategoriesController extends GetxController {
  String _activeCategory = ProductType.drinks;

  String get activeCategory => this._activeCategory;
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
            _activeCategory = categoryList[i].name;
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

  List<Category> _categoryList = [
    Category(ProductType.drinks, RecommendationIcons.mostpopular, true),
    Category(ProductType.bakery, RecommendationIcons.bakery, false),
    Category(ProductType.snacks, RecommendationIcons.snacks, false),
  ];
}
