import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    return Material(
      child: Stack(
        children: [
          Image.asset("assets/images/productimages/cardddd@3x-min.png",
              height: 373.h, width: 375.w, fit: BoxFit.cover),
          Positioned(
            top: 49.h,
            child: SizedBox(
              width: 375.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // mainAxisSize: MainAxisSize.max,
                children: [
                  Padding(
                    padding: EdgeInsets.only(
                      left: 28.w,
                    ),
                    child: GestureDetector(
                      onTap: () {
                        Get.offNamed("/ProductDetailPage");
                      },
                      child: Icon(
                        CupertinoIcons.back,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 28.w),
                    child: Icon(
                      CupertinoIcons.cart_fill,
                      color: Colors.white,
                    ),
                  ),

                  // Icon(Icons)
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Color(0xA5000000),
            ),
          )
        ],
      ),
    );
  }
}
