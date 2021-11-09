import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/screens/widgets/product/finalpricecalculationcard.dart';
import 'package:metrocoffee/screens/widgets/product/product_card.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyProductCart extends StatelessWidget {
  MyProductCart({Key? key}) : super(key: key);
  // final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
        backgroundColor: Color(0xFFF3F5F5),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Container(
          height: 47.h,
          width: 320.w,
          decoration: BoxDecoration(
              color: Color(0xff550E1C),
              borderRadius: BorderRadius.all(Radius.circular(10)),
              boxShadow: [
                BoxShadow(
                    color: Color(0xffC3916A).withOpacity(0.5),
                    blurRadius: 30,
                    offset: Offset(0, 9))
              ]),
          child: Center(
            child: Text(
              "Proceed to Checkout",
              style: getpoppins(TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  //       fontSize: 15
                  fontSize: screenwidth * 0.0364)),
            ),
          ),
        ),
        // floatingActionButtonLocation: ,
        appBar: AppBar(
          backgroundColor: Color(0xFFF3F5F5),
          elevation: 0,
          centerTitle: true,
          leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: Container(
              width: 24.w,
              height: 24.h,
              color: Colors.transparent,
              child: Icon(
                CupertinoIcons.back,
                size: 20.w,
                color: coffeecolor,
              ),
            ),
          ),
          title: Text(
            "MY CART",
            style: TextStyle(
                fontFamily: poppinsmedium,
                color: Color(0xff404D4D),
                //       fontSize: 16
                fontSize: screenwidth * 0.0389),
          ),
        ),
        body: SingleChildScrollView(
            physics: BouncingScrollPhysics(),
            child: Stack(
              children: [
                Column(
                  children: [
                    SizedBox(
                      height: 20.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Padding(
                          padding: EdgeInsets.only(
                            left: 30.w,
                          ),
                          child: Text(
                            "2 items",
                            style:
                                getpoppins(TextStyle(color: Color(0xCF344141))),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(right: 30.w),
                          child: Row(
                            children: [
                              Text(
                                "Add",
                                style: getpoppins(
                                    TextStyle(fontWeight: FontWeight.w500)),
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 8.w),
                                child: Icon(
                                  Icons.add_circle,
                                  size: 16.w,
                                  color: coffeecolor,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    ProductCard(),
                    Container(
                      height: 2.w,
                      width: 320.w,
                      color: Colors.black12,
                      padding: EdgeInsets.only(top: 10.h),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    FinalProductCalculationCard(),
                  ],
                ),
                // Positioned(
                //   top: 300.h,
                //   child: Container(
                //     height: screenwidth * 0.114,
                //     width: screenwidth * 0.5961,
                //     decoration: BoxDecoration(
                //         color: Color(0xff550E1C),
                //         borderRadius: BorderRadius.all(Radius.circular(10)),
                //         boxShadow: [
                //           BoxShadow(
                //               color: Color(0xffC3916A).withOpacity(0.5),
                //               blurRadius: 30,
                //               offset: Offset(0, 9))
                //         ]),
                //     child: Center(
                //       child: Text(
                //         "Proceed to Checkout",
                //         style: getpoppins(TextStyle(
                //             fontWeight: FontWeight.w300,
                //             color: Colors.white,
                //             //       fontSize: 15
                //             fontSize: screenwidth * 0.0364)),
                //       ),
                //     ),
                //   ),
                // ),
              ],
            )));
  }
}
