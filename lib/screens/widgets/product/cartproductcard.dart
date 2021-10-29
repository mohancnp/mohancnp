import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/instances.dart';
import 'package:metrocoffee/models/cart_data.dart';
import 'package:metrocoffee/models/order.dart';
import 'package:metrocoffee/screens/widgets/dialogs/add_card_dialog.dart';
import 'package:metrocoffee/screens/widgets/dialogs/cancel_order_dialog.dart';
import 'package:metrocoffee/screens/widgets/dialogs/delete_order_dialog.dart';
import 'package:metrocoffee/services/rest/config.dart';
import 'package:metrocoffee/services/rest/products.dart';
import 'package:metrocoffee/services/rest/single_product.dart';

class CartProductCard extends StatelessWidget {
  final int? index;
  final CartData? cartData;

  //0 tag if products in checkout,can't be deleted
  int tag;

  CartProductCard({Key? key, this.index, this.cartData, this.tag = 0})
      : super(key: key);

  final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return (cartData == null)
        ? SizedBox(child: Center(child: Text('No Product for checkout')))
        : Container(
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
                        height: screenwidth * 0.2433,
                        width: screenwidth * 0.2433,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                        ),
                        child: (cartData?.imageUri != null)
                            ? Image.network(
                                "$baseUrl/${cartData?.imageUri}",
                                fit: BoxFit.cover,
                              )
                            : Image.asset(
                                getimageforrow1(index),
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "${cartData?.name}",
                                style: getpoppins(TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff404D4D),
                                    //       fontSize: 14.5
                                    fontSize: screenwidth * 0.03527)),
                              ),
                            ),
                            Container(
                              child: Text(
                                '\$ ${((cartData?.price ?? 0) * (cartData!.orderProducts.qty)).toPrecision(2)}',
                                style: getpoppins(TextStyle(
                                    fontWeight: FontWeight.w500,
                                    color: Color(0xff550E1C),
                                    //         fontSize: 14.5
                                    fontSize: screenwidth * 0.03527)),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                GestureDetector(
                                  onTap: () async {
                                    int newCount = 1;
                                    if (cartData?.orderProducts != null) {
                                      var op = cartData!.orderProducts;
                                      if (op.qty > 1) {
                                        // print("current count: ${op.qty}");
                                        newCount = --op.qty;
                                        // print("new count: $newCount");
                                      }
                                    }
                                    //update the product count
                                    await cartController
                                        .updateCartProductCountWithId(
                                            index ?? 0,
                                            cartData?.orderProducts
                                                .productVariantId,
                                            newCount);
                                  },
                                  child: Icon(
                                    CupertinoIcons.minus_circle,

                                    //       size: 20,
                                    size: screenwidth * 0.0486,
                                    color: Colors.black54,
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.symmetric(
                                      //         horizontal: 6
                                      horizontal: screenwidth * 0.01459),
                                  child: Text(
                                    "${cartData?.orderProducts.qty}",
                                    style: getpoppins(TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: Colors.black54)),
                                  ),
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    int newCount = 1;
                                    if (cartData?.orderProducts != null) {
                                      var op = cartData!.orderProducts;
                                      print("current count: ${op.qty}");
                                      newCount = ++op.qty;
                                      print("new count: $newCount");
                                    }
                                    //increase the product count
                                    await cartController
                                        .updateCartProductCountWithId(
                                            index ?? 0,
                                            cartData?.orderProducts
                                                .productVariantId,
                                            newCount);
                                  },
                                  child: Icon(
                                    CupertinoIcons.plus_circle,
                                    //      size: 20,
                                    size: screenwidth * 0.0486,
                                    color: Colors.black54,
                                  ),
                                ),
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      showDialog(
                          context: context,
                          builder: (_) {
                            return ClipRRect(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(18)),
                                child: SimpleDialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(18)),
                                    ),
                                    children: [
                                      // DeleteOrderDialog()
                                      //   OrderSuccesfulDialog()
                                      //  CancelOrderDialog()
                                      // DeleteOrderDialog()
                                    ]));
                          });
                    },
                    child: GestureDetector(
                      onTap: () {
                        if (tag == 0) {
                          cartController.removeOrderProducts(cartData!);
                        }
                      },
                      child: Icon(
                        CupertinoIcons.xmark_circle,
                        //    size: 18,
                        size: screenwidth * 0.0437,
                        color: Colors.redAccent,
                      ),
                    ))
              ],
            ),
          );
  }

  getimageforrow1(int? index) {
    if (index == 0) {
      return "assets/images/coffee1.png";
    }
    if (index == 1) {
      return "assets/images/coffe2.png";
    }
    if (index == 2) {
      return "assets/images/coffee4.png";
    }
  }

  gettitleforrow1(int? index) {
    if (index == 0) {
      return "Café Latte";
    }
    if (index == 1) {
      return "Latte Machiato";
    }
    if (index == 2) {
      return "Café Americano";
    }
  }
}
