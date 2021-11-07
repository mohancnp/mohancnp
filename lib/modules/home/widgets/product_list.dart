import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/home/widgets/newcard.dart';
import 'package:metrocoffee/modules/products/product_detail_page_controller.dart';

class ProductList extends StatelessWidget {
  final List<dynamic> products;
  final tag;
  const ProductList({Key? key, required this.products, this.tag})
      : super(key: key);
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
          // print("$index");
          return ProductCard(
              imageUri: product.image,
              name: product.name,
              id: product.id,
              tag: tag,
              onPressed: () {
                Get.find<ProductDetailPageController>()
                    .retrieveProductDetails();

                Get.toNamed(PageName.productdetailpage,
                    arguments: [product.id, tag]);
              },
              price: product.price);
        },
      ),
    ));
  }
}
