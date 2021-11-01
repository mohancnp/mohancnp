import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';

class ProductCard extends StatelessWidget {
  final String imageUri;
  final String name;
  final String price;
  const ProductCard(
      {Key? key,
      required this.imageUri,
      required this.name,
      required this.price})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    // print("$baseUrl$imageUri");
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 201.h,
        width: 136.w,
        // clipBehavior: Clip.none,
        margin: EdgeInsets.only(
          left: 27.w,
          bottom: 5.h,
        ),
        // padding:,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8.r),
            color: Colors.white,
            border: Border.all(width: 0, color: Colors.transparent),
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
            Padding(
              padding: EdgeInsets.only(
                top: 10.h,
                left: 10.w,
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(4.r),
                child: Image.asset(
                  "$imageUri",
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
            ),
            Flexible(
                fit: FlexFit.loose,
                child: Padding(
                  padding: EdgeInsets.only(left: 10.w, top: 10.h),
                  child: Text(
                    "$name",
                    style: getpoppins(TextStyle(
                      color: Color(0xFF404D4D),
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                    )),
                  ),
                )),
            SizedBox(height: 9.h),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  "\$ $price",
                  style: getpoppins(TextStyle(
                      color: coffeecolor,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w500)),
                ),
                Container(
                  width: 28.h,
                  height: 28.h,
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
                        BoxShadow(offset: Offset(0, 3), blurRadius: 10.r)
                      ]),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
