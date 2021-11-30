import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:metrocoffee/modules/products/product_detail_page_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class TempratureOptionWidget extends StatelessWidget {
  final tempratureOptions;
  const TempratureOptionWidget({
    Key? key,
    this.tempratureOptions,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<ProductDetailPageController>(
        init: ProductDetailPageController(),
        builder: (controller) {
          controller.getProductTempOption();

          return SizedBox(
              width: screenwidth,
              child: AnimatedContainer(
                margin: EdgeInsets.only(
                    //                      top: 16, bottom: 18
                    left: screenwidth * 0.0535,
                    right: screenwidth * 0.0535,
                    top: screenwidth * 0.0389,
                    bottom: screenwidth * 0.0437),
                duration: Duration(milliseconds: 350),
                //         height: 41,
                height: screenwidth * 0.0997,
                width: screenwidth,
                alignment: controller.selectedTemprature == 0
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
                    height: screenwidth * 0.0997,
                    width: screenwidth,
                    alignment: controller.selectedTemprature == 0
                        ? Alignment.centerLeft
                        : Alignment.centerRight,

                    // alignment: Alignment.centerLeft,
                    child: AnimatedContainer(
                      duration: Duration(milliseconds: 250),
                      //                     height: 41, width: 180,
                      height: screenwidth * 0.0997,
                      width: screenwidth * 0.437,
                      decoration: BoxDecoration(
                          color: Color(0xff404D4D),
                          borderRadius: BorderRadius.all(Radius.circular(9))),
                    ),
                  ),
                  controller.tempOptions != null
                      ? Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            GestureDetector(
                                onTap: () {
                                  controller.selectedTemprature = 0;
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
                                    "${controller.tempOptions?.options[0]}",
                                    style: TextStyle(
                                        fontFamily: proximanovaregular,
                                        fontSize: 17.w,
                                        color:
                                            controller.selectedTemprature == 0
                                                ? Color(0xFFFEFEFE)
                                                : Palette.textColor),
                                  )),
                                )),
                            GestureDetector(
                              onTap: () {
                                controller.selectedTemprature = 1;
                                // settabindex(1);
                                // orderProducts.orderProductOptions
                                //     ?.add(tempOptions.elementAt(1));
                              },
                              child: Container(
                                //                            height: 41, width: 180,
                                height: 41.h,
                                width: 160.w,
                                color: Colors.transparent,

                                child: Center(
                                    child: Text(
                                  "${controller.tempOptions?.options[1]}",
                                  style: TextStyle(
                                      fontFamily: proximanovaregular,
                                      //             fontSize: 15.5,
                                      fontSize: 17.w,
                                      color: controller.selectedTemprature == 1
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
