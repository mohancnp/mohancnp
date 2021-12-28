import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/payment/order_receipt_controller.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/custom_button.dart';
import 'widgets/order_item_detail.dart';
import 'widgets/order_receipt_banner.dart';

class OrderReceiptPage extends StatelessWidget {
  OrderReceiptPage({Key? key}) : super(key: key);
  final controller = Get.put(OrderReceiptController());
  final cartController = Get.find<CartController>();
  @override
  Widget build(BuildContext context) {
    const dimText = Color(0xDE000000);
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "ORDER RECEIPT",
          style: TextStyle(
            color: Palette.darkGery,
            fontFamily: CustomFont.poppinsMedium,
            fontSize: 16.sp,
          ),
        ),
        backgroundColor: Palette.pagebackgroundcolor,
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      floatingActionButton: Padding(
        padding: EdgeInsets.symmetric(horizontal: 28.w),
        child: CustomReusableBtn(
          buttonText: 'Back to home',
          width: 375.w,
          height: 46.h,
          onPressed: controller.clearCartAndNavigateToHome,
        ),
      ),
      body: Column(
        children: [
          const CustomBanner(orderId: 1),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 28.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Thanks For Your Order",
                  style: TextStyle(
                    color: Palette.coffeeColor,
                    fontSize: 16.sp,
                    fontFamily: CustomFont.poppinsSemiBold,
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                  "Date: 01-02-2021",
                  style: TextStyle(
                    color: dimText,
                    fontSize: 12.sp,
                    fontFamily: CustomFont.poppinsLight,
                  ),
                ),
                SizedBox(
                  width: 375.w,
                  child: ListView.builder(
                    itemCount: cartController.cartProductList.length,
                    padding: EdgeInsets.symmetric(vertical: 8.h),
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final item = cartController.cartProductList[index];
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 16.h),
                        child: ItemDetail(cartInstance: item),
                      );
                    },
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Billing Address",
                      style: TextStyle(
                        color: Palette.coffeeColor,
                        fontSize: 12.sp,
                        fontFamily: CustomFont.poppinsRegular,
                      ),
                    ),
                    Text(
                      "Total",
                      style: TextStyle(
                        color: Palette.coffeeColor,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: CustomFont.poppinsRegular,
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.location_on,
                          size: 14.r,
                          color: Palette.darkGery,
                        ),
                        Text(
                          "2. Saint Street. st",
                          style: TextStyle(
                            color: Palette.darkGery,
                            fontSize: 12.sp,
                            fontFamily: CustomFont.poppinsRegular,
                            decoration: TextDecoration.underline,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "\$ ${cartController.totalAmount}",
                      style: TextStyle(
                        color: Palette.coffeeColor,
                        fontSize: 20.sp,
                        fontFamily: CustomFont.poppinsSemiBold,
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
