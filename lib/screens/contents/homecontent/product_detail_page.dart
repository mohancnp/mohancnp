import 'dart:ui';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/product_detail_page_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/screens/contents/homecontent/widgets/addons_widget.dart';
import 'widgets/milk_options_widget.dart';
import 'widgets/product_count_widget.dart';
import 'widgets/size_options_widget.dart';
import 'widgets/temp_options_widget.dart';
import 'widgets/toppings_option_widget.dart';

class ProductDetailPage extends StatelessWidget {
  ProductDetailPage({Key? key}) : super(key: key);
  final p = Get.put(ProductDetailPageController());

  @override
  Widget build(BuildContext context) {
    timeDilation = 2;

    var idAndTag = Get.arguments;
    var tag = idAndTag[1];
    var id = idAndTag[0];
    double screenwidth = MediaQuery.of(context).size.width;
    return Material(
      child: Stack(clipBehavior: Clip.none, children: [
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
                    image: AssetImage(
                        "assets/images/productimages/cardddd@3x-min.png"))),
          ),
        ),
        Positioned(
          top: 49.h,
          child: SizedBox(
            width: 375.w,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // mainAxisSize: MainAxisSize.max,
              children: [
                Padding(
                  padding: EdgeInsets.only(
                    left: 28.w,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.back();
                    },
                    child: Icon(
                      CupertinoIcons.back,
                      color: Colors.white,
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(right: 28.w),
                  child: Icon(
                    CupertinoIcons.cart_fill,
                    color: Colors.white,
                  ),
                ),
                // Icon(Icons)
              ],
            ),
          ),
        ),
        Positioned(
          top: 238.h,
          child: ClipRRect(
              borderRadius: BorderRadius.circular(8.r),
              child: ProductDescriptionWidget()),
        ),
        Positioned(
            top: 373.h,
            child: Material(
              color: Colors.white,
              child: SizedBox(
                width: screenwidth,
                child: ListView(
                  // crossAxisAlignment: CrossAxisAlignment.start,
                  // mainAxisSize: MainAxisSize.max,
                  scrollDirection: Axis.vertical,
                  physics: AlwaysScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: [
                    TempratureOptionWidget(),
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
                    ToppingsOptionWidget(screenwidth: screenwidth),
                    MilkOptionWidget(screenwidth: screenwidth),
                    Container(
                      width: screenwidth,
                      margin: EdgeInsets.only(top: 15.h),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                padding: EdgeInsets.only(
                                    //          left: 22, right: 22
                                    left: screenwidth * 0.0535,
                                    right: screenwidth * 0.0535),
                                margin: EdgeInsets.only(left: 5),
                                child: Text(
                                  "Add Extra",
                                  style: getpoppins(TextStyle(
                                      fontWeight: FontWeight.w500,
                                      color: darkgrey,
                                      //          fontSize: 14.5
                                      fontSize: screenwidth * 0.0352)),
                                ),
                              ),
                            ],
                          ),
                          AddonsWidget()
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ))
      ]),
    );
  }
}

class ProductDescriptionWidget extends StatelessWidget {
  const ProductDescriptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 375.w,
        height: 133.h,
        decoration: BoxDecoration(
          color: Color(0xA5000000),
        ),
        child: BackdropFilter(
          filter: ImageFilter.blur(sigmaX: 10.w, sigmaY: 0.h),
          blendMode: BlendMode.srcIn,
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 28.w, top: 16.h),
                    child: Text(
                      "Cafe Latte",
                      style: getpoppins(TextStyle(
                        color: Color(0xE5FFFFFF),
                        fontSize: 20.sp,
                        fontWeight: FontWeight.w500,
                      )),
                    ),
                  ),
                  Container(
                    width: 28.w,
                    height: 28.w,
                    margin: EdgeInsets.only(right: 28.w, top: 16.h),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white.withOpacity(0.3)),
                    child: Center(
                      child: Icon(
                        Icons.favorite,
                        color: Colors.white,
                        size: 16.w,
                      ),
                    ),
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 28.w, top: 16.h, right: 28.w),
                child: Text(
                  "Caffe latte is a coffee drink made with espresso and steamed milk. The word comes from the Italian caffè e which means 'coffee & milk'.",
                  style: getpoppins(
                    TextStyle(
                      fontSize: 12.sp,
                      color: Color(0xE5FFFFFF),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
