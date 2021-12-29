import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/product_search/search_page_controller.dart';
import 'package:metrocoffee/ui/src/fonts.dart';

class SearchBar extends StatelessWidget {
  final bool enabled;
  const SearchBar({Key? key, this.enabled = false}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 36.h,
        width: 375.w,
        decoration: BoxDecoration(
            color: const Color(0xffFFEEF1),
            borderRadius: BorderRadius.all(Radius.circular(15.r)),
            boxShadow: [
              BoxShadow(
                color: const Color(0x24550E1C),
                offset: Offset(0, 3.h),
                blurRadius: 15.r,
              )
            ]),
        child: GestureDetector(
          onTap: () => SearchPageController.to
              .navigateToSearchPage(PageName.searchPage, enabled),
          child: Center(
            child: TextField(
              enabled: enabled,
              controller: SearchPageController.to.searchBarController,
              onChanged: (value) async {
                SearchPageController.to.performSearch();
              },
              // onSubmitted: (value) => SearchPageController.to.performSearch(),
              // onEditingComplete: () => SearchPageController.to.performSearch(),
              style: TextStyle(
                color: Colors.black87,
                fontSize: 10.sp,
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                // contentPadding:
                //     EdgeInsets.only(right: 8.w, top: 0, left: 0, bottom: 0),
                prefixIcon: Icon(
                  Icons.search,
                  color: Colors.black26,
                  size: 13.r,
                ),
                hintText: 'What will energize you today?',
                hintStyle: TextStyle(
                  fontFamily: CustomFont.poppinsLight,
                  color: const Color(0xC2404D4D),
                  height: 1.8,
                  fontSize: 11.sp,
                ),
              ),
            ),
          ),
        ));
  }
}
