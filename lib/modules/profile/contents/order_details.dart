import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/app_message.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/profile/contents/order_details_controller.dart';
import 'package:metrocoffee/modules/profile/widgets/time_frame_order_details.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/utility_info_widget.dart';
import '../../../core/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetails extends StatelessWidget {
  OrderDetails({Key? key}) : super(key: key);
  final controller = Get.put(OrderDetailsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrderDetailsController>(
      builder: (controller) {
        return Scaffold(
          backgroundColor: Palette.pagebackgroundcolor,
          body: SizedBox(
            width: 375.w,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppBar(
                  title: Text(
                    "ORDER DETAILS",
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      color: darkgrey,
                      fontSize: 16.sp,
                    ),
                  ),
                  centerTitle: true,
                  leading: IconButton(
                    onPressed: Get.back,
                    icon: Icon(
                      CupertinoIcons.back,
                      color: darkgrey,
                      size: 24.r,
                    ),
                  ),
                  backgroundColor: Colors.transparent,
                  elevation: 0,
                ),
                Container(
                  margin: EdgeInsets.only(
                    left: 20.w,
                    right: 20.w,
                    top: 24.h,
                    bottom: 16.h,
                  ),
                  width: 375.w,
                  height: 1,
                  decoration: BoxDecoration(
                    color: Palette.pagebackgroundcolor.withOpacity(0.4),
                  ),
                ),
                controller.dataState == DataState.passive
                    ? const SizedBox()
                    : (controller.dataState == DataState.loading)
                        ? SpinKitCircle(
                            color: coffeecolor,
                          )
                        : (controller.dataState == DataState.error)
                            ? UtilityInfoWidget(
                                title: "Oops!",
                                content: AppMessage.somethingWentWrong,
                                onPressed: Get.back,
                                svgImageUri: UtilityIcons.somethingWrong,
                                buttonText: "Go Back",
                              )
                            : (controller.dataState == DataState.authError)
                                ? Container(
                                    width: 375.w,
                                    height: 500.h,
                                    alignment: Alignment.center,
                                    child: UtilityInfoWidget(
                                      title:
                                          " Your Order Couldn't be retreived",
                                      content:
                                          "Please log back in, and try again!!",
                                      onPressed: () =>
                                          Get.toNamed(PageName.loginpage),
                                      svgImageUri: UtilityIcons.noResults,
                                      buttonText: "Login",
                                    ),
                                  )
                                : ListView.builder(
                                    itemCount: 1,
                                    scrollDirection: Axis.vertical,
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    itemBuilder: (context, index) {
                                      //TODO: implement  order items here.

                                      return const Center(
                                          child: Text("Single Item here"));
                                    },
                                  )
              ],
            ),
          ),
        );
      },
    );
  }
}
