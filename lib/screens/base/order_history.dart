import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/placeholder_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/theme.dart';

class OrderHistory extends StatelessWidget {
  const OrderHistory({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFFF3F5F5),
        leading: Icon(
          CupertinoIcons.back,
          color: Colors.black,
        ),
        elevation: 0,
        title: Center(
          child: Text(
            "ORDER HISTORY",
            style: getpoppins(TextStyle(
              color: Color(0xFF404D4D),
              fontWeight: FontWeight.w500,
            )),
          ),
        ),
      ),
      body: Container(
        color: Color(0xFFF3F5F5),
        width: screenwidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 28.w, bottom: 23.h),
              child: Text("Today"),
            ),
            SIngleOrderWidget(),
            SIngleOrderWidget(),
            SIngleOrderWidget(),
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
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
      height: 92.h,
      width: 320.w,
      margin: EdgeInsets.only(bottom: 10.h, left: 28.w, right: 28.w),
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
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(9.r),
                child: Image.asset(
                  "$assetImage",
                  width: 73.w,
                  height: 72.h,
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                //  height: 76,
                margin: EdgeInsets.only(
                    //        left: 18
                    left: screenwidth * 0.0437),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        " 3 items",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff404D4D),
                            //       fontSize: 14.5
                            fontSize: screenwidth * 0.03527)),
                      ),
                    ),
                    Text(
                      "Date: 2021/4/5 12:45 AM",
                      style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(0xff404D4D),
                          //         fontSize: 11.5
                          fontSize: screenwidth * 0.0279)),
                    ),
                    Container(
                        child: Text(
                      "Order ID: #57",
                      style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w300,
                          color: Color(0xff404D4D),
                          //         fontSize: 11.5
                          fontSize: screenwidth * 0.0279)),
                    ))
                  ],
                ),
              )
            ],
          ),
          Container(
            //                  height: 31,width: 2,
            height: 31.h, width: 2,
            decoration: BoxDecoration(
              color: Color(0x26A5A5A5),
            ),
          ),
          GestureDetector(
            onTap: () {
              // print("sent id : ${orderData.id}");
              // if (reorder != null) {
              //   Get.to(
              //       () => OrderDetails(
              //             reorder: reorder,
              //           ),
              //       arguments: orderData.id);
              // } else {
              //   Get.toNamed(
              //     '/OrderDetails',
              //     arguments: orderData.id,
              //   );
              // }
            },
            child: Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                mainAxisSize: MainAxisSize.max,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "\$ 3.00",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Color(0xff550E1C),
                            //      fontSize: 16
                            fontSize: screenwidth * 0.0389)),
                      ),
                      Container(
                        width: 60.w,
                        height: 23.h,
                        alignment: Alignment.center,
                        margin: EdgeInsets.all(8.w),
                        child: Text(
                          "Re Order",
                          style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff550E1C),
                              fontSize: 10.h)),
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: coffeecolor,
                              width: 2.w,
                            ),
                            borderRadius: BorderRadius.circular(4.r)),
                      )
                    ],
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    //     size: 20,
                    size: screenwidth * 0.0486,
                    color: Color(0xff404D4D),
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
