import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/currency.dart';
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
          color: const Color(0xffFBFBFB),
          borderRadius: const BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: const Offset(0, 4),
                blurRadius: 10)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                height: 100.h,
                width: 100.h,
                clipBehavior: Clip.hardEdge,
                decoration: const BoxDecoration(
                  color: Colors.transparent,
                  borderRadius: BorderRadius.all(Radius.circular(9)),
                ),
                child: Image.network(
                  "${AppConfig.webBaseUrl}/${cartModel.imageUri}",
                  fit: BoxFit.cover,
                  loadingBuilder: (context, widget, imageProgress) {
                    if (imageProgress == null) {
                      return widget;
                    } else {
                      return SpinKitRing(
                        color: Palette.coffeeColor,
                        size: 20.w,
                      );
                    }
                  },
                  errorBuilder: (context, object, stackTrace) {
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
                margin: EdgeInsets.only(left: 16.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      cartModel.name,
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Palette.darkGery,
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      '${Currency.symbol} ${(cartModel.totalPrice * cartModel.qty).toPrecision(3)}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff550E1C),
                        fontSize: 14.sp,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        GestureDetector(
                          onTap: () async =>
                              cartController.decreaseItemQty(cartModel, index),
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
                            style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 14.sp,
                              color: Colors.black54,
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () async =>
                              cartController.increaseItemQty(cartModel, index),
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
          GestureDetector(
            onTap: () {
              showDialog(
                context: context,
                builder: (_) {
                  return ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(16.r)),
                    child: SimpleDialog(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(
                          Radius.circular(16.r),
                        ),
                      ),
                      children: const [],
                    ),
                  );
                },
              );
            },
            child: GestureDetector(
              onTap: () async =>
                  cartController.removeItemFromCart(cartModel.productId, index),
              child: Icon(
                CupertinoIcons.xmark_circle,
                size: 16.sp,
                color: Colors.redAccent,
              ),
            ),
          )
        ],
      ),
    );
  }
}
