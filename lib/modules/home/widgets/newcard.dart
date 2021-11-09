import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ProductCard extends StatelessWidget {
  final String imageUri;
  final String name;
  final int id;
  final tag;
  final dynamic price;
  final void Function() onPressed;
  const ProductCard(
      {Key? key,
      required this.imageUri,
      required this.name,
      required this.id,
      this.tag,
      required this.onPressed,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 136.w,
      // clipBehavior: Clip.none,
      margin: EdgeInsets.only(
        left: 15.w,
        bottom: 5.h,
      ),
      padding:
          EdgeInsets.only(left: 10.w, top: 10.h, right: 10.w, bottom: 10.h),
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
                blurRadius: 15.r)
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Hero(
              tag: "$id$tag",
              child: Material(
                child: InkWell(
                  onTap: onPressed,
                  child: Image.network(
                    "$baseUrl$imageUri",
                    // color: Colors.blue,
                    fit: BoxFit.cover,
                    loadingBuilder: (context, widget, imageProgress) {
                      if (imageProgress == null) {
                        return widget;
                      }
                      return Container(
                        width: 116.w,
                        height: 116.h,
                        child: SpinKitCubeGrid(
                          color: Palette.coffeeColor,
                        ),
                      );
                    },
                    height: 116.h,
                    width: 116.w,
                  ),
                ),
              ),
            ),
          ),
          Flexible(
              fit: FlexFit.loose,
              child: Text(
                "$name",
                style: getpoppins(TextStyle(
                  color: Color(0xFF404D4D),
                  fontSize: 12.sp,
                  fontFamily: poppinsmedium,
                )),
              )),
          SizedBox(height: 9.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "\$ $price",
                style: getpoppins(TextStyle(
                    color: coffeecolor,
                    fontSize: 20.sp,
                    fontFamily: poppinsmedium)),
              ),
              Container(
                width: 28.w,
                height: 28.w,
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
                          offset: Offset(0, 3),
                          color: Color(0x62722030),
                          blurRadius: 4.r)
                    ]),
              )
            ],
          ),
        ],
      ),
    );
  }
}
