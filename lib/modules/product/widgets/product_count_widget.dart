import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:metrocoffee/modules/product/product_detail_page_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ProductCountWidget extends StatelessWidget {
  const ProductCountWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        width: 375.w,
        child: Stack(
          children: [
            Container(
                width: 375.w,
                margin: EdgeInsets.only(
                  //       bottom: 8
                  bottom: 8.h,
                ),
                child: GetX<ProductDetailPageController>(builder: (controller) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                        onTap: () {
                          // controller.decreaseCount();
                        },
                        child: Icon(
                          CupertinoIcons.minus_circle,
                          color: controller.productDetail.qty < 2
                              ? Palette.coffeeColor.withOpacity(0.4)
                              : Palette.coffeeColor,
                          //      size: 27.5,
                          size: 27.w,
                        ),
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                            //          horizontal: 22
                            horizontal: 22.w),
                        child: Text(
                          "${controller.productDetail.qty}",
                          style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w400,
                              color: coffeecolor,
                              fontSize: 16.w)),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          // add products to be orderd in cart
                          // controller.increaseCount();
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
  }
}
