import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductDetailPage extends StatelessWidget {
  const ProductDetailPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // double screenwidth = MediaQuery.of(context).size.width;
    // double screenheight = MediaQuery.of(context).size.height;
    return Material(
      child: Stack(
        children: [
          Image.asset(
            "assets/images/productimages/cardddd@3x-min.png",
            height: 373.h,
            width: 375.w,
          )
        ],
      ),
    );
  }
}
