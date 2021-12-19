import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WelcomeText extends StatelessWidget {
  const WelcomeText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      "Welcome to\nMetro Coffee",
      style: TextStyle(
        fontFamily: freightbold,
        color: Colors.white,
        fontSize: 42.sp,
      ),
    );
  }
}
