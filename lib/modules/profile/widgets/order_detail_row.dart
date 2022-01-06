import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/core/models/order_detail.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailRow extends StatelessWidget {
  final Order order;
  const OrderDetailRow({
    Key? key,
    required this.order,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 20.h),
      width: 375.w,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Prodct Name",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: darkgrey,
                  fontSize: 12.sp,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: 90.w),
                    child: Text(
                      "${order.itemsCount} item",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: darkgrey.withOpacity(0.8),
                        fontSize: 8.sp,
                      ),
                    ),
                  ),
                  Text(
                    "${Currency.symbol} ${order.totalAmount * order.itemsCount}",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: darkgrey.withOpacity(0.8),
                      fontSize: 8.sp,
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 8.h),
            width: 375.w,
            height: 4.h,
            decoration: BoxDecoration(
              color: darkgrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10.r),
            ),
          )
        ],
      ),
    );
  }
}
