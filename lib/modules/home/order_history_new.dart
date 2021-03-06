import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/placeholder.dart';
import 'package:metrocoffee/core/theme.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFF3F5F5),
        leading: const Icon(
          CupertinoIcons.back,
          color: Colors.black,
        ),
        elevation: 0,
        title: const Center(
          child: Text(
            "ORDER HISTORY",
            style: TextStyle(
              color: Color(0xFF404D4D),
              fontWeight: FontWeight.w500,
               
            ),
          ),
        ),
      ),
      body: Container(
        color: const Color(0xFFF3F5F5),
        width: 375.w,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 28.w, bottom: 23.h),
              child: const Text("Today"),
            ),
            const SIngleOrderWidget(),
            const SIngleOrderWidget(),
            const SIngleOrderWidget(),
          ],
        ),
      ),
    );
  }
}

class SIngleOrderWidget extends StatelessWidget {
  const SIngleOrderWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tablet = context.isTablet;
    return Container(
      height: 92.h,
      width: 320.w,
      margin: EdgeInsets.only(bottom: 10.h, left: 28.w, right: 28.w),
      decoration: BoxDecoration(
        color: const Color(0xffFBFBFB),
        borderRadius: const BorderRadius.all(Radius.circular(9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            offset: const Offset(0, 3),
            blurRadius: 10,
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment:
            tablet ? MainAxisAlignment.spaceAround : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w, top: 10.h, bottom: 10.h),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(9.r),
                  child: SizedBox(
                    height: 72.w,
                    width: 73.h,
                    child: Image.asset(
                      assetImage,
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 14.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "3 items",
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: const Color(0xff404D4D),
                         
                        fontSize: 14.sp,
                      ),
                    ),
                    Text(
                      "Date: 2021/4/5 12:45 AM",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff404D4D),
                         
                        fontSize: 11.sp,
                      ),
                    ),
                    Text(
                      "Order ID: #57",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: const Color(0xff404D4D),
                        fontSize: 11.sp,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: 31.h,
            width: 2,
            margin: EdgeInsets.only(
              left: 17.w,
            ),
            decoration: const BoxDecoration(
              color: Color(0x26A5A5A5),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            mainAxisSize: MainAxisSize.max,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 11.w),
                    child: Text(
                      "\$ 3.00",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        color: const Color(0xff550E1C),
                         
                        fontSize: 16.sp,
                      ),
                    ),
                  ),
                  Container(
                    width: 73.w,
                    height: 31.h,
                    color: Colors.transparent,
                    padding: EdgeInsets.only(left: 8.w, right: 8.w),
                    child: Container(
                      width: 60.w,
                      height: 23.h,
                      alignment: Alignment.center,
                      margin: EdgeInsets.only(top: 8.h),
                      child: Text(
                        "Re Order",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff550E1C),
                           
                          fontSize: 10.h,
                        ),
                      ),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: coffeecolor,
                          width: 1.w,
                        ),
                        borderRadius: BorderRadius.circular(4.r),
                      ),
                    ),
                  )
                ],
              ),
              Icon(
                Icons.forward,
                size: 20.w,
                color: const Color(0xff404D4D),
              )
            ],
          )
        ],
      ),
    );
  }
}
