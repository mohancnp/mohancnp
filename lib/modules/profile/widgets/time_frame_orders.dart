import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/core/models/order_history.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TimeFrameOrders extends StatelessWidget {
  final int? index;
  final OrderInstance orderData;
  final bool? reorder;
  const TimeFrameOrders(
      {Key? key, @required this.index, this.reorder, required this.orderData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: null,
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 4.h),
        margin: EdgeInsets.only(bottom: 16.w),
        decoration: BoxDecoration(
          color: const Color(0xffFBFBFB),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: Offset(0, 4.r),
              blurRadius: 12.r,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: 90.w,
                  width: 90.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  ),
                  child: Image.asset(
                    "assets/images/metro_coffee_logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(width: 16.w),
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "${orderData.itemsCount} items",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Palette.darkGery,
                        fontSize: 12.sp,
                      ),
                    ),
                    Text(
                      "Date: ${orderData.requestAt}",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Palette.darkGery,
                        fontSize: 10.sp,
                      ),
                    ),
                    Text(
                      "Order ID: #${orderData.id}",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Palette.darkGery,
                        fontSize: 10.sp,
                      ),
                    )
                  ],
                )
              ],
            ),
            SizedBox(width: 8.w),
            Container(
              height: 32.h,
              width: 2.w,
              decoration: const BoxDecoration(
                color: Color(0xffA5A5A5),
              ),
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "\$ ${orderData.totalAmount}",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff550E1C),
                    fontSize: 16.sp,
                  ),
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  margin: EdgeInsets.only(top: 8.h),
                  padding: EdgeInsets.all(4.r),
                  child: Row(
                    children: [
                      Icon(
                        Icons.cancel_rounded,
                        color: Palette.coffeeColor,
                        size: 12.r,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 4.w),
                        child: Text(
                          "Pending",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.red,
                            fontSize: 12.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Icon(
              CupertinoIcons.forward,
              size: 16.w,
              color: Palette.darkGery,
            )
          ],
        ),
      ),
    );
  }
}
