import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/widgets/product/cartproductcard.dart';

import '../../widgets/product/finalpricecalculationcard.dart';

class NewOrdersPage extends StatelessWidget {
  final CartController controller = Get.find<CartController>();

  NewOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(
//                bottom: 12
                bottom: screenwidth * 0.0291),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GetX<CartController>(builder: (cartController) {
                  return Container(
                    child: Text(
                      "${cartController.cartDataList.length} items",
                      style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w400,
                          color: Color(0xff344141),
//                        fontSize: 12.5
                          fontSize: screenwidth * 0.0304)),
                    ),
                  );
                }),
                GestureDetector(
                  onTap: () {
                    controller.emptyCart();
                  },
                  child: Container(
                      child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                        Text(
                          "Add",
                          style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff550E1C),
                              //         fontSize: 12.5
                              fontSize: screenwidth * 0.0304)),
                        ),
                        Container(
                          margin: EdgeInsets.only(
//                                left: 8
                              left: screenwidth * 0.0194),
                          child: Icon(
                            CupertinoIcons.add_circled_solid,
                            color: Color(0xff550E1C),
                            size: screenwidth * 0.03892,
                          ),
                        )
                      ])),
                )
              ],
            )),
        GetX<CartController>(builder: (cartController) {
          return ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              itemCount: cartController.cartDataList.length,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                var c = cartController.cartDataList.elementAt(index);
                // print(c.name);
                //gets the data for the product id
                cartController
                    .getProductDetailWithId(c.orderProducts.productId);
                return CartProductCard(
                    index: index,
                    cartData: cartController.cartDataList.elementAt(index));
              });
        }),
        Container(
          margin: EdgeInsets.only(
//              top:14,bottom: 24
              top: screenwidth * 0.0340,
              bottom: screenwidth * 0.0583),
          width: screenwidth,
          height: 1,
          decoration: BoxDecoration(
            color: Color(0xffA5A5A5).withOpacity(0.4),
          ),
        ),
        FinalProductCalculationCard()
      ],
    );
  }
}
