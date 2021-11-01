import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';
import 'package:metrocoffee/core/enums/producttype.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/screens/base/product_list.dart';
import 'package:metrocoffee/screens/contents/homecontent/categories.dart';
import 'package:metrocoffee/screens/contents/homecontent/searchbar.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/bakery.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/drinks.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/snacks.dart';
import 'package:metrocoffee/screens/contents/homecontent/tophomegreeting.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  final HomeTabController homeTabController = Get.find<HomeTabController>();
  // final categoriesController = Get.lazyPut(() => CategoriesController());
  @override
  Widget build(BuildContext context) {
    // SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    //   statusBarColor: coffeecolor,
    // ));

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;
    return GetBuilder<HomeTabController>(
        init: HomeTabController(),
        builder: (hometabcontroller) {
          return Stack(
            children: [
              Scaffold(
                  backgroundColor: Color(0xFFF3F5F5),
                  body: SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      child: Stack(children: [
                        Container(
                          height: 153.h,
                          width: screenheight,
                          color: coffeecolor,
                          // clipBehavior: Clip.none,

                          // child: Image.asset(
                          //   "assets/images/homebg.png",
                          //   width: screenheight,
                          //   color: Color(0xff550E1C),
                          //   fit: BoxFit.cover,
                          // ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TopHomeGreeting(),
                            SearchBar(),
                            CategoriesTabs(),
                            SizedBox(height: 17.h),
                            ProductList(
                              productType: ProductTypeEnum.drinks,
                            ),
                            Padding(
                              padding: EdgeInsets.only(
                                  left: 27.w, top: 23.h, bottom: 16.h),
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
                                  left: 27.w, top: 23.h, bottom: 16.h),
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

                            // AnimatedSwitcher(
                            //     duration: Duration(milliseconds: 250),
                            //     child: getPageForTabAtIndex(
                            //         hometabcontroller.currentpageindex))
                          ],
                        ),
                      ])))
            ],
          );
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
