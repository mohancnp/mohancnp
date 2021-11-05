import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/modules/home/widgets/newcard.dart';

class ProductList extends StatelessWidget {
  final List<dynamic> products;
  const ProductList({Key? key, required this.products}) : super(key: key);
//  controller.dataState == DataState.loading
//               ? Container(
//                   width: 100.w,
//                   height: 100.h,
//                   alignment: Alignment.center,
//                   child: SpinKitFadingCube(
//                     color: Palette.coffeeColor,
//                   ),
//                 )
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      height: 208.h,
      margin: EdgeInsets.only(left: 13.w),
      color: Color(0xFFF3F5F5),
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var product = products[index];
          return ProductCard(
              imageUri: product.image,
              name: product.name,
              price: product.price);
        },
      ),
    ));
  }
}
