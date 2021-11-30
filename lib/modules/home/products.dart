import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'widgets/product_list.dart';

class ProductsPage extends StatelessWidget {
  ProductsPage({Key? key}) : super(key: key);
  final controller = Get.find<HomeTabController>();

  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeTabController>(builder: (homeController) {
      var np = homeController.actualProduct;
      return controller.dataState == DataState.loaded
          ? Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                (np == null)
                    ? SizedBox(
                        child: Center(
                        child: Text("N/A"),
                      ))
                    : ProductList(
                        products: np.products,
                        tag: "pList",
                      ),
                Padding(
                  padding: EdgeInsets.only(left: 28.w, top: 24.h, bottom: 16.h),
                  child: Text(
                    "Most Popular",
                    style: TextStyle(
                        fontWeight: FontWeight.w500, color: Color(0xFF344141)),
                  ),
                ),
                (np == null)
                    ? SizedBox(
                        child: Center(
                        child: Text("N/A"),
                      ))
                    : (np.mostPopular == null)
                        ? SizedBox(
                            child: Center(
                            child: Text("N/A"),
                          ))
                        : ProductList(
                            products: np.mostPopular!,
                            tag: "mpList",
                          ),
                // Padding(
                //   padding: EdgeInsets.only(left: 28.w, top: 24.h, bottom: 16.h),
                //   child: Text(
                //     "Recommended",
                //     style: TextStyle(
                //         fontWeight: FontWeight.w500, color: Color(0xFF344141)),
                //   ),
                // ),
                //   (np == null)
                //       ? SizedBox(
                //           child: Center(
                //           child: Text("N/A"),
                //         ))
                //       : (np.mostPopular == null)
                //           ? SizedBox(
                //               child: Center(
                //               child: Text("N/A"),
                //             ))
                //           : ProductList(
                //               products: np.recommendation!,
                //               tag: "rcList",
                //             ),
              ],
            )
          : SizedBox(
              child: SpinKitRing(
                color: Palette.coffeeColor,
                size: 20.r,
              ),
            );
    });
  }
}
