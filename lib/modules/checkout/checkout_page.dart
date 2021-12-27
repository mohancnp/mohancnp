import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/company_detail.dart';
import 'package:metrocoffee/core/enums/user_order_preference.dart';
import 'package:metrocoffee/core/models/cart_instance.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/checkout/widgets/single_order.dart';
import 'package:metrocoffee/modules/maps/new/google_map_controller.dart';
import 'package:metrocoffee/modules/maps/new/google_map_page.dart';
import 'package:metrocoffee/modules/maps/new/widgets/map_widgets.dart';
import 'package:metrocoffee/modules/shareables/userpreference.dart';
import 'package:metrocoffee/modules/shareables/widgets/finalpricecalculationcard.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/custom_button.dart';
import 'package:time_picker_widget/time_picker_widget.dart';

import 'checkout_page_controller.dart';

// ignore: must_be_immutable
class CheckoutPage extends StatelessWidget {
  CheckoutPage({Key? key}) : super(key: key);
  final controller = Get.put(CheckoutPageController());
  final cartConroller = Get.put(CartController());
  final mapController = Get.put(CustomGoogleMapController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomReusableBtn(
        buttonText: "Proceed to Pay",
        width: 320.w,
        height: 48.h,
        onPressed: () => controller.navigateToPageName(
          pageName: PageName.paymentspage,
          defaultPageName: PageName.loginpage,
        ),
      ),
      appBar: AppBar(
        backgroundColor: Palette.pagebackgroundcolor,
        elevation: 0,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () => Get.back(),
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
            fontFamily: CustomFont.poppinsMedium,
            color: Palette.darkGery,
            fontSize: 16.sp,
          ),
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        reverse: true,
        clipBehavior: Clip.none,
        child: Container(
          padding: EdgeInsets.only(top: 37.h, bottom: 70.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ListView.builder(
                itemCount: cartConroller.cartProductList.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  CartInstance cartModel = cartConroller.cartProductList[index];
                  return Padding(
                    padding: EdgeInsets.only(bottom: 10.h),
                    child: SingleOrder(
                      cartModel: cartModel,
                    ),
                  );
                },
              ),
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
                      (controller.userPreference == UserOrderPreference.pickup)
                          ? "Pickup Location"
                          : "Delivery Location",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Palette.textColor,
                        fontSize: 14.sp,
                      ),
                    ),
                    controller.userPreference == UserOrderPreference.pickup
                        ? const SizedBox()
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
                                    child: Text(
                                      "Add",
                                      style: TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: Palette.textColor,
                                        fontSize: 12.sp,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                  ],
                ),
              ),
              (controller.userPreference == UserOrderPreference.pickup)
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 28.w,
                      ),
                      child: AddressDetailWidget(
                        mainLocation: CompanyDetail.address,
                        subLocation: CompanyDetail.subAddress,
                        uop: UserOrderPreference.pickup,
                        onEdit: () {},
                        onDelete: () {},
                        onItemSelected: 0,
                      ),
                    )
                  : GetX<CustomGoogleMapController>(
                      // init: CustomGoogleMapController(),
                      builder: (controller) {
                        return ListView.builder(
                          itemCount: controller.userAddresses.length,
                          shrinkWrap: true,
                          primary: false,
                          padding: EdgeInsets.symmetric(
                            horizontal: 28.w,
                          ),
                          itemBuilder: (context, index) {
                            var admodel = controller.userAddresses[index];
                            // print(selectedIndex);
                            return Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: AddressDetailWidget(
                                mainLocation: admodel.title,
                                subLocation: admodel.subtitle,
                                onItemSelected: index,
                                onDelete: () {
                                  showDialog(
                                      context: context,
                                      builder: (_) {
                                        return ClipRRect(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(8.r),
                                          ),
                                          child: SimpleDialog(children: [
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
                                  Get.to(
                                    () => GoogleMapPage(
                                      initialLat: admodel.mapLocation.lat,
                                      initialLong: admodel.mapLocation.long,
                                    ),
                                  );
                                },
                              ),
                            );
                          },
                        );
                      },
                    ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, top: 24.h, bottom: 16.h),
                child: Text(
                  "Delivery Time",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Palette.textColor,
                    fontSize: 14.sp,
                  ),
                ),
              ),
              Obx(
                () {
                  return GestureDetector(
                    onTap: () {
                      //TODO: logic to refactor
                      TimeOfDay _currentTime = TimeOfDay.now();
                      var remainder = _currentTime.minute % 15;
                      showCustomTimePicker(
                          context: context,
                          initialTime: TimeOfDay(
                            hour: calculateHoursWithRemainder(
                                remainder, _currentTime),
                            minute: calculateMinutesWithRemainder(
                                remainder, _currentTime),
                          ),
                          onFailValidation: (context) {
                            showMessage(context, "Shift Unavailbale");
                            // print("unavailable");
                          },
                          selectableTimePredicate: (time) =>
                              (time!.hour >= _currentTime.hour) &&
                              (time.minute % 15 == 0)).then(
                        (time) {
                          if (time != null) {
                            if (time.hour > _currentTime.hour) {
                              controller.selectedTimeFrame.value =
                                  "${time.hour}:${time.minute}";
                            } else {
                              if ((time.minute - _currentTime.minute) >= 15) {
                                controller.selectedTimeFrame.value =
                                    "${time.hour}:${time.minute}";
                              } else {
                                if (_currentTime.minute + 15 > 59) {
                                  controller.selectedTimeFrame.value =
                                      "${_currentTime.hour + 1}:${_currentTime.minute + 15 - 59}";
                                }
                                controller.selectedTimeFrame.value =
                                    "${_currentTime.hour}:${_currentTime.minute + 15}";
                              }
                            }
                          }
                          // print(time.format(context));
                        },
                      );
                      // Navigator.of(context).push(
                      //   showPicker(
                      //       value: _time,
                      //       onChangeDateTime: (value) {},
                      //       borderRadius: 9,
                      //       okText: "SET TIME",
                      //       accentColor: Palette.coffeeColor,
                      //       onChange: (v) {
                      //         controller.selectedTimeFrame.value =
                      //             "${v.hour}:${v.minute}";
                      //         // print("${v.hour}:${v.minute}");
                      //       }),
                      // );
                    },
                    child: Container(
                      height: 64.h,
                      // padding: EdgeInsets.symmetric(horizontal: 22.w),
                      margin: EdgeInsets.symmetric(
                        horizontal: 28.w,
                      ),
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(9)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.05),
                                offset: const Offset(0, 3),
                                blurRadius: 10)
                          ]),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  controller.selectedTimeFrame.value,
                                ),
                                Icon(
                                  Icons.watch,
                                  size: 16.w,
                                )
                              ],
                            ),
                            Divider(
                              color: Palette.darkGery.withOpacity(0.15),
                              thickness: 1.5,
                            ),
                            // Expanded(
                            //   child: ListView.builder(
                            //       itemCount: controller.timeValues.length,
                            //       // clipBehavior: Clip.none,
                            //       scrollDirection: Axis.horizontal,
                            //       itemBuilder: (context, index) {
                            //         return TimerWidget(
                            //             index: index,
                            //             onPressed: () {
                            //               controller.selectedTimeIndex.value =
                            //                   index;
                            //               controller.selectedTimeFrame.value =
                            //                   controller.timeValues[controller
                            //                       .selectedTimeIndex.value];
                            //             });
                            //       }),
                            // )
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Padding(
                padding: EdgeInsets.only(top: 24.h),
                child: Center(
                  child: Text(
                    "View Full Allergy statement",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Palette.coffeeColor,
                      fontSize: 13.sp,
                      decoration: TextDecoration.underline,
                    ),
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

  int calculateMinutesWithRemainder(int remainder, currentTime) {
    int newValue = (15 - remainder) + currentTime.minute as int;
    if (remainder != 0) {
      if (newValue == 60) {
        return 00;
      }
    }
    return newValue;
  }

  int calculateHoursWithRemainder(int remainder, TimeOfDay currentTime) {
    if (remainder != 0) {
      var newValue = (15 - remainder) + currentTime.minute;
      if (newValue == 60) {
        return currentTime.hour + 1;
      }
    }
    return currentTime.hour;
  }
}

showMessage(BuildContext context, String message) => showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const SizedBox(
                height: 16,
              ),
              const Icon(
                Icons.warning,
                color: Colors.amber,
                size: 56,
              ),
              const SizedBox(
                height: 12,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Text(
                  message,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                      color: Color(0xFF231F20),
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
              ),
              const SizedBox(
                height: 12,
              ),
              InkWell(
                onTap: Get.back,
                child: Container(
                  alignment: Alignment.center,
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  decoration: const BoxDecoration(
                      border:
                          Border(top: BorderSide(color: Color(0xFFE8ECF3)))),
                  child: const Text(
                    'Cerrar',
                    style: TextStyle(
                        color: Color(0xFF231F20),
                        fontSize: 20,
                        fontWeight: FontWeight.bold),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
