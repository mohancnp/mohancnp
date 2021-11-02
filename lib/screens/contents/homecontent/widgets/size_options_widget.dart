import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';

class SizeOptionWIdget extends StatelessWidget {
  const SizeOptionWIdget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 320.w,
      margin: EdgeInsets.only(left: 28.w, top: 16.h),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        mainAxisSize: MainAxisSize.max,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color(0xFFE8E8E8),
              // border: Border.all(
              //     color: Color(0xFF707070), width: 1.5.w),
              // borderRadius: BorderRadius.circular(4.r),
            ),
            width: 92.w,
            height: 40.h,
            child: Center(
              child: Text(
                "S",
                style: getpoppins(TextStyle(
                    color: Color(0xFF404D4D), fontWeight: FontWeight.w400)),
              ),
            ),
          ),
          Container(
            width: 92.w,
            height: 40.h,
            decoration: BoxDecoration(
                color: Color(0xFFE8E8E8),
                border: Border.all(color: Color(0xFF707070), width: 1.5.w),
                borderRadius: BorderRadius.circular(4.r)),
            child: Center(
              child: Text(
                "M",
                style: getpoppins(TextStyle(
                    color: Color(0xFF404D4D), fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          Container(
            width: 92.w,
            height: 40.h,
            decoration: BoxDecoration(
              color: Color(0xFFE8E8E8),
              // border: Border.all(color: Color(0xFF707070), width: 1.5.w),
              borderRadius: BorderRadius.circular(4.r),
            ),
            child: Center(
              child: Text(
                "L",
                style: getpoppins(TextStyle(
                    color: Color(0xFF404D4D), fontWeight: FontWeight.w400)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
