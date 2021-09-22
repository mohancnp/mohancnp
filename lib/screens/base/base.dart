import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/basecontroller.dart';
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/profile/profile_controller.dart';
import 'package:metrocoffee/GetXController/productcontroller/drinkdetailscontroller.dart';
import 'package:metrocoffee/GetXController/productcontroller/productdetailscontroller.dart';
import 'package:metrocoffee/screens/base/home.dart';
import 'package:metrocoffee/screens/base/mycart.dart';
import 'package:metrocoffee/screens/base/notifications.dart';
import 'package:metrocoffee/screens/base/profile.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';

class Base extends StatelessWidget {
  final BaseController baseController = Get.put(BaseController());
  final HomeTabController homeTabController = Get.put(HomeTabController());
  final ProductDetailController productDetailsController =
  Get.put(ProductDetailController());
  final DrinkDetailsController drinkDetailsController =
  Get.put(DrinkDetailsController());
  final profileController = Get.put(ProfileController());
  final cartController=Get.put(CartController());

  List pages = [Home(), Notifications(), MyCart(), Profile()];

  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitDown,
      DeviceOrientation.portraitUp,
    ]);
    double screenwidth = MediaQuery
        .of(context)
        .size
        .width;
    return GetBuilder<BaseController>(
        init: BaseController(),
        initState: (v) {
          verifyToken().then((status) {
            print('verification status: $status');
            if (status == false) {
              Get.offAllNamed('/Login');
              // setUserVerified();
              // Future.delayed(Duration.zero).then((value) => Get.offNamed('/Login'));
            } else {
              v.controller?.setUserVerified();
              homeTabController.setUserName();
              homeTabController.initializeAllData();
            }
          });
        },
        builder: (basecontroller) {
          return basecontroller.userIsVerified
              ? Scaffold(
            backgroundColor: Color(0xffF3F5F5),
            body: pages[basecontroller.currentindex],
            bottomNavigationBar: Container(
              //  height: 83,
                height: screenwidth * 0.2019,
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                          offset: Offset(0, -6),
                          color: Color(0x0000000D),
                          blurRadius: 25)
                    ],
                    color: Colors.white70,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    )),
                child: BottomNavigationBar(
                  //         iconSize: 24,
                  iconSize: screenwidth * 0.0583,
                  showSelectedLabels: false,
                  showUnselectedLabels: false,
                  type: BottomNavigationBarType.fixed,
                  currentIndex: baseController.currentindex,
                  onTap: (index) {
                    baseController.setindex(index);
                  },
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                  selectedItemColor: Color(0xff550E1C),
                  unselectedItemColor: Colors.black38,
                  items: [
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        "assets/images/home-icon-silhouette.svg",
                        //       width: 24,
                        width: screenwidth * 0.0583,
                        color: Color(0xff550E1C),
                      ),
                      backgroundColor: Colors.transparent,
                      label: "",
                      icon: SvgPicture.asset(
                        "assets/images/home-icon-silhouette.svg",
                        //                      width: 24,
                        width: screenwidth * 0.0583,
                        color: Colors.black38,
                      ),
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        "assets/images/bell.svg",
                        //                 height: 24,
                        height: screenwidth * 0.0583,
                        color: Color(0xff550E1C),
                      ),
                      label: "",
                      backgroundColor: Colors.transparent,
                      icon: SvgPicture.asset(
                        "assets/images/bell.svg",
                        //                      height: 24,
                        height: screenwidth * 0.0583,
                        color: Colors.black38,
                      ),
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        "assets/images/shopping-cart.svg",
                        //               height: 24,
                        height: screenwidth * 0.0583,
                        color: Color(0xff550E1C),
                      ),
                      label: "",
                      backgroundColor: Colors.transparent,
                      icon: SvgPicture.asset(
                        "assets/images/shopping-cart.svg",
                        //            height: 24,
                        height: screenwidth * 0.05834,
                        color: Colors.black38,
                      ),
                    ),
                    BottomNavigationBarItem(
                      activeIcon: SvgPicture.asset(
                        "assets/images/user.svg",
                        //            height: 24,
                        height: screenwidth * 0.0583,
                        color: Color(0xff550E1C),
                      ),
                      label: "",
                      backgroundColor: Colors.transparent,
                      icon: SvgPicture.asset(
                        "assets/images/user.svg",
                        //             height: 24,
                        height: screenwidth * 0.0583,
                        color: Colors.black38,
                      ),
                    ),
                  ],
                )),
          )
              : Material(
              child: SizedBox(
                child: Center(
                  child: Text('loading'),
                ),
              ));
        });
  }
}
