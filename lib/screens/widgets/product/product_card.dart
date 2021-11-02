import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProductCard extends StatelessWidget {
  ProductCard({Key? key}) : super(key: key);

  // final CartController cartController = Get.find<CartController>();

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: 320.w,
      height: 100.h,
      padding: EdgeInsets.symmetric(
          //        horizontal: 8,vertical: 6
          horizontal: 8.w,
          vertical: 6.h),
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
                  child: Image.asset(
                    getimageforrow1(0),
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
                          "Caffe Latte",
                          style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff404D4D),
                              //       fontSize: 14.5
                              fontSize: screenwidth * 0.03527)),
                        ),
                      ),
                      Container(
                        child: Text(
                          '\$ 3.00',
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
                              // int newCount = 1;
                              // if (cartData?.orderProducts != null) {
                              //   var op = cartData!.orderProducts;
                              //   if (op.qty > 1) {
                              //     // print("current count: ${op.qty}");
                              //     newCount = --op.qty;
                              //     // print("new count: $newCount");
                              //   }
                              // }
                              // //update the product count
                              // await cartController.updateCartProductCountWithId(
                              //     index ?? 0,
                              //     cartData?.orderProducts.productVariantId,
                              //     newCount);
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
                              "2",
                              style: getpoppins(TextStyle(
                                  fontWeight: FontWeight.w300,
                                  color: Colors.black54)),
                            ),
                          ),
                          GestureDetector(
                            onTap: () async {
                              // int newCount = 1;
                              // if (cartData?.orderProducts != null) {
                              //   var op = cartData!.orderProducts;
                              //   print("current count: ${op.qty}");
                              //   newCount = ++op.qty;
                              //   print("new count: $newCount");
                              // }
                              // //increase the product count
                              // await cartController.updateCartProductCountWithId(
                              //     index ?? 0,
                              //     cartData?.orderProducts.productVariantId,
                              //     newCount);
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
                          borderRadius: BorderRadius.all(Radius.circular(18)),
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
                  // if (tag == 0) {
                  //   cartController.removeOrderProducts(cartData!);
                  // }
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
