import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/core/models/product.dart';
import 'package:metrocoffee/core/theme.dart';

class FavoriteProductCard extends StatelessWidget {
  final int? index;
  final Product product;
  const FavoriteProductCard(
      {Key? key, required this.product, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {},
      child: Container(
        padding: EdgeInsets.symmetric(
          horizontal: screenwidth * 0.0194,
          vertical: screenwidth * 0.0145,
        ),
        margin: EdgeInsets.only(bottom: screenwidth * 0.0486),
        decoration: BoxDecoration(
          color: const Color(0xffFBFBFB),
          borderRadius: const BorderRadius.all(
            Radius.circular(8),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              offset: const Offset(0, 3),
              blurRadius: 10,
            )
          ],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: screenwidth * 0.1849,
                  margin: EdgeInsets.only(left: screenwidth * 0.0437),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        product.productName,
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff404D4D),
                           
                          fontSize: screenwidth * 0.03527,
                        ),
                      ),
                      Text(
                        '\$ ' "${product.productPrice}",
                        style: const TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff550E1C),
                           
                          fontSize: 16.5,
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: screenwidth * 0.2433,
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    CupertinoIcons.forward,
                    size: 26,
                    color: darkgrey,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
