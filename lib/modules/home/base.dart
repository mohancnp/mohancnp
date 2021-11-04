import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/auth/custom/core_login.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/modules/home/home.dart';
import 'package:metrocoffee/screens/base/order_history.dart';
import 'package:metrocoffee/screens/base/profile.dart';
import 'package:metrocoffee/screens/widgets/dialogs/loading.dart';

class Base extends StatelessWidget {
  List pages = [
    Home(),
    Login(),
    // UtilityInfoWidget(
    //   title: "You Are All Caught Up",
    //   svgImageUri: UtilityIcons.illustrations,
    //   content: "Looks like you do not have any notifications",
    //   buttonText: "Start Browsing",
    // ),
    OrderHistory(),
    Profile()
  ];

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<BaseController>(
        init: BaseController(),
        builder: (basecontroller) {
          return basecontroller.userVerificationStatus ==
                  UserVerficationStatus.verified
              ? Scaffold(
                  body: pages[basecontroller.currentindex],
                  bottomNavigationBar: Container(
                      //  height: 83,
                      height: 83.h,
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
                          )),
                      child: BottomNavigationBar(
                        //         iconSize: 24,
                        iconSize: screenwidth * 0.0583,
                        showSelectedLabels: false,
                        showUnselectedLabels: false,
                        type: BottomNavigationBarType.fixed,
                        currentIndex: basecontroller.currentindex,
                        onTap: (index) {
                          basecontroller.setindex(index);
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
                              width: 20.w,
                              height: 20.h,
                              color: Color(0xff550E1C),
                            ),
                            backgroundColor: Colors.transparent,
                            label: "",
                            icon: SvgPicture.asset(
                              "assets/images/home-icon-silhouette.svg",
                              //                      width: 24,
                              width: 20.w,
                              height: 20.h,
                              color: Colors.black38,
                            ),
                          ),
                          BottomNavigationBarItem(
                            activeIcon: SvgPicture.asset(
                              "assets/images/bell.svg",
                              //                 height: 24,
                              width: 20.w,
                              height: 20.h,
                              color: Color(0xff550E1C),
                            ),
                            label: "",
                            backgroundColor: Colors.transparent,
                            icon: SvgPicture.asset(
                              "assets/images/bell.svg",
                              //                      height: 24,
                              width: 20.w,
                              height: 20.h,
                              color: Colors.black38,
                            ),
                          ),
                          BottomNavigationBarItem(
                            activeIcon: SvgPicture.asset(
                              "assets/images/shopping-cart.svg",
                              //               height: 24,
                              width: 20.w,
                              height: 20.h,
                              color: Color(0xff550E1C),
                            ),
                            label: "",
                            backgroundColor: Colors.transparent,
                            icon: SvgPicture.asset(
                              "assets/images/shopping-cart.svg",
                              //            height: 24,
                              width: 20.w,
                              height: 20.h,
                              color: Colors.black38,
                            ),
                          ),
                          BottomNavigationBarItem(
                            activeIcon: SvgPicture.asset(
                              "assets/images/user.svg",
                              //            height: 24,
                              width: 20.w,
                              height: 20.h,
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
              : LoadingPage();
        });
  }
}
