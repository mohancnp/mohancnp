import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/models/cart_model.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/checkout/widgets/location_widget.dart';
import 'package:metrocoffee/modules/checkout/widgets/single_order.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/modules/checkout/widgets/timer_widget.dart';
import 'package:metrocoffee/modules/shareables/widgets/finalpricecalculationcard.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/custom_button.dart';
import 'checkout_page_controller.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutPageController>();

    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomReusableBtn(
        buttonText: "Proceed to Pay",
        width: 320.w,
        height: 47.h,
        onPressed: controller.proceedToPayment,
      ),
      appBar: AppBar(
        backgroundColor: Color(0xFFF3F5F5),
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            Get.back();
          },
          child: Container(
            width: 24.w,
            height: 24.h,
            color: Colors.transparent,
            child: Icon(
              CupertinoIcons.back,
              size: 20.w,
              color: Palette.coffeeColor,
            ),
          ),
        ),
        title: Text(
          "ORDER SUMMARY",
          style: TextStyle(
              fontFamily: poppinsmedium,
              color: Color(0xff404D4D),
              //       fontSize: 16
              fontSize: 16.sp),
        ),
      ),
      body: SingleChildScrollView(
        physics: AlwaysScrollableScrollPhysics(),
        reverse: true,
        clipBehavior: Clip.none,
        child: Container(
          padding: EdgeInsets.only(top: 37.h, bottom: 70.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              GetX<CartController>(builder: (controller) {
                int length = controller.cartProductList?.length ?? 0;

                return length > 0
                    ? ListView.builder(
                        itemCount: length,
                        shrinkWrap: true,
                        primary: false,
                        itemBuilder: (context, index) {
                          CartModel cartModel =
                              controller.cartProductList![index];
                          // print(cartModel.size);
                          return Padding(
                            padding: EdgeInsets.only(bottom: 10.h),
                            child: SingleOrder(
                              cartModel: cartModel,
                            ),
                          );
                        })
                    : SizedBox();
              }),
              Padding(
                padding: EdgeInsets.only(top: 24.h, left: 28.w),
                child: FinalProductCalculationCard(),
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, top: 24.h, bottom: 16.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Delivery Location",
                      style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Palette.textColor,
                        //       fontSize: 14.5
                        fontSize: 14.sp,
                      )),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: Padding(
                        padding: EdgeInsets.only(right: 28.w),
                        child: Row(
                          children: [
                            Icon(
                              FeatherIcons.edit,
                              size: 13.w,
                            ),
                            Padding(
                              padding: EdgeInsets.only(left: 8.w, top: 4.h),
                              child: Text("Edit",
                                  style: getpoppins(TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Palette.textColor,
                                    //       fontSize: 14.5
                                    fontSize: 12.sp,
                                  ))),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              LocationWidget(),
              Padding(
                padding: EdgeInsets.only(left: 28.w, top: 24.h, bottom: 16.h),
                child: Text(
                  "Delivery Time",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Palette.textColor,
                    //       fontSize: 14.5
                    fontSize: 14.sp,
                  )),
                ),
              ),
              Container(
                height: 91.h,
                // padding: EdgeInsets.symmetric(horizontal: 22.w),
                margin: EdgeInsets.symmetric(horizontal: 28.w),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.05),
                          offset: Offset(0, 3),
                          blurRadius: 10)
                    ]),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Obx(() {
                        return GestureDetector(
                          onTap: () {
                            TimeOfDay _time =
                                TimeOfDay.now().replacing(minute: 30);

                            Navigator.of(context).push(showPicker(
                                value: _time,
                                borderRadius: 9,
                                okText: "SET TIME",
                                accentColor: Palette.coffeeColor,
                                onChange: (v) {
                                  controller.selectedTimeFrame.value =
                                      "${v.hour}:${v.minute}";
                                  // print("${v.hour}:${v.minute}");
                                }));
                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                controller.selectedTimeFrame.value,
                              ),
                              Icon(
                                FeatherIcons.clock,
                                size: 16.w,
                              )
                            ],
                          ),
                        );
                      }),
                      Divider(
                        color: Palette.darkGery.withOpacity(0.15),
                        thickness: 1.5,
                      ),
                      Expanded(
                        child: ListView.builder(
                            itemCount: controller.timeValues.length,
                            // clipBehavior: Clip.none,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) {
                              return TimerWidget(
                                  index: index,
                                  onPressed: () {
                                    controller.selectedTimeIndex.value = index;
                                    controller.selectedTimeFrame.value =
                                        controller.timeValues[
                                            controller.selectedTimeIndex.value];
                                  });
                            }),
                      )
                    ],
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Center(
                  child: Text(
                    "View Full Allergy statement",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Palette.coffeeColor,
                        fontSize: 13.sp,
                        decoration: TextDecoration.underline)),
                  ),
                ),
              ),
              // SizedBox(
              //   height: 62.h,
              // )
            ],
          ),
        ),
      ),
    );
  }
}
