import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/product/product_detail_page_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class SizeOption extends StatelessWidget {
  const SizeOption({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ProductDetailPageController>(
      init: ProductDetailPageController(),
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 28.w, vertical: 12.h),
          height: 50.h,
          child: ListView.builder(
            itemCount: controller.productDetail.variants.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              final variant = controller.productDetail.variants[index];
              return GestureDetector(
                onTap: () {
                  controller.handleSizeSelection(index);
                  controller.calculateTotal();
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Palette.grieshWhite,
                    border: variant.selected
                        ? Border.all(
                            color: const Color(0xFF707070), width: 1.5.w)
                        : null,
                    borderRadius: BorderRadius.circular(4.r),
                  ),
                  width: 92.w,
                  height: 40.h,
                  margin: EdgeInsets.only(right: 16.w),
                  child: Center(
                    child: Text(
                      variant.size,
                      style: TextStyle(
                        color: Palette.darkGery,
                         
                        fontWeight: controller.productDetail == 0
                            ? FontWeight.bold
                            : FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
