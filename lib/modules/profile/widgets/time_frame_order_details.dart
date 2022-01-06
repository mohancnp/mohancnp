import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/models/order_detail.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class TimeFrameOrderDetails extends StatelessWidget {
  final Order order;

  const TimeFrameOrderDetails({Key? key, required this.order})
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
                "Order ID: #${order.id}",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: coffeecolor,
                  fontSize: 12.sp,
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
                  Row(
                    children: [
                      Icon(
                        CupertinoIcons.timer_fill,
                        color: Colors.red,
                        size: 12.sp,
                      ),
                      Container(
                        margin: EdgeInsets.only(left: 4.w),
                        child: Text(
                          //TODO: change order status
                          "${order.status}",
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
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 2.w),
                child: Text(
                  "Date: ${order.requestAt}",
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
                  order.shippingTime,
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
                  //TODO : add address here
                  "Address Here",
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
                  "${order.itemsCount}",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: darkgrey.withOpacity(0.8),
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          //TODO: implement single order with detail

          // ListView.builder(
          //     itemCount: orderDetail.orderProductList!.length,
          //     shrinkWrap: true,
          //     physics: const NeverScrollableScrollPhysics(),
          //     scrollDirection: Axis.vertical,
          //     itemBuilder: (context, index) {
          //       OrderProduct? orderProduct =
          //           orderDetail.orderProductList?.elementAt(index);

          //       if (orderProduct != null) {
          //         return OrderDetailRow(
          //           odp: orderProduct,
          //         );
          //       }
          //       return const SizedBox();
          //     }),
          totalpricebox(context)
        ],
      ),
    );
  }

  Widget totalpricebox(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 28.w),
      width: 375.w,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            "\$ ${order.totalAmount}",
            style: TextStyle(
              fontWeight: FontWeight.w500,
              color: Palette.coffeeColor,
              fontSize: 16.sp,
            ),
          ),
          Container(
            margin: EdgeInsets.symmetric(horizontal: 20.w),
            height: 28.h,
            width: 2.w,
            decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                color: Colors.grey.withOpacity(0.5)),
          ),
          GestureDetector(
            onTap: () {
              //TODO: implement re-order with reorder custom dialog design.
            },
            child: Container(
              height: 28.h,
              width: 112.w,
              decoration: BoxDecoration(
                color: Palette.coffeeColor,
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                border: Border.all(
                  color: Colors.redAccent,
                  width: 1.5,
                ),
              ),
              child: Center(
                child: Text(
                  "Order Status",
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.redAccent,
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
