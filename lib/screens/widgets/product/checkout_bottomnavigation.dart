import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/checkout/checkoutcontroller.dart';
import 'package:metrocoffee/GetXController/productcontroller/drinkdetailscontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

import '../../../theme.dart';

class CheckoutBottomNavigation extends StatefulWidget {
  const CheckoutBottomNavigation({Key? key}) : super(key: key);

  @override
  _CheckoutBottomNavigationState createState() =>
      _CheckoutBottomNavigationState();
}

class _CheckoutBottomNavigationState extends State<CheckoutBottomNavigation>
    with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
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
                  "\$3.00",
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
                SizedBox(
                    child: GetX<DrinkDetailsController>(builder: (controller) {
                  return Stack(
                    clipBehavior: Clip.none,
                    children: [
                      GestureDetector(
                        onTap: () {
                          //change the cart icon status
                          controller.toggleCart();
                          var count = controller.cartStatus.value ? 0 : 1;
                          controller.updateCart(count);
                        },
                        child: Icon(
                          CupertinoIcons.cart,
                          color: controller.cartStatus.value
                              ? coffeecolor
                              : Colors.white,
                          size: screenwidth * (19 / 375),
                        ),
                      ),
                      AnimatedPositioned(
                        left: controller.cartStatus.value ? 12 : 14,
                        top: controller.cartStatus.value ? -6 : -4,
                        duration: Duration(milliseconds: 200),
                        child: AnimatedSize(
                          vsync: this,
                          duration: Duration(milliseconds: 200),
                          curve: Curves.easeIn,
                          // alignment: Alignment(0,0.4),
                          child: Container(
                            height: controller.cartStatus.value ? 13 : 8,
                            width: controller.cartStatus.value ? 13 : 8,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: controller.cartStatus.value
                                  ? coffeecolor
                                  : Colors.white,
                            ),
                            child: Align(
                              alignment: Alignment(0.2, 0),
                              child: Text(
                                "${controller.cartCount.value}",
                                style: TextStyle(
                                    fontSize:
                                        controller.cartStatus.value ? 6 : 4,
                                    color: controller.cartStatus.value
                                        ? Colors.white
                                        : null),
                              ),
                            ),
                          ),
                        ),
                      )
                    ],
                  );
                })),
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
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
