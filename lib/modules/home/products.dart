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
  ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: controller.obx(
        (categoryProduct) {
          if (categoryProduct != null) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 32),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: ProductList(
                    products: categoryProduct.products,
                  ),
                ),
                categoryProduct.mostPopular.isEmpty
                    ? SizedBox()
                    : Padding(
                        padding: EdgeInsets.only(
                            left: 28.w, top: 24.h, bottom: 16.h),
                        child: Text(
                          "Most Popular",
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF344141)),
                        ),
                      ),
                ProductList(
                  products: categoryProduct.mostPopular,
                ),
              ],
            );
          }
          return EmptyDataWidget(
            message: AppMessage.notFound,
          );
        },
        onEmpty: EmptyDataWidget(
          message: AppMessage.notFound,
        ),
        onError: (error) {
          return OnErrorWidget(
            message: error ?? AppMessage.somethingWentWrong,
          );
        },
        onLoading: SizedBox(
          child: SpinKitRing(
            color: Palette.coffeeColor,
            size: 20.r,
          ),
        ),
      ),
    );
  }
}
