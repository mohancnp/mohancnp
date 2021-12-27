import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/payment/payment_page_controller.dart';
import 'package:metrocoffee/modules/payment/widgets/credit_card_box.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import 'widgets/payment_options.dart';

class PaymentPage extends StatelessWidget {
  PaymentPage({Key? key}) : super(key: key);
  final cartController = Get.find<CartController>();
  final paymentController = Get.put(PaymentPageController());
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      bottomNavigationBar: Material(
        color: Colors.white,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Obx(
              () {
                return Text(
                  "${Currency.symbol} ${cartController.totalAmount.toStringAsPrecision(3)}",
                  style: TextStyle(
                    color: Palette.textColor,
                    fontSize: 26.sp,
                    fontWeight: FontWeight.w500,
                  ),
                );
              },
            ),
            Container(
              height: 57.h,
              width: 150.w,
              margin: EdgeInsets.only(top: 10.h, bottom: 10.h),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.r),
                color: Palette.coffeeColor,
              ),
              child: TextButton(
                onPressed: paymentController.confirmPaymentAndPlaceOrder,
                child: Text(
                  "Confirm Payment",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w300,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Container(
          padding: const EdgeInsets.only(bottom: 75),
          width: 375.w,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: Colors.transparent,
                elevation: 0,
                centerTitle: true,
                leading: IconButton(
                  onPressed: Get.back,
                  icon: Icon(
                    CupertinoIcons.back,
                    size: 28.w,
                    color: Palette.darkGery,
                  ),
                ),
                title: Text(
                  "PAYMENT",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Palette.darkGery,
                    fontSize: 17.sp,
                  ),
                ),
              ),
              CreditCardBox(),
              const PaymentOptions(),
              Container(
                width: screenwidth,
                padding: EdgeInsets.symmetric(
                  horizontal: screenwidth * 0.05352,
                ),
                margin: EdgeInsets.only(
                  top: screenwidth * 0.0535,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      margin: EdgeInsets.only(left: screenwidth * 0.02676),
                      child: Text(
                        "Send receipt to your email",
                        style: TextStyle(
                          color: Palette.pagebackgroundcolor,
                          fontSize: screenwidth * 0.0328,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {},
                      child: AnimatedContainer(
                        padding: EdgeInsets.symmetric(
                          horizontal: screenwidth * 0.00729,
                        ),
                        height: screenwidth * 0.0656,
                        width: screenwidth * 0.126,
                        duration: const Duration(milliseconds: 175),
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(
                            Radius.circular(40),
                          ),
                          color: Palette.coffeeColor,
                          border: Border.all(
                            color: Palette.darkGery,
                            width: 1.2,
                          ),
                        ),
                        alignment: Alignment.centerLeft,
                        child: AnimatedContainer(
                          duration: const Duration(milliseconds: 175),
                          height: screenwidth * 0.0486,
                          width: screenwidth * 0.0486,
                          decoration: const BoxDecoration(
                            shape: BoxShape.circle,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
