import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddonsWidget extends StatelessWidget {
  const AddonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: 140.h,
        padding: EdgeInsets.only(left: 28.w),
        child: ListView.builder(
            itemCount: 5,
            // shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                  // margin: EdgeInsets.only(right: 10.w),
                  height: 94.h,
                  width: 134.w,
                  child: Stack(children: [
                    GestureDetector(
                      onTap: () {},
                      child: Container(
                        padding: EdgeInsets.only(
                            //          left: 12,bottom: 4,right: 4
                            left: 12.w,
                            bottom: 4.h,
                            right: 4.w),
                        //                      height: 88,width: 110,
                        height: 87.h,
                        width: 100.w,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(
                                color: (Color(0xFF550E1C)), width: 2.0),
                            borderRadius: BorderRadius.all(
                              Radius.circular(9.r),
                            ),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 20.r,
                                  offset: Offset(0, 3.r))
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Choclate".toString(),
                                style: getpoppins(TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: darkgrey,
                                    //              fontSize: 12
                                    fontSize: 12.sp)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  child: Text(
                                    "\$ 1.00",
                                    style: getpoppins(TextStyle(
                                        fontWeight: FontWeight.w500,
                                        color: darkgrey,
                                        //             fontSize: 13.5
                                        fontSize: 13.sp)),
                                  ),
                                ),
                                Icon(
                                  CupertinoIcons.add_circled_solid,
                                  color: coffeecolor,
                                  //      size: 21,
                                  size: 21.sp,
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                    Positioned(
                      left: 24.w,
                      child: Image.asset(
                        "assets/images/favpng_dark-chocolate-chocolate-bar-health-effects-of-chocolate@3x.png",
                        width: 86.w,
                        height: 46.h,
                      ),
                    ),
                  ]));
            }));
  }
}
