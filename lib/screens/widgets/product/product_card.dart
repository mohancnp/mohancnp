import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/models/cart_model.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ProductCard extends StatelessWidget {
  final CartModel cartModel;
  final int index;
  ProductCard({Key? key, required this.cartModel, required this.index})
      : super(key: key);

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      height: 100.h,
      padding: EdgeInsets.symmetric(
          //        horizontal: 8,vertical: 6
          horizontal: 8.w,
          vertical: 6.h),
      margin: EdgeInsets.only(
          //     bottom: 20
          bottom: 20.h),
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
                  //     height: 100, width: 100,
                  height: 100.h,
                  width: 100.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  child: Image.network(
                    "$baseUrl${cartModel.imageUri}",
                    // color: Colors.blue,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, widget, imageProgress) {
                      if (imageProgress == null) {
                        return widget;
                      }
                      return Container(
                        width: 116.w,
                        height: 116.h,
                        child: SpinKitCubeGrid(
                          color: Palette.coffeeColor,
                        ),
                      );
                    },
                    height: 116.h,
                    width: 116.w,
                  ),
                ),
                Container(
                  //  height: 76,
                  height: 76.h,
                  margin: EdgeInsets.only(
                      //        left: 18
                      left: 18.w),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${cartModel.name}",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff404D4D),
                            //       fontSize: 14.5
                            fontSize: 14.sp)),
                      ),
                      Text(
                        '\$ ${cartModel.updatedPrice?.toStringAsPrecision(3)}',
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff550E1C),
                            //         fontSize: 14.5
                            fontSize: 14.sp)),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              await cartController.decreaseItemCount(index);
                            },
                            child: Icon(
                              CupertinoIcons.minus_circle,

                              //       size: 20,
                              size: 20.sp,
                              color: Colors.black54,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(
                                //         horizontal: 6
                                horizontal: 6.w),
                            child: Text(
                              "${cartModel.qty}",
                              style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              await cartController.increaseItemCount(index);
                            },
                            child: Icon(
                              CupertinoIcons.plus_circle,
                              //      size: 20,
                              size: 20.w,
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
                              children: [
                                // DeleteOrderDialog()
                                //   OrderSuccesfulDialog()
                                //  CancelOrderDialog()
                                // DeleteOrderDialog()
                              ]));
                    });
              },
              child: GestureDetector(
                onTap: () async {
                  await cartController.removeItemAtIndex(index);
                },
                child: Icon(
                  CupertinoIcons.xmark_circle,
                  //    size: 18,
                  size: 18.sp,
                  color: Colors.redAccent,
                ),
              ))
        ],
      ),
    );
  }
}
