import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/modules/products/product_detail_page_controller.dart';

class AddonsWidget extends StatelessWidget {
  const AddonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ProductDetailPageController>(
        init: ProductDetailPageController(),
        builder: (controller) {
          var addons = controller.productDetail.addons;
          return addons == null
              ? SizedBox()
              : Container(
                  height: 140.h,
                  padding: EdgeInsets.only(left: 28.w),
                  child: ListView.builder(
                      itemCount: addons.length,
                      // padding: EdgeInsets.only(right: 10.w),
                      clipBehavior: Clip.none,

                      // shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return GestureDetector(
                          onTap: () => controller.toogleAddonSelection(index),
                          child: Padding(
                            padding: EdgeInsets.only(right: 16.w),
                            child: Stack(clipBehavior: Clip.none, children: [
                              Container(
                                padding: EdgeInsets.only(
                                    //          left: 12,bottom: 4,right: 4
                                    left: 12.w,
                                    bottom: 4.h,
                                    right: 4.w),
                                //                      height: 88,width: 110,
                                height: 87.h,
                                width: 100.w,
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    border: Border.all(
                                        color: addons[index].selected
                                            ? (Color(0xFF550E1C))
                                            : Colors.white,
                                        width: 2.0),
                                    borderRadius: BorderRadius.all(
                                      Radius.circular(9.r),
                                    ),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Colors.black12,
                                          blurRadius: 20.r,
                                          offset: Offset(0, 3.r))
                                    ]),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Container(
                                      child: Text(
                                        "${addons.elementAt(index).name} ",
                                        style: getpoppins(TextStyle(
                                            fontWeight: FontWeight.w300,
                                            color: darkgrey,
                                            //              fontSize: 12
                                            fontSize: 12.sp)),
                                      ),
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Container(
                                          child: Text(
                                            "\$ ${addons[index].cost}",
                                            style: getpoppins(TextStyle(
                                                fontWeight: FontWeight.w500,
                                                color: darkgrey,
                                                //             fontSize: 13.5
                                                fontSize: 13.sp)),
                                          ),
                                        ),
                                        Icon(
                                          CupertinoIcons.add_circled_solid,
                                          color: coffeecolor,
                                          //      size: 21,
                                          size: 21.sp,
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                              addons[index].image != null
                                  ? Positioned(
                                      left: 24.w,
                                      child: Image.network(
                                        "$baseUrl${addons[index].image}",
                                        width: 86.w,
                                        height: 46.h,
                                      ),
                                    )
                                  : SizedBox(),
                            ]),
                          ),
                        );
                      }));
        });
  }
}
