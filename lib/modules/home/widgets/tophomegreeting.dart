import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:metrocoffee/core/constants/icons/carticons.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TopHomeGreeting extends StatelessWidget {
  TopHomeGreeting({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
        width: screenwidth,
        // clipBehavior: Clip.none,
        padding: EdgeInsets.only(
//         horizontal: 24,vertical: 24
            left: 28.w,
            right: 28.w,
            //     top:35,
            top: 68.h),
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    GetX<HomeTabController>(builder: (controller) {
                      var user = controller.user;
                      var firstName = "...";
                      firstName = user.name?.split(' ').elementAt(0) ?? "...";
                      return Container(
                          child: Text(
                        int.parse(DateFormat.H('en_US')
                                    .format(DateTime.now())) <
                                16
                            ? 'Good Afternoon,' + '$firstName'
                            : 'Good Evening,' + ' $firstName ',
                        style: TextStyle(
                            fontFamily: montserratsemibold,
                            color: Colors.white,
                            //     fontSize: 20.5
                            fontSize: screenwidth * 0.0498),
                      ));
                    }),
                    Container(
                        margin: EdgeInsets.only(
                            //        top: 3
                            top: 4.h),
                        child: Text(
                          "You can order drinks for collections or Delivery.",
                          style: TextStyle(
                              fontFamily: poppinslight,
                              color: Color(0xF3F3F3D6),
                              //          fontSize: 11.5
                              fontSize: screenwidth * 0.0279),
                        )),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Get.toNamed(PageName.productCartPage);
                },
                child: Stack(
                  children: [
                    Padding(
                      padding: EdgeInsets.only(right: 10.w),
                      child: SvgPicture.asset(
                        cartIcons,
                        width: 20.w,
                        height: 20.w,
                        color: Colors.white,
                      ),
                    ),
                    Obx(() {
                      int count = controller.cartCount.value;
                      return Positioned(
                        left: 10.w,
                        child: count > 0
                            ? AnimatedContainer(
                                height: 12.w,
                                width: 12.w,
                                alignment: Alignment.center,
                                child: Text("$count",
                                    style: TextStyle(fontSize: 8.sp)),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    boxShadow: [
                                      BoxShadow(
                                        offset: Offset(1, 1),
                                        color: Colors.black12,
                                      ),
                                      BoxShadow(
                                        offset: Offset(-1, -1),
                                        color: Colors.black12,
                                      )
                                    ],
                                    shape: BoxShape.circle),
                                duration: Duration(milliseconds: 500),
                              )
                            : SizedBox(),
                      );
                    }),
                  ],
                ),

                // SvgPicture.asset(
                //   cartIcons,
                //   width: 20.w,
                //   height: 20.w,
                //   color: Colors.white,
                // ),
              )
            ]));
  }
}
