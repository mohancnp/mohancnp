import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class AuthBtn extends StatelessWidget {
  final void Function() onpressed;
  final String centerBtnText;
  const AuthBtn(
      {Key? key, required this.centerBtnText, required this.onpressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        height: 48.h,
        decoration: BoxDecoration(
          color: Palette.deepOrange,
          borderRadius: BorderRadius.all(Radius.circular(24.r)),
          boxShadow: [
            BoxShadow(
              color: const Color(0x4DC3916A),
              blurRadius: 32.r,
              offset: Offset(0, 8.r),
            )
          ],
        ),
        child: Center(
          child: Text(
            centerBtnText,
            style: TextStyle(
               
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
