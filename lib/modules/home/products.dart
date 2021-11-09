import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/product_type.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/modules/home/widgets/categories_controller.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'widgets/product_list.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);
  final controller = Get.find<HomeTabController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CategoriesController>(builder: (categoryController) {
      var pList = [];
      var mpList = [];
      var rcList = [];
      var activeCategory = categoryController.activeCategory;
      // print(activeCategory);
      if (activeCategory == ProductType.bakery) {
        pList = controller.allBakery;
        mpList = controller.mostPopularBakery;
        rcList = controller.recommendedBakery;
      } else if (activeCategory == ProductType.drinks) {
        pList = controller.allDrinks;
        // print(controller.allDrinks);
        mpList = controller.mostPopularDrinks;
        rcList = controller.recommendedDrinks;
      } else {
        pList = controller.allSnacks;
        mpList = controller.mostPopularSnacks;
        rcList = controller.recommendedSnacks;
      }
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ProductList(
            products: pList,
            tag: "pList",
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.w, top: 23.h, bottom: 16.h),
            child: Text(
              "Most Popular",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Color(0xFF344141)),
            ),
          ),
          ProductList(
            products: mpList,
            tag: "mpList",
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.w, top: 23.h, bottom: 16.h),
            child: Text(
              "Recommended",
              style: TextStyle(
                  fontWeight: FontWeight.w500, color: Color(0xFF344141)),
            ),
          ),
          ProductList(
            products: rcList,
            tag: "rcList",
          ),
        ],
      );
    });
  }
}
