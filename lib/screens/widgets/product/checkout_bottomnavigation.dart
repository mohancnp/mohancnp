import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/GetXController/checkout/checkoutcontroller.dart';
import 'package:metrocoffee/GetXController/productcontroller/drinkdetailscontroller.dart';
import 'package:metrocoffee/GetXController/productcontroller/productdetailscontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/models/order.dart';
import 'package:metrocoffee/models/variants.dart';

import '../../../theme.dart';

class CheckoutBottomNavigation extends StatefulWidget {
//this id is to know if the request for detail coming from drinksdetail or product detail page
//if 0 drink detail
  final int? id;
  final ProductDetail pd;

  const CheckoutBottomNavigation({Key? key, this.id = 1, required this.pd})
      : super(key: key);

  @override
  _CheckoutBottomNavigationState createState() =>
      _CheckoutBottomNavigationState();
}

class _CheckoutBottomNavigationState extends State<CheckoutBottomNavigation>
    with TickerProviderStateMixin {
  final CartController ct = Get.find<CartController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var productDetailsController;
    if (widget.id == 0) {
      productDetailsController = Get.find<DrinkDetailsController>();
    } else {
      productDetailsController = Get.find<ProductDetailController>();
    }

    double screenwidth = MediaQuery.of(context).size.width;
    double screenheight = MediaQuery.of(context).size.height;

    return Container(
      padding: EdgeInsets.symmetric(
        //       vertical:18,
        //       horizontal: 16
        vertical: screenwidth * 0.0437,
        horizontal: screenwidth * 0.0389,
      ),
      width: screenwidth,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
              topRight: Radius.circular(15), topLeft: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12, blurRadius: 25, offset: Offset(0, -6))
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            //       height: 47,
            height: screenwidth * 0.1153,
            width: screenwidth * 0.3966,
            padding: EdgeInsets.symmetric(
                //       horizontal: 22
                horizontal: screenwidth * 0.0535),
            decoration: BoxDecoration(
                color: darkgrey,
                borderRadius: BorderRadius.all(Radius.circular(10)),
                boxShadow: [
                  BoxShadow(
                      color: Color(0xffC3916A).withOpacity(0.25),
                      blurRadius: 30,
                      offset: Offset(0, 9))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "\$ ${productDetailsController.pd?.price}",
                  style: getpoppins(TextStyle(
                      color: Colors.white,
                      //        fontSize: 16,
                      fontSize: screenwidth * 0.0389,
                      fontWeight: FontWeight.w500)),
                ),
                Container(
                  width: 1,
                  //           height: 18,
                  height: screenwidth * 0.0437,
                  decoration: BoxDecoration(color: Colors.white),
                ),
                GetX<CartController>(
                    initState: (v) {
                      print("id received: ${widget.pd.id}");

                      Future.delayed(Duration.zero).then((value) {
                        v.controller
                            ?.checkProductExistence(widget.pd.id)
                            .then((value) {
                          if (value) {
                            print('value true');
                            v.controller?.status.value = true;
                          } else {
                            v.controller?.status.value = false;
                          }
                        });
                      });
                    },
                    dispose: (v) {},
                    builder: (cartController) {
                      return SizedBox(
                          child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          GestureDetector(
                            onTap: () async {
                              print(cartController.status.value);
                              cartController.status.toggle();

                              OrderProducts odp = OrderProducts();

                              //build product to be orderd
                              odp.productVariantId =
                                  productDetailsController.pd?.id;

                              //check before adding new data to the cart
                              if (cartController.status.isTrue) {
                                cartController.addOrderProducts(odp);
                              } else if (cartController.status.isFalse) {
                                cartController.removeOrderProducts(odp);
                              }
                              //add the current data to cart

                              //changes the status of the cart icon
                            },
                            child: Icon(
                              CupertinoIcons.cart,
                              color: (cartController.status.isTrue)
                                  ? coffeecolor
                                  : Colors.white,
                              size: screenwidth * (19 / 375),
                            ),
                          ),
                          AnimatedPositioned(
                            left: (cartController.status.isTrue) ? 12 : 14,
                            top: (cartController.status.isTrue) ? -6 : -4,
                            duration: Duration(milliseconds: 200),
                            child: AnimatedSize(
                              vsync: this,
                              duration: Duration(milliseconds: 200),
                              curve: Curves.easeIn,
                              // alignment: Alignment(0,0.4),
                              child: Container(
                                height: (cartController.status.isTrue) ? 13 : 8,
                                width: (cartController.status.isTrue) ? 13 : 8,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: (cartController.status.isTrue)
                                      ? coffeecolor
                                      : Colors.white,
                                ),
                                child: Align(
                                  alignment: Alignment(0.2, 0),
                                  child: Text(
                                    "${(cartController.status.isTrue) ? 1 : 0}",
                                    style: TextStyle(
                                        fontSize: (cartController.status.isTrue)
                                            ? 6
                                            : 4,
                                        color: (cartController.status.isTrue)
                                            ? Colors.white
                                            : null),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ));
                    }),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              productDetailsController.order.orderProductList
                  ?.add(productDetailsController.orderProducts);
              //ordernow button press handler
              Navigator.pushNamedAndRemoveUntil(
                  context, "/CheckoutPage", (route) => true);
            },
            child: Container(
              //       height: 47,
              height: screenwidth * 0.1153,
              width: screenwidth * 0.3966,
              padding: EdgeInsets.symmetric(
                  //       horizontal: 22
                  horizontal: screenwidth * 0.0535),
              decoration: BoxDecoration(
                  color: coffeecolor,
                  borderRadius: BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffC3916A).withOpacity(0.25),
                        blurRadius: 30,
                        offset: Offset(0, 9))
                  ]),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Order Now",
                    textAlign: TextAlign.center,
                    style: getpoppins(TextStyle(
                        color: Colors.white,
                        //        fontSize: 16,
                        fontSize: screenwidth * 0.0389,
                        fontWeight: FontWeight.w300)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
