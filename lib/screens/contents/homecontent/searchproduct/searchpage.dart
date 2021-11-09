import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/icons/recommendationicons.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/home/widgets/newcard.dart';
import 'package:metrocoffee/modules/home/widgets/searchbar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/screens/contents/homecontent/searchproduct/recommendation_category.dart';
import 'package:metrocoffee/ui/src/palette.dart';
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
              height: 170.h,
              margin: EdgeInsets.only(bottom: 17.h),
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        top: 60.h, left: 28.w, right: 44.w, bottom: 3.h),
                    child: Row(
                      children: [
                        GestureDetector(
                          onTap: () => Get.back(),
                          child: Icon(
                            Icons.arrow_back_ios_new,
                            size: 16.w,
                            color: Colors.white,
                          ),
                        ),
                        Expanded(
                          child: Text(
                            "SEARCH",
                            textAlign: TextAlign.center,
                            style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xFFF5F5F5),
                                fontSize: 16.sp)),
                          ),
                        )
                      ],
                    ),
                  ),
                  SearchBar(enabled: true),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 28.w, bottom: 16.h),
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
                child: Wrap(
                  runSpacing: 15.h,
                  children: List.generate(5, (index) {
                    return RecommendationCategory(
                      name: index == 0 ? "Drinks" : "Bakery",
                      imagePath: index == 0
                          ? RecommendationIcons.mostpopular
                          : RecommendationIcons.bakery,
                      pressed: index == 0,
                    );
                  }),
                )),
            Container(
              margin: EdgeInsets.only(top: 26.h, left: 40.w, right: 40.w),
              child: GridView.count(
                shrinkWrap: true,
                padding: EdgeInsets.zero,
                primary: false,
                crossAxisSpacing: 20.w,
                mainAxisSpacing: 0,
                crossAxisCount: 2,
                childAspectRatio: 0.647619,
                children: List.generate(3, (index) {
                  return GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 136.w,
                      // clipBehavior: Clip.none,
                      margin: EdgeInsets.only(
                        bottom: 20.h,
                      ),

                      padding: EdgeInsets.all(10.w),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8.r),
                          color: Colors.white,
                          border:
                              Border.all(width: 0, color: Colors.transparent),
                          shape: BoxShape.rectangle,
                          boxShadow: [
                            BoxShadow(
                                offset: Offset(0, 3.h),
                                color: Color(0x29000000),
                                // spreadRadius: 2.r,
                                blurRadius: 15.r)
                          ]),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(4.r),
                            child: Image.asset(
                              "assets/images/nathan-dumlao-c2Y16tC3yO8-unsplash@3x.png",
                              // color: Colors.blue,
                              fit: BoxFit.cover,
                              // loadingBuilder: (context, widget, imageProgress) {
                              //   if (imageProgress == null) {
                              //     return widget;
                              //   }
                              //   return Container(
                              //     color: Colors.red,
                              //     width: 116.w,
                              //     height: 116.h,
                              //   );
                              // },
                              height: 116.h,
                              width: 116.w,
                            ),
                          ),
                          SizedBox(
                            height: 9.h,
                          ),
                          Flexible(
                              fit: FlexFit.loose,
                              child: Text(
                                "Coffee",
                                style: getpoppins(TextStyle(
                                  color: Color(0xFF404D4D),
                                  fontSize: 12.sp,
                                  fontFamily: poppinsmedium,
                                )),
                              )),
                          SizedBox(height: 9.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "\$ 10",
                                style: getpoppins(TextStyle(
                                    color: coffeecolor,
                                    fontSize: 20.sp,
                                    fontFamily: poppinsmedium)),
                              ),
                              Container(
                                width: 28.w,
                                height: 28.w,
                                // margin: EdgeInsets.only(right: 10.w),
                                child: Icon(
                                  Icons.add,
                                  color: Colors.white,
                                  size: 16.w,
                                ),
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: coffeecolor,
                                    boxShadow: [
                                      BoxShadow(
                                          offset: Offset(0, 3),
                                          color: Color(0x62722030),
                                          blurRadius: 4.r)
                                    ]),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            )
          ],
        ),
      ),
    );
  }
}
