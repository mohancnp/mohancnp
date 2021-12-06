import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:ionicons/ionicons.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/product_search/search_page_controller.dart';

class SearchBar extends StatelessWidget {
  final bool enabled;
  const SearchBar({Key? key, this.enabled: false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36.h,
        width: 375.w,
        decoration: BoxDecoration(
            color: Color(0xffFFEEF1),
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            boxShadow: [
              BoxShadow(
                color: Color(0x24550E1C),
                offset: Offset(0, 3.h),
                blurRadius: 15.r,
              )
            ]),
        child: GestureDetector(
          onTap: () {
            if (!enabled) {
              Get.toNamed(PageName.searchPage);
            }
          },
          child: Center(
            child: TextField(
              enabled: enabled,
              controller: SearchPageController.to.searchBarController,
              onEditingComplete: () => SearchPageController.to.performSearch(),
              style: TextStyle(
                fontFamily: poppinsregular,
                color: Colors.black87,
                fontSize: 10.sp,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                // contentPadding:
                //     EdgeInsets.only(right: 8.w, top: 0, left: 0, bottom: 0),
                prefixIcon: Icon(
                  Ionicons.search,
                  color: Colors.black26,
                  size: 13.r,
                ),
                hintText: 'What will energize you today?',
                hintStyle: TextStyle(
                  fontFamily: poppinslight,
                  color: Color(0xC2404D4D),
                  height: 1.8,
                  fontSize: 11.sp,
                ),
              ),
            ),
          ),
        ));
  }
}
