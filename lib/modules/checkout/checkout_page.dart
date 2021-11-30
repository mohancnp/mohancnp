import 'package:day_night_time_picker/lib/daynight_timepicker.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/company_detail.dart';
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
import 'package:time_picker_widget/time_picker_widget.dart';

// ignore: must_be_immutable
class CheckoutPage extends StatelessWidget {
  CheckoutPage({Key? key}) : super(key: key);
  final uop = Get.arguments;
  String? selectedTime;

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
                      (uop == UserOrderPreference.pickup)
                          ? "Pickup Location"
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
              (uop == UserOrderPreference.pickup)
                  ? Padding(
                      padding: EdgeInsets.symmetric(
                        horizontal: 28.w,
                      ),
                      child: AddressDetailWidget(
                        mainLocation: CompanyDetail.mainLocation,
                        subLocation: CompanyDetail.subLocation,
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
                                        initialLong: admodel.mapLocation.long,
                                      ));
                                },
                              ),
                            );
                          });
                    }),
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
              Obx(() {
                return GestureDetector(
                  onTap: () {
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
                            (time.minute % 15 == 0)).then((time) {
                      if (time != null) {
                        if (time.hour > _currentTime.hour) {
                          controller.selectedTimeFrame.value =
                              "${time.hour}:${time.minute}";
                        } else {
                          if ((time.minute - _currentTime.minute) >= 15) {
                            controller.selectedTimeFrame.value =
                                "${time.hour}:${time.minute}";
                          } else {
                            print("reached else");
                            controller.selectedTimeFrame.value =
                                "${_currentTime.hour}:${_currentTime.minute + 15}";
                          }
                        }
                      }
                      // print(time.format(context));
                    });
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
                          Row(
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
              }),
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

  calculateMinutesWithRemainder(int remainder, currentTime) {
    var newValue = (15 - remainder) + currentTime.minute;

    if (remainder != 0) {
      if (newValue == 60) {
        return 00;
      }
    }
    return newValue;
  }

  calculateHoursWithRemainder(int remainder, TimeOfDay currentTime) {
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
            SizedBox(
              height: 16,
            ),
            Icon(
              Icons.warning,
              color: Colors.amber,
              size: 56,
            ),
            SizedBox(
              height: 12,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                message,
                textAlign: TextAlign.center,
                style: TextStyle(
                    color: Color(0xFF231F20),
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            InkWell(
              onTap: () => Navigator.of(context).pop(),
              child: Container(
                alignment: Alignment.center,
                width: double.infinity,
                padding: EdgeInsets.symmetric(vertical: 16),
                decoration: BoxDecoration(
                    border: Border(top: BorderSide(color: Color(0xFFE8ECF3)))),
                child: Text(
                  'Cerrar',
                  style: TextStyle(
                      color: Color(0xFF2058CA),
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      );
    });
