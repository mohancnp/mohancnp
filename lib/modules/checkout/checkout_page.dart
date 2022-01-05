import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/company_detail.dart';
import 'package:metrocoffee/core/enums/user_order_preference.dart';
import 'package:metrocoffee/core/models/cart_instance.dart';
import 'package:metrocoffee/core/models/shipping_address.dart';
import 'package:metrocoffee/modules/auth/custom/widgets/error_display.dart';
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
  final mapController = Get.put(CustomGoogleMapController());
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: CustomReusableBtn(
        buttonText: "Proceed to Pay",
        width: 320.w,
        height: 48.h,
        onPressed: controller.navigateToPaymentOrLogin,
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
                itemCount: cartController.cartProductList.length,
                shrinkWrap: true,
                primary: false,
                itemBuilder: (context, index) {
                  CartInstance cartModel =
                      cartController.cartProductList[index];
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
                  : GetX<CheckoutPageController>(
                      builder: (controller) {
                        return controller.addresssisLoading.isTrue
                            ? const Center(
                                child: SizedBox(
                                  child: Text("Loading..."),
                                ),
                              )
                            : ListView.builder(
                                itemCount: controller.shippingAddresses.length,
                                shrinkWrap: true,
                                primary: false,
                                padding: EdgeInsets.symmetric(
                                  horizontal: 28.w,
                                ),
                                itemBuilder: (context, index) {
                                  final ShippingAddress admodel =
                                      controller.shippingAddresses[index];
                                  return Padding(
                                    padding: EdgeInsets.only(top: 8.w),
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
                                                children: [
                                                  UserPreference(
                                                    question: "Remove Address?",
                                                    onPressedFirst: () async {
                                                      await controller
                                                          .deleteAddress(
                                                              admodel.id,
                                                              index);
                                                      Get.back();
                                                    },
                                                    firstText: "Confirm",
                                                    onPressedSecond: () {
                                                      Get.back();
                                                    },
                                                    secondText: "CANCEL",
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      onEdit: () {
                                        Get.to(
                                          () => GoogleMapPage(
                                            initialLat: admodel.lattitude,
                                            initialLong: admodel.longitude,
                                            indexToUpdate: index,
                                            idToUpdate: admodel.id,
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
                    onTap: () async {
                      final _currentTime = TimeOfDay.now();
                      final userSelectedTime = await showCustomTimePicker(
                        context: context,
                        builder: (context, child) {
                          return MediaQuery(
                            data: MediaQuery.of(context)
                                .copyWith(alwaysUse24HourFormat: true),
                            child: child!,
                          );
                        },
                        initialTime: TimeOfDay(
                          hour: controller.getHour(
                              _currentTime.hour, _currentTime.minute),
                          minute: controller.getMinute(_currentTime.minute),
                        ),
                        onFailValidation: (context) {
                          controller.wrongTimeSelectionMessage.value =
                              "Selected Time must be above ${controller.timeInterval.minDeliveryTime} min from current time";
                        },
                        selectableTimePredicate:
                            controller.handleServerTimeLogic,
                      );
                      controller.handleTimePickerResponse(
                          selectedTime: userSelectedTime);
                      controller.userSelectedTimeOfDay = userSelectedTime;
                      controller.formattedTimeStamp =
                          userSelectedTime?.format(context);
                    },
                    child: Container(
                      height: 64.h,
                      margin: EdgeInsets.symmetric(
                        horizontal: 28.w,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(9),
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.05),
                            offset: const Offset(0, 4),
                            blurRadius: 12,
                          )
                        ],
                      ),
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
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
              Obx(
                () => controller.wrongTimeSelectionMessage.isNotEmpty
                    ? Padding(
                        padding: EdgeInsets.symmetric(horizontal: 28.w),
                        child: CustomErrorWidget(
                          message: controller.wrongTimeSelectionMessage.value,
                          textColor: Colors.black54,
                        ),
                      )
                    : const SizedBox(),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  vertical: 16.h,
                ),
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
            ],
          ),
        ),
      ),
    );
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
                    border: Border(
                      top: BorderSide(
                        color: Color(0xFFE8ECF3),
                      ),
                    ),
                  ),
                  child: const Text(
                    'Cerrar',
                    style: TextStyle(
                      color: Color(0xFF231F20),
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
