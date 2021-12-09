import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/icons/carticons.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/product/widgets/toppings_multiselect.dart';
import 'package:metrocoffee/resource/app_config.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:metrocoffee/ui/widgets/on_error_widget.dart';
import 'product_detail_page_controller.dart';
import 'widgets/addons_widget.dart';
import 'widgets/product_count_widget.dart';
import 'widgets/size_options_widget.dart';
import 'widgets/temp_options_widget.dart';

class ProductDetailPage extends GetView<ProductDetailPageController> {
  ProductDetailPage({Key? key}) : super(key: key);

  final controller = Get.put(ProductDetailPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      bottomNavigationBar: Container(
          height: 73.h,
          width: 375.w,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(9.r),
                topRight: Radius.circular(9.r),
              )),
          child: Obx(() {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                controller.totalPrice == 0.0
                    ? SizedBox(
                        height: 10.h,
                        width: 10.w,
                        child: CircularProgressIndicator(),
                      )
                    : Text(
                        dollar + " ${controller.totalPrice.value}",
                        style: getpoppins(TextStyle(
                          color: Palette.textColor,
                          fontSize: 26.sp,
                          fontWeight: FontWeight.w500,
                        )),
                      ),
                controller.totalPrice == 0.0
                    ? SizedBox(
                        height: 10.h,
                        width: 10.w,
                        child: CircularProgressIndicator(),
                      )
                    : AnimatedContainer(
                        duration: Duration(milliseconds: 1000),
                        height: 47.h,
                        // width: pC.pressed ? 212.w : 180,
                        width: 180.w,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.r),
                          color: Palette.coffeeColor,
                        ),
                        child: TextButton.icon(
                            onPressed: controller.addProductToCart,
                            icon: Icon(
                              CupertinoIcons.cart_badge_plus,
                              color: Colors.white,
                              // color: Palette.coffeeColor,
                            ),
                            label: Text(
                              "Add To Cart",
                              style: getpoppins(TextStyle(
                                color: Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.w300,
                              )),
                            )),
                      ),
              ],
            );
          })),
      body: controller.obx((pd) {
        if (pd == null) {
          return OnErrorWidget(
            message: "Error Retrieving Detail",
          );
        } else {
          return SingleChildScrollView(
            child: Column(children: [
              Stack(
                children: [
                  Container(
                    height: 373.h,
                    width: 375.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(8.w),
                            bottomRight: Radius.circular(8.w)),
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(
                            "${AppConfig.baseUrl}${AppConfig.productImagePath}${pd.product.id}/${pd.product.image}",
                          ),
                        )),
                  ),
                  Positioned(
                    top: 48.h,
                    child: SizedBox(
                      width: 375.w,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        // mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            onTap: () {
                              // controller.productDetail = ProductDetail.empty();
                              Get.back();
                            },
                            child: Padding(
                              padding: EdgeInsets.only(left: 24.w),
                              child: Icon(
                                CupertinoIcons.back,
                                color: Colors.white,
                                size: 24.w,
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {},
                            child: Stack(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(right: 28.w),
                                  child: SvgPicture.asset(
                                    cartIcons,
                                    width: 20.w,
                                    height: 20.w,
                                    color: Colors.white,
                                  ),
                                ),
                                // int count = cartController.cartCount.value;
                                Positioned(
                                    left: 10.w,
                                    child: Obx(() {
                                      var count = Get.find<CartController>()
                                          .cartCount
                                          .value;
                                      return AnimatedContainer(
                                        height: count < 1 ? 0.w : 12.w,
                                        width: count < 1 ? 0.w : 12.w,
                                        alignment: Alignment.center,
                                        child: Text("$count",
                                            style: TextStyle(fontSize: 8.sp)),
                                        decoration: BoxDecoration(
                                            color: Colors.white,
                                            boxShadow: [
                                              BoxShadow(
                                                offset: Offset(1, 1),
                                                color: Colors.black12,
                                              ),
                                              BoxShadow(
                                                offset: Offset(-1, -1),
                                                color: Colors.black12,
                                              )
                                            ],
                                            shape: BoxShape.circle),
                                        duration: Duration(milliseconds: 500),
                                      );
                                    }))
                              ],
                            ),
                          ),
                          // Icon(Icons)
                        ],
                      ),
                    ),
                  ),
                  Positioned(
                    top: pd.product.description.isNotEmpty ? 240.h : null,
                    bottom: pd.product.description.isNotEmpty ? 0.h : null,
                    child: ClipRRect(
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(8.r),
                          topRight: Radius.circular(8.r),
                        ),
                        child: ProductDescriptionWidget(
                          name: pd.product.name,
                          description: pd.product.description,
                          isFavorite: false,
                        )),
                  ),
                ],
              ),
              Material(
                  color: Palette.pagebackgroundcolor,
                  child: SizedBox(
                    width: 375.w,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        pd.productTypes.isNotEmpty
                            ? const TempratureOptionWidget()
                            : SizedBox(
                                height: 8.h,
                              ),
                        Padding(
                          padding: EdgeInsets.only(left: 28.w),
                          child: Text(
                            "Quantity",
                            style: TextStyle(
                                fontWeight: FontWeight.w500,
                                fontSize: 16.sp,
                                color: Color(0xFF414141)),
                          ),
                        ),
                        const ProductCountWidget(),
                        Padding(
                          padding: EdgeInsets.only(left: 28.w),
                          child: Text("Size",
                              style: getpoppins(
                                TextStyle(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 16.sp,
                                  color: Color(0xFF414141),
                                ),
                              )),
                        ),
                        const SizeOptionWIdget(),
                        pd.toppings.isEmpty
                            ? const SizedBox()
                            : ToppingsMultiSelect(),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                                padding: EdgeInsets.only(
                                    //          left: 22, right: 22
                                    left: 28.w),
                                margin:
                                    EdgeInsets.only(top: 16.w, bottom: 16.w),
                                child: Text(
                                  "Add Extra",
                                  style: getpoppins(TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: darkgrey,
                                      //          fontSize: 14.5
                                      fontSize: 14.sp)),
                                )),
                            AddonsWidget()
                          ],
                        )
                      ],
                    ),
                  ))
            ]),
          );
        }
      }),
    );
  }
}

class ProductDescriptionWidget extends StatelessWidget {
  final String description;
  final String name;
  final bool isFavorite;
  ProductDescriptionWidget({
    Key? key,
    required this.description,
    required this.name,
    required this.isFavorite,
  }) : super(key: key);
  // final controller = Get.find<ProductDetailPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375.w,
        height: description.isEmpty ? null : 133.h,
        decoration: BoxDecoration(
          color: Color(0xA5000000),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.w, sigmaY: 0.h),
          blendMode: BlendMode.srcIn,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 28.w,
                      top: 8.h,
                      bottom: description.isEmpty ? 8.h : 0.h,
                    ),
                    child: Text(
                      "$name",
                      style: getpoppins(TextStyle(
                        color: Color(0xE5FFFFFF),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      // controller.toggleFavoriteForId(
                      //     id: controller.productDetail.id!);
                    },
                    child: Container(
                      width: 28.w,
                      height: 28.w,
                      margin: EdgeInsets.only(
                        right: 28.w,
                        top: 16.h,
                        bottom: description.isEmpty ? 8.h : 0.h,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.3)),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          color: isFavorite ? Colors.red : Colors.white,
                          size: 16.w,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              description.isEmpty
                  ? SizedBox()
                  : Padding(
                      padding:
                          EdgeInsets.only(left: 28.w, top: 7.h, right: 28.w),
                      child: Text(
                        "$description",
                        style: getpoppins(
                          TextStyle(
                            fontSize: 12.sp,
                            color: Color(0xE5FFFFFF),
                          ),
                        ),
                        maxLines: 3,
                      ),
                    ),
            ],
          ),
        ));
  }
}
