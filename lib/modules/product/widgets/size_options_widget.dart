import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/product/product_detail_page_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class SizeOptionWIdget extends StatelessWidget {
  const SizeOptionWIdget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailPageController>(
        init: ProductDetailPageController(),
        builder: (controller) {
          return ListView.builder(
              itemCount: controller.productDetail.variants.length,
              itemBuilder: (context, index) {
                var variant =
                    controller.productDetail.variants.elementAt(index);

                return GestureDetector(
                  onTap: () => variant.selected = !variant.selected,
                  child: Container(
                    decoration: BoxDecoration(
                      color: Palette.grieshWhite,
                      border: variant.selected
                          ? Border.all(color: Color(0xFF707070), width: 1.5.w)
                          : null,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    width: 92.w,
                    height: 40.h,
                    margin: EdgeInsets.only(right: 16.w),
                    child: Center(
                      child: Text(
                        "S",
                        style: getpoppins(
                          TextStyle(
                              color: Palette.darkGery,
                              fontWeight: controller.productDetail == 0
                                  ? FontWeight.bold
                                  : FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                );
              });
        });
  }
}
