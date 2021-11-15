import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchBarTest extends StatelessWidget {
  final bool enabled;
  const SearchBarTest({Key? key, this.enabled: false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;
    return Container(
        height: (36 / 812).h,
        margin: EdgeInsets.only(
            top: (23 / 812).h,
            left: (28 / 375).w,
            right: (28 / 375).w,
            bottom: (23 / 812).h),
        padding: EdgeInsets.only(
            //       bottom: 4,
            top: (10 / 812).h,
            bottom: (10 / 812).h),
        width: 100.w,
        decoration: BoxDecoration(
            color: Color(0xffFFEEF1),
            borderRadius: BorderRadius.all(Radius.circular(15)),
            boxShadow: [
              BoxShadow(
                color: Color(0x24550E1C),
                offset: Offset(0, 3),
                blurRadius: 15,
              )
            ]),
        child: GestureDetector(
          onTap: () => Get.toNamed(PageName.searchPage),
          child: Row(children: [
            Container(
              margin: EdgeInsets.symmetric(
                  //        horizontal: 12
                  horizontal: (12 / 375).w),
              child: Icon(
                Ionicons.search,
                color: Color(0xff404D4D),
                //        size: 22,
                size: (13 / 375).w,
              ),
            ),
            Expanded(
                child: Container(
                    child: TextField(
              enabled: enabled,
              style: TextStyle(
                  fontFamily: poppinsregular,
                  color: Colors.black87,
                  //     fontSize: 11.5
                  fontSize: 10.sp),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.only(bottom: (11.5 / 812).h),
                border: InputBorder.none,
                hintText: 'What will energize you today?',
                hintStyle: TextStyle(
                    fontFamily: poppinslight,
                    color: Color(0xC2404D4D),
                    //     fontSize: 11.5
                    fontSize: 10.sp),
              ),
            )))
          ]),
        ));
  }
}
