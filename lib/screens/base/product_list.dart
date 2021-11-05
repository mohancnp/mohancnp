import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/enums/producttype.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/screens/contents/homecontent/newcard.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class ProductList extends StatelessWidget {
  final ProductTypeEnum productType;

  const ProductList({Key? key, required this.productType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Material(
      child: GetX<HomeTabController>(builder: (controller) {
        // print(controller.allProducts);
        return Container(
          height: 208.h,
          margin: EdgeInsets.only(left: 13.w),
          color: Color(0xFFF3F5F5),
          child: controller.dataState == DataState.loading
              ? Container(
                  width: 100.w,
                  height: 100.h,
                  alignment: Alignment.center,
                  child: SpinKitFadingCube(
                    color: Palette.coffeeColor,
                  ),
                )
              : ListView.builder(
                  itemCount: controller.allProducts.length,
                  scrollDirection: Axis.horizontal,
                  clipBehavior: Clip.none,
                  physics: BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    var product = controller.allProducts.elementAt(index);
                    print(product.price);
                    return ProductCard(
                        imageUri: product.image,
                        name: product.name,
                        price: product.price);
                  },
                ),
        );
      }),
    );
  }
}
