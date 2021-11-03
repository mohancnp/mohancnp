import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/core/enums/producttype.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/screens/base/product_list.dart';
import 'package:metrocoffee/screens/contents/homecontent/categories.dart';
import 'package:metrocoffee/screens/contents/homecontent/searchbar.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/bakery.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/drinks.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/snacks.dart';
import 'package:metrocoffee/screens/contents/homecontent/tophomegreeting.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final HomeTabController homeTabController = Get.find<HomeTabController>();
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    return GetBuilder<HomeTabController>(
        init: HomeTabController(),
        builder: (hometabcontroller) {
          return Scaffold(
              backgroundColor: Palette.pagebackgroundcolor,
              body: SingleChildScrollView(
                  physics: AlwaysScrollableScrollPhysics(),
                  child: Stack(children: [
                    Container(
                      height: 153.h,
                      width: screenheight,
                      color: Palette.coffeeColor,
                    ),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TopHomeGreeting(),
                        SearchBar(),
                        CategoriesTabs(),
                        SizedBox(height: 33.h),
                        ProductList(
                          productType: ProductTypeEnum.drinks,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 28.w, top: 23.h, bottom: 16.h),
                          child: Text(
                            "Most Popular",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF344141)),
                          ),
                        ),
                        ProductList(
                          productType: ProductTypeEnum.drinks,
                        ),
                        Padding(
                          padding: EdgeInsets.only(
                              left: 28.w, top: 23.h, bottom: 16.h),
                          child: Text(
                            "Recommended",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFF344141)),
                          ),
                        ),
                        ProductList(
                          productType: ProductTypeEnum.drinks,
                        ),
                      ],
                    ),
                  ])));
        });
  }

  Widget getPageForTabAtIndex(index) {
    switch (index) {
      case 0:
        return DrinksTab();
      case 1:
        return Bakery();
      case 2:
        return Snacks();
      default:
        return DrinksTab();
    }
  }
}
