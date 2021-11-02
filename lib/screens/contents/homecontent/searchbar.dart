import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
        height: 36.h,
        margin:
            EdgeInsets.only(top: 23.h, left: 28.w, right: 28.w, bottom: 23.h),
        padding: EdgeInsets.only(
            //       bottom: 4,
            top: 10.h,
            bottom: 10.h),
        width: screenwidth,
        decoration: BoxDecoration(
            color: Color(0xffFFEEF1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                  color: Color(0x24550E1C),
                  offset: Offset(0, 3.r),
                  blurRadius: 15.r)
            ]),
        child: Row(children: [
          GestureDetector(
              child: Container(
            margin: EdgeInsets.symmetric(
                //        horizontal: 12
                horizontal: screenwidth * 0.02919),
            child: Icon(
              Ionicons.search,
              color: Color(0xff404D4D),
              //        size: 22,
              size: 13.03.w,
            ),
          )),
          Expanded(
              child: Container(
                  child: TextField(
            style: TextStyle(
                fontFamily: poppinsregular,
                color: Colors.black87,
                //     fontSize: 11.5
                fontSize: 10.sp),
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(bottom: 11.5.h),
              border: InputBorder.none,
              hintText: 'What will energize you today?',
              hintStyle: TextStyle(
                  fontFamily: poppinslight,
                  color: Color(0xC2404D4D),
                  //     fontSize: 11.5
                  fontSize: 10.sp),
            ),
          )))
        ]));
  }
}
