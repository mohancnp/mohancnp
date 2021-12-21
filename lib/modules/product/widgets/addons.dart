import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/product/product_detail_page_controller.dart';

class Addons extends StatelessWidget {
  const Addons({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetX<ProductDetailPageController>(
      init: ProductDetailPageController(),
      builder: (controller) {
        var addons = controller.productDetail.addons;
        return addons.isEmpty
            ? const SizedBox()
            : Container(
                height: 140.h,
                padding: EdgeInsets.only(left: 28.w),
                child: ListView.builder(
                  itemCount: addons.length,
                  clipBehavior: Clip.none,
                  scrollDirection: Axis.horizontal,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    int i = addons[index].id;
                    return GestureDetector(
                      onTap: () {
                        controller.handleAddonSelection(i);
                        controller.calculateTotal();
                      },
                      child: Padding(
                        padding: EdgeInsets.only(right: 16.w),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Container(
                              padding: EdgeInsets.only(
                                left: 12.w,
                                bottom: 4.h,
                                right: 4.w,
                              ),
                              height: 87.h,
                              width: 100.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: addons[index].selected
                                        ? const Color(0xFF550E1C)
                                        : Colors.white,
                                    width: 2.0),
                                borderRadius: BorderRadius.circular(9.r),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 20.r,
                                    offset: Offset(0, 3.r),
                                  )
                                ],
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    addons[index].name,
                                    style: TextStyle(
                                      fontWeight: FontWeight.w300,
                                      color: darkgrey,
                                       
                                      fontSize: 12.sp,
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "${Currency.symbol} ${addons[index].price}",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w500,
                                          color: darkgrey,
                                           
                                          fontSize: 13.sp,
                                        ),
                                      ),
                                      Icon(
                                        CupertinoIcons.add_circled_solid,
                                        color: coffeecolor,
                                        size: 21.sp,
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            addons[index].image.isNotEmpty
                                ? Positioned(
                                    left: 24.w,
                                    child: Image.network(
                                      "${AppConfig.baseUrl}/${addons[index].image}",
                                      width: 86.w,
                                      height: 46.h,
                                      errorBuilder: (
                                        BuildContext context,
                                        Object exception,
                                        StackTrace? stackTrace,
                                      ) {
                                        return Center(
                                          child: Image.asset(
                                            AppConfig.metroCoffeeLogoAssetPath,
                                            width: 86.w,
                                            height: 46.h,
                                          ),
                                        );
                                      },
                                    ),
                                  )
                                : const SizedBox(),
                          ],
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
