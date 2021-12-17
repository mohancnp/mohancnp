import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
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
        height: 46.h,
        decoration: BoxDecoration(
          color: Palette.deepOrange,
          borderRadius: BorderRadius.all(Radius.circular(25)),
          boxShadow: [
            BoxShadow(
              color: Color(0x4DC3916A),
              blurRadius: 30.r,
              offset: Offset(0, 9.r),
            )
          ],
        ),
        child: Center(
          child: Text(
            "$centerBtnText",
            style: TextStyle(
              fontFamily: poppinsregular,
              color: Colors.white,
              fontSize: 16.sp,
            ),
          ),
        ),
      ),
    );
  }
}
