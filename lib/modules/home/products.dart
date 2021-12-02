import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import 'widgets/product_list.dart';

class ProductsPage extends GetView<HomeTabController> {
  ProductsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: AlwaysScrollableScrollPhysics(),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          controller.obx(
            (products) {
              if (products != null) {
                return ProductList(
                  products: products,
                  tag: "pList",
                );
              }
              return SizedBox(
                  child: Center(
                child: Text("Products Not Available"),
              ));
            },
            onEmpty: SizedBox(
                child: Center(
              child: Text("Products Not Available"),
            )),
            onError: (error) {
              return SizedBox(
                  child: Center(
                child: Text(error ?? "Error Retrieving Data"),
              ));
            },
            onLoading: SizedBox(
              child: SpinKitRing(
                color: Palette.coffeeColor,
                size: 20.r,
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 28.w, top: 24.h, bottom: 16.h),
            child: Text(
              "Most Popular",
              style: TextStyle(
                  fontWeight: FontWeight.bold, color: Color(0xFF344141)),
            ),
          ),
        ],
      ),
    );
    // return GetBuilder<HomeTabController>(builder: (homeController) {
    //   var np = homeController.actualProduct;
    //   return controller.dataState == DataState.loaded
    //       ? SingleChildScrollView(
    //         // clipBehavior: Clip.none,
    //         physics: AlwaysScrollableScrollPhysics(),
    //         child: Column(
    //             mainAxisAlignment: MainAxisAlignment.start,
    //             crossAxisAlignment: CrossAxisAlignment.start,
    //             mainAxisSize: MainAxisSize.min,

    //             children: [
    //               (np == null)
    //                   ? SizedBox(
    //                       child: Center(
    //                       child: Text("N/A"),
    //                     ))
    //                   : ProductList(
    //                       products: np.products,
    //                       tag: "pList",
    //                     ),
    //               Padding(
    //                 padding: EdgeInsets.only(left: 28.w, top: 24.h, bottom: 16.h),
    //                 child: Text(
    //                   "Most Popular",
    //                   style: TextStyle(
    //                       fontWeight: FontWeight.bold, color: Color(0xFF344141)),
    //                 ),
    //               ),
    //               (np == null)
    //                   ? SizedBox(
    //                       child: Center(
    //                       child: Text("N/A"),
    //                     ))
    //                   : (np.mostPopular == null)
    //                       ? SizedBox(
    //                           child: Center(
    //                           child: Text("N/A"),
    //                         ))
    //                       : ProductList(
    //                           products: np.mostPopular!,
    //                           tag: "mpList",
    //                         ),

    //               SizedBox(height: 16.h)
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
    //       ],
    //     ),
    // )
    //       :
    // SizedBox(
    //           child: SpinKitRing(
    //             color: Palette.coffeeColor,
    //             size: 20.r,
    //           ),
    //         );
    // });
  }
}
