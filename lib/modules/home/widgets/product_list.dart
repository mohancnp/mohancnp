import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/models/product_model.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/home/widgets/newcard.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ProductList extends StatelessWidget {
  final List<Product> products;
  const ProductList({Key? key, required this.products}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      height: 248.h,
      width: double.infinity,
      padding: EdgeInsets.only(left: 13.w),
      color: Palette.pagebackgroundcolor,
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var product = products[index];
          // print("$index");
          return ProductCard(
            imageUri: product.productImage,
            name: product.productName,
            id: product.id,
            price: product.productPrice,
            onPressed: () {
              Get.toNamed(PageName.productdetailpage + "/${product.id}");
            },
          );
        },
      ),
    ));
  }
}
