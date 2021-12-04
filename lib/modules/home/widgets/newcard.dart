import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ProductCard extends StatelessWidget {
  final String imageUri;
  final String name;
  final int id;
  final dynamic price;
  final void Function() onPressed;
  const ProductCard(
      {Key? key,
      required this.imageUri,
      required this.name,
      required this.id,
      required this.onPressed,
      required this.price})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 140.w,
      // height: 201.w,
      //max height is given from the listview in the parent.
      margin: EdgeInsets.only(
        left: 16.w,
      ),
      // // clipBehavior: Clip.none,
      padding: EdgeInsets.only(
        left: 10.w,
        top: 10.h,
        right: 10.w,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
          border: Border.all(width: 0, color: Colors.transparent),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3.h),
              color: Color(0x29000000),
              // spreadRadius: 2.r,
              blurRadius: 16.r,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Material(
              child: InkWell(
                onTap: onPressed,
                child: Image.network(
                  "$baseUrl$imageUri",
                  height: 116.w,
                  width: 116.w,
                  // color: Colors.blue,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, widget, imageProgress) {
                    if (imageProgress == null) {
                      return widget;
                    }
                    return Center(
                      child: SizedBox(
                        height: 116.r,
                        width: 116.r,
                        child: SpinKitCubeGrid(
                          color: Palette.coffeeColor,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            "$name",
            maxLines: 2,
            style: getpoppins(TextStyle(
              color: Color(0xFF404D4D),
              fontSize: 12.sp,
              fontFamily: poppinsmedium,
            )),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ $price",
                  style: getpoppins(TextStyle(
                      color: coffeecolor,
                      fontSize: 20.sp,
                      fontFamily: poppinsmedium)),
                ),
                GestureDetector(
                  onTap: () => null,
                  //  Get.find<HomeTabController>().addToCart(id)
                  child: Container(
                    width: 28.r,
                    height: 28.r,
                    // margin: EdgeInsets.only(right: 10.w),
                    child: Icon(
                      Icons.add,
                      color: Colors.white,
                      size: 16.w,
                    ),
                    decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: coffeecolor,
                        boxShadow: [
                          BoxShadow(
                              offset: Offset(0, 3.h),
                              color: Color(0x62722030),
                              blurRadius: 10.r)
                        ]),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
