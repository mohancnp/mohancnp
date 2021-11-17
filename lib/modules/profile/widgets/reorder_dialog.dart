import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/profile/contents/order_details_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import '../../../core/theme.dart';

class ReOrderDialog extends StatelessWidget {
  final int orderId;
  final double amount;
  const ReOrderDialog({
    Key? key,
    required this.orderId,
    required this.amount,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
//          horizontal: 12.5,vertical:12.5
          horizontal: 12.5.w,
          vertical: 12.5.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(9.r)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
//                height: 82, width: 82,
                height: 82.h, width: 82.w,
                decoration: BoxDecoration(
                    color: Color(0xffEBEBEB), shape: BoxShape.circle),
                child: Center(
                    child: Icon(
                  CupertinoIcons.delete,
                  color: coffeecolor,
//                  size: 39,
                  size: 39.r,
                )),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 16,bottom: 29
                top: 16.h,
                bottom: 29.h),
            child: Text(
              "Reordering your order with order Id #$orderId",
              textAlign: TextAlign.center,
              style: getpoppins(TextStyle(
//                      fontSize: 13.5,
                  fontSize: 13.5.sp,
                  color: darkgrey,
                  fontWeight: FontWeight.w400)),
            ),
          ),
          GestureDetector(
            onTap: () => Get.find<OrderDetailsController>()
                .reorderProduct(orderId, amount),
            child: Container(
//            width: 185,height: 36,
              width: 185.w, height: 36.h,
              decoration: BoxDecoration(
                  color: coffeecolor,
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffC3916A).withOpacity(0.2),
                        blurRadius: 30.r,
                        offset: Offset(0, 9.h))
                  ]),
              child: Center(
                child: Text(
                  "Confirm Order",
                  textAlign: TextAlign.center,
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      //      fontSize: 13.5
                      fontSize: 13.5.sp)),
                ),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              margin: EdgeInsets.only(
//                top: 16
                  top: 16.h),
//            width: 185,height: 36,
              width: 185.w, height: 36.h,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: Palette.coffeeColor,
                    width: 1.2,
                  ),
                  borderRadius: BorderRadius.all(Radius.circular(16.r)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffC3916A).withOpacity(0.2),
                        blurRadius: 30.r,
                        offset: Offset(0, 9.h))
                  ]),
              child: Center(
                child: Text(
                  "Cancel",
                  textAlign: TextAlign.center,
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Palette.coffeeColor,
                      //      fontSize: 13.5
                      fontSize: 13.5.sp)),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
