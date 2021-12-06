import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/product/product_detail_page_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class TempratureOptionWidget extends StatelessWidget {
  const TempratureOptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ProductDetailPageController>(
        init: ProductDetailPageController(),
        builder: (controller) {
          return SizedBox(
              width: 375.w,
              child: AnimatedContainer(
                margin: EdgeInsets.only(
                  //                      top: 16, bottom: 18
                  left: 20.w,
                  right: 20.w,
                  top: 16.h,
                  bottom: 16.h,
                ),
                duration: Duration(milliseconds: 350),
                //         height: 41,
                height: 40.h,
                width: 375.w,
                alignment: controller.productDetail.product.qty == 1
                    ? Alignment.centerLeft
                    : Alignment.centerRight,
                decoration: BoxDecoration(
                  color: Color(0xffE8E8E8),
                  borderRadius: BorderRadius.all(Radius.circular(9.r)),
                ),
                child: Stack(children: [
                  AnimatedContainer(
                    duration: Duration(milliseconds: 250),
                    //                height: 41,
                    height: 40.w,
                    width: 375.w,
                    alignment: controller.productDetail.product.qty == 1
                        ? Alignment.centerLeft
                        : Alignment.centerRight,

                    // alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      //                     height: 41, width: 180,
                      height: 40.h,
                      width: 180.w,
                      decoration: BoxDecoration(
                          color: Color(0xff404D4D),
                          borderRadius: BorderRadius.all(Radius.circular(9))),
                    ),
                  ),
                  controller.productDetail.variants.isNotEmpty
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  // controller.selectedTemprature = 0;
                                  // controller.userOrder.value.orderProductOptions
                                  //     ?.add(controller.tempOptions!.options
                                  //         .elementAt(0));
                                },
                                child: Container(
                                  //             height: 41, width: 180,
                                  height: 41.h,
                                  width: 160.w,
                                  color: Colors.transparent,
                                  // clipBehavior: Clip.none,
                                  child: Center(
                                      child: Text(
                                    "S",
                                    style: TextStyle(
                                        fontFamily: proximanovaregular,
                                        fontSize: 17.w,
                                        color: controller.productDetail.product.qty == 1
                                            ? Color(0xFFFEFEFE)
                                            : Palette.textColor),
                                  )),
                                )),
                            GestureDetector(
                              onTap: () {
                                // controller.selectedTemprature = 1;
                                // settabindex(1);
                                // orderProducts.orderProductOptions
                                //     ?.add(tempOptions.elementAt(1));
                              },
                              child: Container(
                                //                            height: 41, width: 180,
                                height: 40.h,
                                width: 160.w,
                                color: Colors.transparent,

                                child: Center(
                                    child: Text(
                                  "M",
                                  style: TextStyle(
                                      fontFamily: proximanovaregular,
                                      //             fontSize: 15.5,
                                      fontSize: 17.w,
                                      color: controller.productDetail.product.qty == 1
                                          ? Color(0xFFFEFEFE)
                                          : Palette.textColor),
                                )),
                              ),
                            )
                          ],
                        )
                      : SizedBox(
                          height: 0,
                        )
                ]),
              ));
        });
  }
}
