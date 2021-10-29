import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/config.dart';
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
    return Container(
      height: 201.h,
      width: 136.w,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
          boxShadow: [BoxShadow(offset: Offset(0, 3), blurRadius: 15.r)]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 10.h, left: 10.w, bottom: 10.h),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(4.r),
              child: Image.network(
                "$baseUrl$imageUri",
                color: Colors.blue,
                fit: BoxFit.cover,
                loadingBuilder: (context, widget, imagechunkevent) => widget,
                height: 116.h,
                width: 116.w,
              ),
            ),
          ),
          Flexible(
              fit: FlexFit.loose,
              child: Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  "$name",
                  style: getpoppins(TextStyle(
                    color: Color(0xFF404D4D),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  )),
                ),
              )),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 10.w),
                child: Text(
                  "\$ $price",
                  style: getpoppins(TextStyle(color: coffeecolor)),
                ),
              ),
              Container(
                width: 28.w,
                height: 28.w,
                margin: EdgeInsets.only(right: 10.w),
                child: Icon(
                  Icons.add,
                  color: Colors.white,
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
    );
  }
}
