import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/icons/utility_icons.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/home/home_controller.dart';
import 'package:metrocoffee/modules/home/widgets/new_card.dart';
import 'package:metrocoffee/modules/product_search/search_page_controller.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/utility_info_widget.dart';

import '../shareables/widgets/searchbar.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: pagebackgroundcolor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Palette.coffeeColor,
            height: 170.h,
            child: Column(
              children: [
                Container(
                  margin: EdgeInsets.only(
                    top: 60.h,
                    left: 28.w,
                    right: 44.w,
                    bottom: 3.h,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () => Get.back(),
                        child: Container(
                          height: 24.w,
                          width: 24.w,
                          color: Colors.transparent,
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 16.w,
                            color: Colors.white,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 112.w),
                        child: Text(
                          "SEARCH",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            color: const Color(0xFFF5F5F5),
                            fontSize: 16.sp,
                             
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 26.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 28.w),
                  child: const SearchBar(
                    enabled: true,
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(left: 24.w, right: 16.w),
              padding: EdgeInsets.only(top: 16.h),
              child: GetBuilder<SearchPageController>(
                init: SearchPageController(),
                builder: (controller) {
                  if (controller.errorMessage.isNotEmpty ||
                      controller.ctp.products.isEmpty) {
                    return UtilityInfoWidget(
                      title: "title",
                      content: "content",
                      onPressed: () {},
                      svgImageUri: UtilityIcons.noResults,
                      buttonText: "Perform Search",
                    );
                  } else if (controller.searching) {
                    return SizedBox(
                      child: SpinKitRing(
                        color: Palette.coffeeColor,
                        size: 50.r,
                      ),
                    );
                  }
                  return GridView.builder(
                    padding: EdgeInsets.zero,
                    itemCount: controller.ctp.products.length,
                    physics: const AlwaysScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisSpacing: 10.w,
                      mainAxisSpacing: 10,
                      crossAxisCount: 2,
                      childAspectRatio: 1 / 1.35,
                    ),
                    itemBuilder: (context, index) {
                      var product = controller.ctp.products[index];
                      return ProductCard(
                        imageUri: product.featuresImage,
                        name: product.productName,
                        id: product.id,
                        onPressed: () => HomeController.to.navigateToPageDetail(
                            PageName.productdetailpage, product.id),
                        price: product.productPrice,
                      );
                    },
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
