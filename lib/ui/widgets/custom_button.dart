import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class CustomReusableBtn extends StatelessWidget {
  final String buttonText;
  final void Function()? onPressed;
  final double height, width;
  const CustomReusableBtn(
      {Key? key,
      required this.buttonText,
      required this.width,
      required this.height,
      required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        height: height,
        width: width,
        alignment: Alignment.center,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: 15.sp,
             
            fontWeight: FontWeight.w400,
            color: Colors.white,
          ),
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
      ),
    );
  }
}
