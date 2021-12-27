import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/models/cart_instance.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/payment/order_receipt_controller.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/custom_button.dart';

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

class ItemDetail extends StatelessWidget {
  final CartInstance cartInstance;
  const ItemDetail({
    Key? key,
    required this.cartInstance,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const dimText = Color(0xDE000000);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          cartInstance.name,
          style: TextStyle(
            color: Palette.darkGery,
            fontSize: 12.sp,
            fontFamily: CustomFont.poppinsMedium,
          ),
        ),
        Text(
          "${cartInstance.qty} item",
          style: TextStyle(
            color: const Color(0xAB000000),
            fontSize: 12.sp,
            fontFamily: CustomFont.poppinsRegular,
          ),
        ),
        Text(
          "\$ ${cartInstance.totalPrice}",
          style: TextStyle(
            color: dimText,
            fontSize: 12.sp,
            fontFamily: CustomFont.poppinsRegular,
          ),
        ),
      ],
    );
  }
}

class CustomBanner extends StatelessWidget {
  final int orderId;
  const CustomBanner({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.coffeeColor,
      child: SizedBox(
        height: 86.h,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 28.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.white,
                ),
                child: Image.asset(
                  AppConfig.metroCoffeeLogoAssetPath,
                  width: 52.r,
                  height: 52.r,
                ),
              ),
              Text.rich(
                TextSpan(
                  text: "Order ID: ",
                  children: [
                    TextSpan(
                      text: "#5432",
                      style: Theme.of(context).textTheme.bodyText1,
                    ),
                  ],
                  style: Theme.of(context).textTheme.bodyText1,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
