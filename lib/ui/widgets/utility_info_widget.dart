import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import 'custom_button.dart';

class UtilityInfoWidget extends StatelessWidget {
  final String title, content, svgImageUri;
  final String? buttonText;
  final void Function()? onPressed;
  const UtilityInfoWidget({
    Key? key,
    required this.title,
    required this.content,
    this.onPressed,
    required this.svgImageUri,
    this.buttonText,
  }) : super(key: key);

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
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 20.sp,
                    color: Palette.textColor,
                  ),
                ),
                Text(
                  content,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 15.sp,
                    color: Palette.textColor,
                  ),
                ),
              ],
            ),
            onPressed == null
                ? const SizedBox()
                : Padding(
                    padding: EdgeInsets.only(top: 56.h),
                    child: CustomReusableBtn(
                      height: 48.h,
                      width: 232.w,
                      buttonText: buttonText ?? "",
                      onPressed: onPressed,
                    ),
                  ),
          ],
        ),
      ),
    );
  }
}
