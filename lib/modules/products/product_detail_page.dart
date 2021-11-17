import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/icons/carticons.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/models/order_model.dart';
import 'package:metrocoffee/core/models/product_detail_model.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';
import 'package:metrocoffee/modules/shareables/dialogs/loading.dart';
import 'product_detail_page_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';
import 'widgets/addons_widget.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'widgets/milk_options_widget.dart';
import 'widgets/product_count_widget.dart';
import 'widgets/size_options_widget.dart';
import 'widgets/temp_options_widget.dart';
import 'widgets/toppings_option_widget.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key}) : super(key: key);
  final controller = Get.find<ProductDetailPageController>();
  final cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    timeDilation = 1;
    var idAndTag = Get.arguments;
    var tag, id;
    if (idAndTag != null) {
      tag = idAndTag[1];
      id = idAndTag[0];
    }
    double screenwidth = MediaQuery.of(context).size.width;
    return GetBuilder<ProductDetailPageController>(
        init: ProductDetailPageController(),
        initState: (v) {
          controller.productDetail = ProductDetail.empty();
          controller.toppings = [];
          controller.milks = [];
          controller.tempOptions = null;
          controller.userOrder.value = UserOrder.local(
            productVariantId: -1,
            qty: 1,
            orderProductAddons: [],
            orderProductOptions: [],
          );
          cartController.getAllCartProducts();
        },
        builder: (controller) {
          // print("${controller.productDetail.ingredients}");
          return controller.dataState == DataState.loaded
              ? Scaffold(
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
                    child: GetX<ProductDetailPageController>(
                        init: ProductDetailPageController(),
                        builder: (pC) {
                          var order = pC.userOrder;
                          // var variant =
                          //     controller.variants.elementAt(pC.selectedVariant);
                          // pC.productDetail.allVariants
                          return Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              Text(
                                "\$ ${order.value.amount?.toStringAsPrecision(2)} ",
                                style: getpoppins(TextStyle(
                                    color: Palette.textColor,
                                    fontSize: 26.sp,
                                    fontWeight: FontWeight.w500)),
                              ),
                              Container(
                                height: 47.h,
                                width: 212.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.r),
                                  color: Palette.coffeeColor,
                                ),
                                child: TextButton.icon(
                                    onPressed: () async {
                                      await controller.addProductToCart();
                                      await cartController.getAllCartProducts();
                                    },
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
                        }),
                  ),
                  body: SingleChildScrollView(
                    child: Column(children: [
                      Stack(
                        children: [
                          Hero(
                            tag: "$id$tag",
                            child: Container(
                              height: 373.h,
                              width: 375.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.only(
                                      bottomLeft: Radius.circular(8.w),
                                      bottomRight: Radius.circular(8.w)),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        "$baseUrl${controller.productDetail.imageUri}",
                                      ))),
                            ),
                          ),
                          Positioned(
                            top: 49.h,
                            // top: 49.h,
                            child: SizedBox(
                              width: 375.w,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                    onTap: () {
                                      //navigate for only the logged in users
                                      Get.toNamed(PageName.productCartPage);
                                    },
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
                                        Obx(() {
                                          int count =
                                              cartController.cartCount.value;
                                          return Positioned(
                                            left: 10.w,
                                            child: count > 0
                                                ? AnimatedContainer(
                                                    height: 12.w,
                                                    width: 12.w,
                                                    alignment: Alignment.center,
                                                    child: Text("$count",
                                                        style: TextStyle(
                                                            fontSize: 8.sp)),
                                                    decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        boxShadow: [
                                                          BoxShadow(
                                                            offset:
                                                                Offset(1, 1),
                                                            color:
                                                                Colors.black12,
                                                          ),
                                                          BoxShadow(
                                                            offset:
                                                                Offset(-1, -1),
                                                            color:
                                                                Colors.black12,
                                                          )
                                                        ],
                                                        shape: BoxShape.circle),
                                                    duration: Duration(
                                                        milliseconds: 500),
                                                  )
                                                : SizedBox(),
                                          );
                                        }),
                                      ],
                                    ),
                                  ),
                                  // Icon(Icons)
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: controller.productDetail.ingredients != null
                                ? 240.h
                                : null,
                            bottom: controller.productDetail.ingredients == null
                                ? 0.h
                                : null,
                            child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(8.r),
                                  topRight: Radius.circular(8.r),
                                ),
                                child: ProductDescriptionWidget()),
                          ),
                        ],
                      ),
                      Material(
                          color: Palette.pagebackgroundcolor,
                          child: SizedBox(
                            width: screenwidth,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                controller.tempOptions != null
                                    ? TempratureOptionWidget()
                                    : SizedBox(
                                        height: 8.h,
                                      ),
                                Padding(
                                  padding: EdgeInsets.only(left: 28.w),
                                  child: Text("Quantity",
                                      style: getpoppins(
                                        TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            color: Color(0xFF414141)),
                                      )),
                                ),
                                ProductCountWidget(screenwidth: screenwidth),
                                Padding(
                                  padding: EdgeInsets.only(left: 28.w),
                                  child: Text("Size",
                                      style: getpoppins(
                                        TextStyle(
                                            fontWeight: FontWeight.w500,
                                            fontSize: 16.sp,
                                            color: Color(0xFF414141)),
                                      )),
                                ),
                                SizeOptionWIdget(),
                                controller.productDetail.addons == null
                                    ? SizedBox()
                                    : controller.productDetail.addons!.isEmpty
                                        ? SizedBox()
                                        : ToppingsOptionWidget(),
                                controller.productDetail.addons == null
                                    ? SizedBox()
                                    : controller.productDetail.addons!.isEmpty
                                        ? SizedBox()
                                        : MilkOptionWidget(),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                        padding: EdgeInsets.only(
                                            //          left: 22, right: 22
                                            left: 28.w),
                                        margin: EdgeInsets.only(
                                            top: 16.w, bottom: 16.w),
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
                  ),
                )
              : LoadingPage();
        });
  }
}

class ProductDescriptionWidget extends StatelessWidget {
  ProductDescriptionWidget({
    Key? key,
  }) : super(key: key);
  final controller = Get.find<ProductDetailPageController>();

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375.w,
        height: controller.productDetail.ingredients == null ? null : 133.h,
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
                      bottom: controller.productDetail.ingredients == null
                          ? 8.h
                          : 0.h,
                    ),
                    child: Text(
                      "${controller.productDetail.name}",
                      style: getpoppins(TextStyle(
                        color: Color(0xE5FFFFFF),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      controller.toggleFavoriteForId(
                          id: controller.productDetail.id!);
                    },
                    child: Container(
                      width: 28.w,
                      height: 28.w,
                      margin: EdgeInsets.only(
                        right: 28.w,
                        top: 16.h,
                        bottom: controller.productDetail.ingredients == null
                            ? 8.h
                            : 0.h,
                      ),
                      decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          color: Colors.white.withOpacity(0.3)),
                      child: Center(
                        child: Icon(
                          Icons.favorite,
                          color: (controller.productDetail.isFavorite ?? false)
                              ? Colors.red
                              : Colors.white,
                          size: 16.w,
                        ),
                      ),
                    ),
                  )
                ],
              ),
              controller.productDetail.ingredients == null
                  ? SizedBox()
                  : Padding(
                      padding:
                          EdgeInsets.only(left: 28.w, top: 7.h, right: 28.w),
                      child: Text(
                        "${controller.productDetail.ingredients ?? ' '}",
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
