import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/ui/src/fonts.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ProductCard extends StatelessWidget {
  final String imageUri;
  final String name;
  final int id;
  final dynamic price;
  final void Function() onPressed;
  const ProductCard({
    Key? key,
    required this.imageUri,
    required this.name,
    required this.id,
    required this.onPressed,
    required this.price,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    // print("${AppConfig.baseUrl}/$imageUri");
    return Container(
      width: 140.w,
      margin: EdgeInsets.only(
        left: 16.w,
      ),
      padding: EdgeInsets.only(
        left: 10.w,
        top: 10.h,
        right: 10.w,
      ),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8.r),
          color: Colors.white,
          border: Border.all(width: 0, color: Colors.transparent),
          shape: BoxShape.rectangle,
          boxShadow: [
            BoxShadow(
              offset: Offset(0, 3.h),
              color: const Color(0x29000000),
              blurRadius: 16.r,
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(4.r),
            child: Material(
              child: InkWell(
                onTap: onPressed,
                child: Image.network(
                  "${AppConfig.baseUrl}/$imageUri",
                  height: 116.w,
                  width: 116.w,
                  fit: BoxFit.cover,
                  loadingBuilder: (context, widget, imageProgress) {
                    if (imageProgress == null) {
                      return widget;
                    }
                    return Center(
                      child: SizedBox(
                        height: 116.w,
                        width: 116.w,
                        child: SpinKitCubeGrid(
                          color: Palette.coffeeColor,
                        ),
                      ),
                    );
                  },
                  errorBuilder: (context, object, stackTrace) {
                    return Center(
                      child: Image.asset(
                        AppConfig.metroCoffeeLogoAssetPath,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
          SizedBox(
            height: 10.h,
          ),
          Text(
            name,
            maxLines: 2,
            style: TextStyle(
              color: Palette.darkGery,
              fontSize: 12.sp,
              fontFamily: CustomFont.poppinsMedium,
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "\$ $price",
                  style: TextStyle(
                    color: coffeecolor,
                    fontSize: 20.sp,
                    fontFamily: CustomFont.poppinsMedium,
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Container(
                    width: 28.r,
                    height: 28.r,
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
                            offset: Offset(0, 3.h),
                            color: const Color(0x62722030),
                            blurRadius: 10.r)
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
