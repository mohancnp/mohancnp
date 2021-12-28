import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/app_message.dart';
import 'package:metrocoffee/modules/home/home_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/on_empty_widget.dart';
import 'package:metrocoffee/ui/widgets/on_error_widget.dart';
import 'widgets/product_list.dart';

class ProductsPage extends GetView<HomeController> {
  const ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const AlwaysScrollableScrollPhysics(),
      child: controller.obx(
        (categoryProduct) {
          if (categoryProduct != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32),
                categoryProduct.products.isEmpty
                    ? const EmptyDataWidget(message: "Not Available")
                    : Padding(
                        padding: EdgeInsets.only(top: 8.h),
                        child: ProductList(
                          products: categoryProduct.products,
                        ),
                      ),
                categoryProduct.mostPopularProducts.isEmpty
                    ? const EmptyDataWidget(message: "Not Available")
                    : Padding(
                        padding: EdgeInsets.only(
                            left: 28.w, top: 24.h, bottom: 16.h),
                        child: const Text(
                          "Most Popular",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF344141)),
                        ),
                      ),
                Padding(
                  padding: EdgeInsets.only(bottom: 16.h),
                  child: ProductList(
                    products: categoryProduct.mostPopularProducts,
                  ),
                ),
              ],
            );
          }
          return const EmptyDataWidget(
            message: AppMessage.notFound,
          );
        },
        onEmpty: const EmptyDataWidget(
          message: AppMessage.notFound,
        ),
        onError: (error) {
          return Center(
            child: OnErrorWidget(
              message: error ?? AppMessage.somethingWentWrong,
              onPressed: () {
                controller.getCategoryData();
              },
            ),
          );
        },
        onLoading: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 50.h),
            Center(
              child: SpinKitDualRing(
                color: Palette.coffeeColor,
                size: 50.r,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
