import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/icons/recommendationicons.dart';
import 'package:metrocoffee/models/category.dart';

class CategoriesController extends GetxController {
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
    Category("Drinks", RecommendationIcons.mostpopular, true),
    Category("Snacks", RecommendationIcons.snacks, false),
    Category("Bakery", RecommendationIcons.bakery, false),
  ];
}
