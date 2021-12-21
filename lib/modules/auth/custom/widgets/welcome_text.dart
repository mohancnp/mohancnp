import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/fonts.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome to\nMetro Coffee",
      style: TextStyle(
        fontFamily: CustomFont.freightDispBold,
        color: Colors.white,
        fontSize: 42.sp,
      ),
    );
  }
}
