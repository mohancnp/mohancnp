import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/enums/producttype.dart';
import 'package:metrocoffee/screens/contents/homecontent/newcard.dart';

class ProductList extends StatelessWidget {
  final ProductTypeEnum productType;

  const ProductList({Key? key, required this.productType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Material(
      child: Container(
        height: 210.h,
        color: Color(0xFFF3F5F5),
        child: ListView.builder(
          itemCount: 3,
          scrollDirection: Axis.horizontal,
          clipBehavior: Clip.none,
          physics: BouncingScrollPhysics(),
          itemBuilder: (context, index) {
            // final drink = controller.allDrinks.elementAt(index);
            return ProductCard(
                imageUri: "assets/images/productimages/cardddd@3x-min.png",
                name: "Caffee Latte",
                price: "3.00");
          },
        ),
      ),
    );
  }
}
