import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/config.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/models/product_model.dart';
import 'package:metrocoffee/theme.dart';

class FavoriteProductCard extends StatelessWidget {
  final int? index;
  final Product product;
  FavoriteProductCard({Key? key, required this.product, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        // Navigator.pushNamedAndRemoveUntil(
        //     context, "/DrinkDetails", (route) => true);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            //        horizontal: 8,vertical: 6
            horizontal: screenwidth * 0.0194,
            vertical: screenwidth * 0.0145),
        margin: EdgeInsets.only(
            //     bottom: 20
            bottom: screenwidth * 0.0486),
        decoration: BoxDecoration(
            color: Color(0xffFBFBFB),
            borderRadius: BorderRadius.all(Radius.circular(9)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: Offset(0, 3),
                  blurRadius: 10)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //     height: 100, width: 100,
                    height: screenwidth * 0.2433, width: screenwidth * 0.2433,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Image.network(
                      "$baseUrl" + "${product.image}",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    //  height: 76,
                    height: screenwidth * 0.1849,
                    margin: EdgeInsets.only(
                        //        left: 18
                        left: screenwidth * 0.0437),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "${product.name}",
                            style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff404D4D),
                                //       fontSize: 14.5
                                fontSize: screenwidth * 0.03527)),
                          ),
                        ),
                        Container(
                          child: Text(
                            '\$ ' + "${product.price}",
                            style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff550E1C),
                                //         fontSize: 14.5
                                fontSize: 16.5)),
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
            Container(
              height: screenwidth * 0.2433,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      CupertinoIcons.forward,
                      //    size: 18,
                      size: 26,
                      color: darkgrey,
                    )
                  ]),
            )
          ],
        ),
      ),
    );
  }
}
