import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';

class SignInBtn extends StatelessWidget {
  final void Function() onpressed;
  const SignInBtn({Key? key, required this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onpressed,
      child: Container(
        margin: EdgeInsets.only(
//                        top: 34
            top: 34.h),
//                    height: 46, width: 181,
        height: 46.h,
        width: 181.w,
        decoration: BoxDecoration(
            color: Color(0xffD4874C),
            borderRadius: BorderRadius.all(Radius.circular(25)),
            boxShadow: [
              BoxShadow(
                  color: Color(0xffC3916A4D),
                  blurRadius: 30.r,
                  offset: Offset(0, 9.r))
            ]),
        child: Center(
          child: Container(
            child: Text(
              "SIGN IN",
              style: TextStyle(
                  fontFamily: poppinsregular,
                  color: Colors.white,
                  //                         fontSize: 16
                  fontSize: 16.sp),
            ),
          ),
        ),
      ),
    );
  }
}
