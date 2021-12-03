import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/modules/home/products.dart';
import 'package:metrocoffee/modules/home/widgets/categories.dart';
import 'package:metrocoffee/modules/home/widgets/searchbar.dart';
import 'package:metrocoffee/modules/home/widgets/tophomegreeting.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'widgets/categories_controller.dart';

class Home extends StatelessWidget {
  final controllerCategories = Get.put(CategoriesController());
  final controllerHome = Get.put(HomeTabController());

  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Palette.pagebackgroundcolor,
        body: Stack(children: [
          Container(
            height: 153.h,
            width: 375.w,
            color: Palette.coffeeColor,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TopHomeGreeting(),
              CategoriesTabs(),
              Expanded(child: ProductsPage()),
            ],
          ),
          Positioned(
            top: 135.h,
            left: 28.w,
            right: 28.w,
            child: SearchBar(),
          ),
        ]));
  }
}
