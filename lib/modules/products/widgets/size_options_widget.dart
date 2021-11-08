import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/products/product_detail_page_controller.dart';

class SizeOptionWIdget extends StatelessWidget {
  const SizeOptionWIdget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailPageController>(
        init: ProductDetailPageController(),
        builder: (controller) {
          // controller.productDetail.allVariants;
          return Container(
            width: 375.w,
            padding: EdgeInsets.only(left: 28.w, top: 16.h, right: 28.w),
            // margin: EdgeInsets.only(left: 28.w, top: 16.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              mainAxisSize: MainAxisSize.max,
              children: [
                // controller.variants[0].name
                controller.variants[0].id != -1
                    ? GestureDetector(
                        onTap: () => controller.selectedVariant = 0,
                        child: Container(
                          decoration: BoxDecoration(
                            color: Color(0xFFE8E8E8),
                            border: controller.selectedVariant == 0
                                ? Border.all(
                                    color: Color(0xFF707070), width: 1.5.w)
                                : null,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          width: 92.w,
                          height: 40.h,
                          child: Center(
                            child: Text(
                              "S",
                              style: getpoppins(
                                TextStyle(
                                    color: Color(0xFF404D4D),
                                    fontWeight: controller.selectedVariant == 0
                                        ? FontWeight.bold
                                        : FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 0,
                        height: 0,
                      ),
                controller.variants[1].id != -1
                    ? GestureDetector(
                        onTap: () => controller.selectedVariant = 1,
                        child: Container(
                          width: 92.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFE8E8E8),
                            border: controller.selectedVariant == 1
                                ? Border.all(
                                    color: Color(0xFF707070), width: 1.5.w)
                                : null,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              "M",
                              style: getpoppins(
                                TextStyle(
                                    color: Color(0xFF404D4D),
                                    fontWeight: controller.selectedVariant == 1
                                        ? FontWeight.bold
                                        : FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 0,
                        height: 0,
                      ),

                controller.variants[2].id != -1
                    ? GestureDetector(
                        onTap: () => controller.selectedVariant = 2,
                        child: Container(
                          width: 92.w,
                          height: 40.h,
                          decoration: BoxDecoration(
                            color: Color(0xFFE8E8E8),
                            border: controller.selectedVariant == 2
                                ? Border.all(
                                    color: Color(0xFF707070), width: 1.5.w)
                                : null,
                            borderRadius: BorderRadius.circular(4.r),
                          ),
                          child: Center(
                            child: Text(
                              "L",
                              style: getpoppins(TextStyle(
                                  color: Color(0xFF404D4D),
                                  fontWeight: controller.selectedVariant == 2
                                      ? FontWeight.bold
                                      : FontWeight.w400)),
                            ),
                          ),
                        ),
                      )
                    : SizedBox(
                        width: 0,
                        height: 0,
                      ),
              ],
            ),
          );
        });
  }
}
