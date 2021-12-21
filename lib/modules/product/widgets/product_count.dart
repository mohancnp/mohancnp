import 'package:flutter/cupertino.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:get/get.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/product/product_detail_page_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ProductCount extends StatelessWidget {
  const ProductCount({
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
              bottom: 8.h,
            ),
            child: GetX<ProductDetailPageController>(
              builder: (controller) {
                return Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        controller.removeCount();
                        controller.calculateTotal();
                      },
                      child: Icon(
                        CupertinoIcons.minus_circle,
                        color: controller.productDetail.product.qty < 2
                            ? Palette.coffeeColor.withOpacity(0.4)
                            : Palette.coffeeColor,
                        size: 27.w,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 22.w),
                      child: Text(
                        "${controller.productDetail.product.qty}",
                        style: TextStyle(
                          fontWeight: FontWeight.w400,
                          color: coffeecolor,
                           
                          fontSize: 16.w,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.addCount();
                        controller.calculateTotal();
                      },
                      child: Icon(
                        CupertinoIcons.plus_circle,
                        color: coffeecolor,
                        size: 27.w,
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
