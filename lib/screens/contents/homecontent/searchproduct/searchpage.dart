import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/icons/recommendationicons.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/screens/contents/homecontent/searchbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/screens/contents/homecontent/searchproduct/recommendation_category.dart';
import 'package:path/path.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      color: pagebackgroundcolor,
      child: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: coffeecolor,
              height: 200.h,
              margin: EdgeInsets.only(bottom: 30.h),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  AppBar(
                    leading: Icon(
                      Icons.arrow_back_ios_new,
                      size: 16.w,
                    ),
                    backgroundColor: coffeecolor,
                    elevation: 0,
                    title: Padding(
                      padding: EdgeInsets.only(left: 104.w),
                      child: Text(
                        "SEARCH",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xFFF5F5F5),
                            fontSize: 16.sp)),
                      ),
                    ),
                  ),
                  SearchBar(),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.w, bottom: 24.h),
              child: Text("Recommendation",
                  style: getpoppins(TextStyle(
                    fontSize: 15.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF344141),
                  ))),
            ),
            Container(
                margin: EdgeInsets.only(
                  left: 18.w,
                ),
                child: Row(
                  children: [
                    RecommendationCategory(
                      name: "Drinks",
                      imagePath: RecommendationIcons.mostpopular,
                      pressed: true,
                    ),
                    RecommendationCategory(
                      name: "Snacks",
                      imagePath: RecommendationIcons.snacks,
                    ),
                    RecommendationCategory(
                      name: "Bakery",
                      imagePath: RecommendationIcons.bakery,
                    ),
                  ],
                )),
            Container(
              padding: EdgeInsets.only(
                left: 18.w,
                top: 15.h,
              ),
              child: Row(
                children: [
                  RecommendationCategory(
                    name: "Trending",
                    imagePath: RecommendationIcons.trendingtoday,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
