import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/models/product.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/home/home_controller.dart';
import 'package:metrocoffee/modules/home/widgets/new_card.dart';
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
            return ProductCard(
              imageUri: product.featuresImage,
              name: product.productName,
              id: product.id,
              price: product.productPrice,
              onPressed: () => HomeController.to
                  .navigateToPageDetail(PageName.productdetailpage, product.id),
            );
          },
        ),
      ),
    );
  }
}
