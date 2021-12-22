import 'package:flutter/material.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get/get.dart';
import 'package:metrocoffee/modules/product/product_detail_page_controller.dart';
import 'package:metrocoffee/ui/src/fonts.dart';

class TempratureOptionWidget extends StatelessWidget {
  const TempratureOptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ProductDetailPageController>(
      init: ProductDetailPageController(),
      builder: (controller) {
        return Container(
          margin: EdgeInsets.symmetric(horizontal: 20.w, vertical: 16.h),
          height: 40.h,
          width: 375.w,
          child: controller.productDetail.variants.isNotEmpty
              ? ListView.separated(
                  itemCount: controller.productDetail.productTypes.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    var item = controller.productDetail.productTypes[index];
                    return GestureDetector(
                      onTap: () => controller.handleProductTypeSelection(index),
                      child: AnimatedContainer(
                        height: 40.h,
                        width: 160.w,
                        duration: const Duration(milliseconds: 250),
                        decoration: BoxDecoration(
                          color: item.selected
                              ? const Color(0xff404D4D)
                              : Colors.white,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            item.name,
                            style: TextStyle(
                                fontFamily: CustomFont.proximaNovaRegular,
                                fontSize: 17.w,
                                color: item.selected
                                    ? const Color(0xFFFEFEFE)
                                    : Colors.black87),
                          ),
                        ),
                      ),
                    );
                  },
                  separatorBuilder: (BuildContext context, int index) {
                    return SizedBox(
                      width: 10.w,
                    );
                  },
                )
              : const SizedBox(
                  height: 0,
                ),
        );
      },
    );
  }
}
