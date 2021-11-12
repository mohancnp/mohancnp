import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:metrocoffee/modules/products/product_detail_page_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ProductCountWidget extends StatelessWidget {
  const ProductCountWidget({
    Key? key,
    required this.screenwidth,
  }) : super(key: key);

  final double screenwidth;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailPageController>(
        init: ProductDetailPageController(),
        builder: (controller) {
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
                      child: GetX<ProductDetailPageController>(
                          builder: (controller) {
                        var newOrder = controller.userOrder;

                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.decreaseCount();
                              },
                              child: Icon(
                                CupertinoIcons.minus_circle,
                                color: controller.userOrder.value.qty < 2
                                    ? Palette.coffeeColor.withOpacity(0.4)
                                    : Palette.coffeeColor,
                                //      size: 27.5,
                                size: 27.w,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  //          horizontal: 22
                                  horizontal: screenwidth * 0.0535),
                              child: Text(
                                "${newOrder.value.qty}",
                                style: getpoppins(TextStyle(
                                    fontWeight: FontWeight.w400,
                                    color: coffeecolor,
                                    fontSize: 16.w)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                // add products to be orderd in cart
                                controller.increaseCount();
                              },
                              child: Icon(
                                CupertinoIcons.plus_circle,
                                color: coffeecolor,
                                //      size: 27.5,
                                size: 27.w,
                              ),
                            ),
                          ],
                        );
                      })),
                ],
              ));
        });
  }
}
