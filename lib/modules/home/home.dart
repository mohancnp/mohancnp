import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/modules/home/products.dart';
import 'package:metrocoffee/modules/home/widgets/categories.dart';
import 'package:metrocoffee/modules/home/widgets/searchbar.dart';
import 'package:metrocoffee/modules/home/widgets/tophomegreeting.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/bakery.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/drinks.dart';
import 'package:metrocoffee/screens/contents/homecontent/tabs/snacks.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class Home extends StatelessWidget {
  Home({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
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
                  ProductsPage(),
                ],
              ),
            ])));
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
