import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/enums/user_order_preference.dart';
import 'package:metrocoffee/core/models/cart_model.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/checkout/widgets/single_order.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/modules/checkout/widgets/timer_widget.dart';
import 'package:metrocoffee/modules/maps/new/google_map_controller.dart';
import 'package:metrocoffee/modules/maps/new/google_map_page.dart';
import 'package:metrocoffee/modules/maps/new/widgets/map_widgets.dart';
import 'package:metrocoffee/modules/shareables/userpreference.dart';
import 'package:metrocoffee/modules/shareables/widgets/finalpricecalculationcard.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/custom_button.dart';
import 'checkout_page_controller.dart';

class CheckoutPage extends StatelessWidget {
  const CheckoutPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CheckoutPageController>();
    final uop = Get.arguments;
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
                      (uop == UserOrderPreference.pickup)
                          ? "Our Station"
                          : "Delivery Location",
                      style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Palette.textColor,
                        //       fontSize: 14.5
                        fontSize: 14.sp,
                      )),
                    ),
                    uop == UserOrderPreference.pickup
                        ? SizedBox()
                        : GestureDetector(
                            onTap: () {
                              Get.to(() => GoogleMapPage());
                            },
                            child: Padding(
                              padding: EdgeInsets.only(right: 28.w),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.add_circle,
                                    size: 12.r,
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 4.w),
                                    child: Text("Add",
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
              (uop == UserOrderPreference.delivery)
                  ? GetX<CustomGoogleMapController>(
                    init: CustomGoogleMapController(),                    
                    builder:(controller) {
                      return ListView.builder(
                          itemCount: controller.userAddresses.length,
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.symmetric(
                            horizontal: 28.w,
                          ),
                          itemBuilder: (context, index) {
                            var admodel = controller.userAddresses[index];
                            var selectedIndex =
                                controller.selectedAddressIndex;
                                print(selectedIndex);
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: AddressDetailWidget(
                                mainLocation: admodel.title,
                                subLocation: admodel.subtitle,
                                selectedLocationBorderColor:
                                    index == selectedIndex
                                        ? Palette.coffeeColor
                                        : Colors.white,
                                onItemSelected: () {
                                  controller.selectedAddressIndex = index;
                                },
                                onDelete: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(8.r)),
                                          child: SimpleDialog(
                                              contentPadding: EdgeInsets.all(0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(18.r),
                                                ),
                                              ),
                                              children: [
                                                UserPreference(
                                                  question:
                                                      "Really Want to Remove Address?",
                                                  onPressedFirst: () {
                                                    controller.userAddresses
                                                        .removeAt(index);
                                                    Get.back();
                                                  },
                                                  firstText: "SURE",
                                                  onPressedSecond: () {
                                                    Get.back();
                                                  },
                                                  secondText: "CANCEL",
                                                ),
                                              ]),
                                        );
                                      });
                                },
                                onEdit: () {
                                  Get.to(() => GoogleMapPage(
                                      initialLat: admodel.mapLocation.lat,
                                      initialLong: admodel.mapLocation.long));
                                },
                              ),
                            );
                          });
                    })
                  : Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 28.w,
                      ),
                      child: AddressDetailWidget(
                        mainLocation: "Gants Hill Station, Crabrook Rd Shop",
                        subLocation:
                            "next to Oyster Top up machine, Ilford IG2 6UD, United Kingdom",
                        uop: UserOrderPreference.pickup,
                        selectedLocationBorderColor: Colors.white,
                        onEdit: () {},
                        onDelete: () {},
                        onItemSelected: () {},
                      ),
                    ),
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
