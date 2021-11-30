import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';

class RecommendationCategory extends StatelessWidget {
  final String name;
  final bool pressed;
  final String imagePath;
  const RecommendationCategory(
      {Key? key,
      required this.name,
      required this.imagePath,
      this.pressed = false})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 114.w,
      height: 33.h,
      margin: EdgeInsets.only(left: 10.w),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
              padding: EdgeInsets.only(
                  left: 16.w, right: 10.w, top: 8.h, bottom: 8.h),
              child: Image.asset(
                "$imagePath",
              )),
          // SvgPicture.asset("assetName"),
          Center(
            child: Padding(
              padding: EdgeInsets.only(right: 16.w, top: 8.h, bottom: 8.h),
              child: Text(
                "$name",
                style: getpoppins(TextStyle(
                    color: pressed ? Color(0xE5FFFFFF) : Color(0xFF344141),
                    fontSize: 12.sp,
                    fontFamily: poppinsregular)),
              ),
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(17.r),
          boxShadow: pressed
              ? [
                  BoxShadow(
                      color: Color(0x33550E1C),
                      offset: Offset(0, 3),
                      blurRadius: 6.r),
                ]
              : [
                  BoxShadow(
                      color: Color(0x1A000000),
                      offset: Offset(0, 3),
                      blurRadius: 6.r),
                ],
          color: pressed ? coffeecolor : Colors.white),
    );
  }
}
