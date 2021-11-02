import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class ProductCountWidget extends StatelessWidget {
  const ProductCountWidget({
    Key? key,
    required this.screenwidth,
  }) : super(key: key);

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: screenwidth,
        // padding: EdgeInsets.only(
        //     //                          top: 175, bottom: 40
        //     top: screenwidth * 0.4257,
        //     bottom: screenwidth * 0.09732),
        child: Stack(
          children: [
            Container(
                width: screenwidth,
                margin: EdgeInsets.only(
                    //       bottom: 8
                    bottom: screenwidth * 0.0194),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        // print(productdetailscontroller
                        //     .productOrderCount);
                        // var count = drinksDetailController
                        //     .orderProducts.qty;
                        // if (count > 1) {
                        //   drinksDetailController
                        //       .removeCount();
                        // }
                      },
                      child: Icon(
                        CupertinoIcons.minus_circle,
                        color: coffeecolor.withOpacity(0.4),
                        //      size: 27.5,
                        size: 27.w,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(
                          //          horizontal: 22
                          horizontal: screenwidth * 0.0535),
                      child: Text(
                        "12",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w400,
                            color: coffeecolor,
                            fontSize: 27.w)),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        // add products to be orderd in cart
                        // drinksDetailController.addCount();
                      },
                      child: Icon(
                        CupertinoIcons.plus_circle,
                        color: coffeecolor,
                        //      size: 27.5,
                        size: 27.w,
                      ),
                    ),
                  ],
                )),
          ],
        ));
  }
}
