import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/core/models/order_detail.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ReorderTotalPrice extends StatelessWidget {
  final OrderDetail orderDetail;
  const ReorderTotalPrice({Key? key, required this.orderDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 28.w),
      width: 375.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            Currency.symbol + " ${orderDetail.order.totalAmount}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Palette.coffeeColor,
              fontSize: 16.sp,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            height: 28.h,
            width: 2.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(16.r)),
              color: Colors.grey.withOpacity(0.5),
            ),
          ),
          GestureDetector(
            onTap: null,
            child: Container(
              height: 28.h,
              width: 112.w,
              decoration: BoxDecoration(
                color: Palette.coffeeColor,
                borderRadius: BorderRadius.all(Radius.circular(10.r)),
                border: Border.all(
                  color: Palette.coffeeColor,
                  width: 2.w,
                ),
              ),
              child: Center(
                child: Text(
                  "Re Order",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Palette.pagebackgroundcolor,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
