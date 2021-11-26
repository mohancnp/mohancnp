import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';

extension CustomStyles on TextTheme {
  TextStyle get normalText {
    return TextStyle(
      fontSize: 10.sp,
      color: Palette.darkGrey1,
      fontFamily: MetroFontsFamily.poppinsRegular,
      fontWeight: FontWeight.w400,
    );
  }

  TextStyle get normalTextHeading {
    return TextStyle(
      fontSize: 13.sp,
      color: Palette.darkGrey1,
      fontFamily: MetroFontsFamily.poppinsRegular,
      fontWeight: FontWeight.bold,
    );
  }
}
