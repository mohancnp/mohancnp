import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class LocationWidget extends StatelessWidget {
  const LocationWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 64.h,
      margin: EdgeInsets.only(left: 28.w, right: 28.w),
      child: Row(
        // crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 50.w,
            height: 50.w,
            margin: EdgeInsets.only(
              left: 9.w,
              top: 7.h,
              bottom: 7.h,
            ),
            alignment: Alignment.center,
            child:
                Icon(Icons.location_on, color: Palette.coffeeColor, size: 15.w),
            decoration: BoxDecoration(
                color: Color(0xFFE8E8E8),
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      offset: Offset(0, 3),
                      blurRadius: 10)
                ]),
          ),
          Padding(
            padding: EdgeInsets.only(left: 19.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "2 Saint Street. st",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w500,
                    color: Palette.textColor,
                    //       fontSize: 14.5
                    fontSize: 14.sp,
                  )),
                ),
                Text(
                  "Park In, United Kingdom",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Palette.textColor,
                    //       fontSize: 14.5
                    fontSize: 10.sp,
                  )),
                ),
                Text(
                  "+99 56581464",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Palette.textColor,
                    //       fontSize: 14.5
                    fontSize: 10.sp,
                  )),
                ),
              ],
            ),
          ),
        ],
      ),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 3),
                blurRadius: 10)
          ]),
    );
  }
}
