import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class UtilityInfoWidget extends StatelessWidget {
  final String title, content, buttonText, svgImageUri;
  const UtilityInfoWidget(
      {Key? key,
      required this.title,
      required this.content,
      required this.svgImageUri,
      required this.buttonText})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Palette.pagebackgroundcolor,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              svgImageUri,
              width: 216.w,
              height: 96.h,
              fit: BoxFit.cover,
            ),
            SizedBox(
              height: 50.h,
            ),
            Column(
              children: [
                Text("$title",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        fontSize: 20.sp,
                        color: Palette.textColor))),
                Text("$content",
                    textAlign: TextAlign.center,
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 15.sp,
                        color: Palette.textColor))),
              ],
            ),
            Container(
              height: 47.h,
              width: 233.w,
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 59.h),
              child: Text(
                "Start Browsing",
                style: getpoppins(TextStyle(
                  fontSize: 15.sp,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                )),
              ),
              decoration: BoxDecoration(
                color: Palette.coffeeColor,
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0, 9.h),
                    blurRadius: 30.r,
                    color: Palette.coffeeColorShadow,
                  ),
                ],
                borderRadius: BorderRadius.circular(10.r),
              ),
            )
          ],
        ),
      ),
    );
  }
}
