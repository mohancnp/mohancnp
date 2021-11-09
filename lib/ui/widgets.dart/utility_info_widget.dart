import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import 'custom_button.dart';

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
    return Scaffold(
      backgroundColor: Palette.pagebackgroundcolor,
      appBar: AppBar(
        backgroundColor: Palette.pagebackgroundcolor,
        elevation: 0.sp,
      ),
      body: Center(
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
            Padding(
              padding: EdgeInsets.only(top: 59.h),
              child: CustomReusableBtn(
                height: 47.h,
                width: 233.w,
                buttonText: "Start Browsing",
                onPressed: () {},
              ),
            ),
          ],
        ),
      ),
    );
  }
}
