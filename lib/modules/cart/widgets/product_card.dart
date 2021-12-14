import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/models/cart_instance.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ProductCard extends StatelessWidget {
  final CartInstance cartModel;
  final int index;
  ProductCard({Key? key, required this.cartModel, required this.index})
      : super(key: key);

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 100.h,
      padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 6.h),
      margin: EdgeInsets.only(bottom: 20.h),
      decoration: BoxDecoration(
          color: Color(0xffFBFBFB),
          borderRadius: BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 3),
                blurRadius: 10)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 100.h,
                  width: 100.h,
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Colors.transparent,
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  child: Image.network(
                    "${AppConfig.baseUrl}${cartModel.imageUri}",
                    fit: BoxFit.cover,
                    loadingBuilder: (context, widget, imageProgress) {
                      if (imageProgress == null) {
                        return widget;
                      } else
                        return SpinKitRing(
                          color: Palette.coffeeColor,
                          size: 20.w,
                        );
                    },
                    errorBuilder: (context, object, stackTrace) {
                      // print(
                      //     "${AppConfig.baseUrl}${AppConfig.productImagePath}${cartModel.imageUri}");
                      return Center(
                        child: Image.asset(
                          AppConfig.metroCoffeeLogoAssetPath,
                        ),
                      );
                    },
                  ),
                ),
                Container(
                  height: 76.h,
                  margin: EdgeInsets.only(left: 18.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${cartModel.name}",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff404D4D),
                            fontSize: 14.sp)),
                      ),
                      Text(
                        '${Currency.symbol} ${(cartModel.totalPrice * cartModel.qty).toStringAsPrecision(3)}',
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff550E1C),
                            fontSize: 14.sp)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async => cartController.decreaseItemQty(
                                cartModel, index),
                            child: Icon(
                              CupertinoIcons.minus_circle,
                              size: 24.r,
                              color: Colors.black54,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 6.w),
                            child: Text(
                              "${cartModel.qty}",
                              style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 14.sp,
                                  color: Colors.black54)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async => cartController.increaseItemQty(
                                cartModel, index),
                            child: Icon(
                              CupertinoIcons.plus_circle,
                              size: 24.r,
                              color: Colors.black54,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
              onTap: () {
                showDialog(
                    context: context,
                    builder: (_) {
                      return ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(18.r)),
                          child: SimpleDialog(
                              shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18.r)),
                              ),
                              children: []));
                    });
              },
              child: GestureDetector(
                onTap: () async => cartController.removeItemFromCart(
                    cartModel.productId, index),
                child: Icon(
                  CupertinoIcons.xmark_circle,
                  size: 18.sp,
                  color: Colors.redAccent,
                ),
              ))
        ],
      ),
    );
  }
}
