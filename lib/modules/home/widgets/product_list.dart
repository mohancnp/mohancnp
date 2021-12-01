import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/placeholder_image.dart';
import 'package:metrocoffee/core/models/new_product_model.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/home/widgets/newcard.dart';
import 'package:metrocoffee/modules/products/product_detail_page_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';

class ProductList extends StatelessWidget {
  final List<SingleProduct> products;
  final tag;
  const ProductList({Key? key, required this.products, this.tag})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Material(
        child: Container(
      height: 210.h,
      padding: EdgeInsets.only(left: 13.w),
      color: Color(0xFFF3F5F5),
      child: ListView.builder(
        itemCount: products.length,
        scrollDirection: Axis.horizontal,
        clipBehavior: Clip.none,
        shrinkWrap: true,
        physics: BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          var product = products[index];
          // print("$index");
          return ProductCard(
            imageUri: product.image ?? imagePlaceholderUri,
            name: product.name,
            id: product.id,
            tag: tag,
            price: product.price,
            onPressed: () {
              var cont = Get.find<ProductDetailPageController>();
              var rc = Get.find<RedirectionController>();
              if (rc.userExists) {
                cont.retrieveProductDetails(id: product.id);
                Get.toNamed(PageName.productdetailpage,
                    arguments: [product.id, tag]);
              } else {
                cont.getPublicProductDetails(id: product.id);
                Get.toNamed(PageName.productdetailpage,
                    arguments: [product.id, tag]);
              }
            },
          );
        },
      ),
    ));
  }
}
