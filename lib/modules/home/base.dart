import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/modules/home/home.dart';
import 'package:metrocoffee/modules/notifications/notifications.dart';
import 'package:metrocoffee/modules/product_search/search_page_controller.dart';
import 'package:metrocoffee/modules/profile/contents/my_order.dart';
import 'package:metrocoffee/modules/profile/profile_page.dart';
import 'package:metrocoffee/modules/public/redirection_page.dart';
import 'package:metrocoffee/modules/shareables/dialogs/loading.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import 'home_controller.dart';
import 'widgets/categories_controller.dart';

// ignore: must_be_immutable
class Base extends StatelessWidget {
  final baseController = Get.put(BaseController());
  final controllerCategories = Get.put(CategoriesController());
  final controllerHome = Get.put(HomeController());
  final controllerSearh = Get.put(SearchPageController());
  final cartController = Get.put(CartController());

  List privatePages = [
    Home(),
    Notifications(),
    MyOrderPage(),
    ProfilePage(),
  ];
  List publicPages = [
    Home(),
    RedirectionPage(),
    RedirectionPage(),
    RedirectionPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return GetBuilder<BaseController>(
      init: BaseController(),
      builder: (basecontroller) {
        var status = basecontroller.userVerificationStatus;
        return (status == UserVerficationStatus.unverified)
            ? LoadingPage()
            : Scaffold(
                body: getPages(status, basecontroller.currentIndex),
                bottomNavigationBar: Container(
                  decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, -6),
                          color: Color(0x0D000000),
                          blurRadius: 25)
                    ],
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                  ),
                  child: BottomNavigationBar(
                    iconSize: 24.r,
                    showSelectedLabels: false,
                    showUnselectedLabels: false,
                    type: BottomNavigationBarType.fixed,
                    currentIndex: basecontroller.currentIndex,
                    onTap: (index) {
                      basecontroller.setindex(index);
                    },
                    backgroundColor: Colors.transparent,
                    elevation: 0,
                    selectedItemColor: Palette.selectedBottomNavIconColor,
                    unselectedItemColor: Colors.black38,
                    items: [
                      BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          "assets/images/bottomnav/home-icon-silhouette.svg",
                          width: 20.w,
                          height: 20.h,
                          color: Palette.selectedBottomNavIconColor,
                        ),
                        backgroundColor: Colors.transparent,
                        label: "",
                        icon: SvgPicture.asset(
                          "assets/images/bottomnav/home-icon-silhouette.svg",
                          width: 20.w,
                          height: 20.h,
                          color: Colors.black38,
                        ),
                      ),
                      BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          "assets/images/bottomnav/bell.svg",
                          width: 20.w,
                          height: 20.h,
                          color: Palette.selectedBottomNavIconColor,
                        ),
                        label: "",
                        backgroundColor: Colors.transparent,
                        icon: SvgPicture.asset(
                          "assets/images/bottomnav/bell.svg",
                          width: 20.w,
                          height: 20.h,
                          color: Colors.black38,
                        ),
                      ),
                      BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          "assets/images/bottomnav/order_history.svg",
                          width: 20.w,
                          height: 20.h,
                          color: Palette.selectedBottomNavIconColor,
                        ),
                        label: "",
                        backgroundColor: Colors.transparent,
                        icon: SvgPicture.asset(
                          "assets/images/bottomnav/order_history.svg",
                          width: 20.w,
                          height: 20.h,
                          color: Colors.black38,
                        ),
                      ),
                      BottomNavigationBarItem(
                        activeIcon: SvgPicture.asset(
                          "assets/images/user.svg",
                          width: 20.w,
                          height: 20.h,
                          color: Palette.selectedBottomNavIconColor,
                        ),
                        label: "",
                        backgroundColor: Colors.transparent,
                        icon: SvgPicture.asset(
                          "assets/images/bottomnav/user.svg",
                          height: 20.h,
                          width: 20.w,
                          color: Colors.black38,
                        ),
                      ),
                    ],
                  ),
                ),
              );
      },
    );
  }

  getPages(UserVerficationStatus st, int index) {
    if (st == UserVerficationStatus.unknown) {
      return publicPages[index];
    } else
      return privatePages[index];
  }
}
