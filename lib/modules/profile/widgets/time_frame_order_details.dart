import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/constants/order_status.dart';
import 'package:metrocoffee/core/models/order_detail.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/profile/widgets/reorder_total_price.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/util/date_trimmer.dart';
import 'package:metrocoffee/util/order_status_info.dart';
import 'order_detail_row.dart';

class TimeFrameOrderDetails extends StatelessWidget {
  final OrderDetail orderDetail;

  const TimeFrameOrderDetails({Key? key, required this.orderDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: 20.w,
        right: 20.w,
        top: 16.h,
        bottom: 20.h,
      ),
      padding: EdgeInsets.only(
        top: 16.h,
        left: 16.w,
        right: 16.w,
        bottom: 24.h,
      ),
      decoration: BoxDecoration(
        color: const Color(0xffFBFBFB),
        borderRadius: BorderRadius.all(Radius.circular(8.r)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.07),
            blurRadius: 10.r,
            offset: Offset(0, 4.r),
          )
        ],
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Order ID: #${orderDetail.order.id}",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: coffeecolor,
                  fontSize: 16.sp,
                ),
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Status",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: darkgrey,
                      fontSize: 8.sp,
                    ),
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.timer_fill,
                        color: getStatusStringForId(orderDetail.order.status) ==
                                OrderStatus.delivered
                            ? Colors.green
                            : Colors.yellow,
                        size: 16.sp,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4.w),
                        child: Text(
                          getStatusStringForId(orderDetail.order.status),
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Palette.coffeeColor,
                            fontSize: 8.sp,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          // SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 2.w),
                child: Text(
                  "Date: ${orderDetail.order.requestAt}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: darkgrey,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 4.h),
                child: Text(
                  getTimeFromDateTimeStamp(orderDetail.order.shippingTime),
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: darkgrey,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Icon(
                Icons.location_on,
                size: 12.w,
                color: darkgrey,
              ),
              Container(
                margin: EdgeInsets.only(
                  left: 4.w,
                  bottom: 4.h,
                ),
                child: Text(
                  orderDetail.order.title,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: coffeecolor,
                    decoration: TextDecoration.underline,
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 4.h),
                child: Text(
                  "${orderDetail.order.itemsCount} items",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: darkgrey.withOpacity(0.8),
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          ListView.builder(
            itemCount: orderDetail.orderItems.length,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemBuilder: (context, index) {
              OrderItem orderProduct = orderDetail.orderItems[index];
              return OrderDetailRow(
                order: orderProduct,
              );
            },
          ),
          ReorderTotalPrice(orderDetail: orderDetail),
        ],
      ),
    );
  }
}
