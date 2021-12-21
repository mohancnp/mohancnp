import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:metrocoffee/core/constants/icons/cart_icons.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/home/home_controller.dart';
import 'package:metrocoffee/ui/src/fonts.dart';

class TopHomeGreeting extends StatelessWidget {
  TopHomeGreeting({Key? key}) : super(key: key);
  final controller = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 375.w,
      height: 153.h,
      padding: EdgeInsets.only(
        left: 28.w,
        right: 28.w,
        top: 68.h,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetX<HomeController>(
                builder: (controller) {
                  var user = controller.user;
                  var firstName = "...";
                  firstName =
                      user.name?.split(' ').elementAt(0) ?? "Caffeinator";
                  return Text(
                    int.parse(DateFormat.H('en_US').format(DateTime.now())) <
                            16
                        ? 'Good Afternoon,' + firstName
                        : 'Good Evening,' ' $firstName ',
                    style: TextStyle(
                      fontFamily: CustomFont.montserratBold,
                      color: Colors.white,
                      fontSize: 20.sp,
                    ),
                  );
                },
              ),
              Container(
                  margin: EdgeInsets.only(top: 4.h),
                  child: Text(
                      "You can order drinks for collections or Delivery.",
                      style: Theme.of(context).textTheme.caption)),
            ],
          ),
          GestureDetector(
            onTap: () =>
                HomeController.to.navigateToPageName(PageName.productCartPage),
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
                Obx(
                  () {
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
                              decoration: const BoxDecoration(
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
                              duration: const Duration(milliseconds: 500),
                            )
                          : const SizedBox(),
                    );
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
