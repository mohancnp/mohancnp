import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

import '../../../theme.dart';
class CheckoutBottomNavigation extends StatelessWidget {
  const CheckoutBottomNavigation({Key? key}) : super(key: key);

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
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15)),
          boxShadow: [
            BoxShadow(
                color: Colors.black12,
                blurRadius: 25,
                offset: Offset(0, -6))
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
                Container(
                    child: Icon(
                      CupertinoIcons.cart_badge_plus,
                      color: Colors.white,
                      //      size: 24,
                      size: screenwidth * 0.0583,
                    )),
              ],
            ),
          ),
          Container(
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
                  style: getpoppins(
                      TextStyle(
                          color: Colors.white,
                          //        fontSize: 16,
                          fontSize: screenwidth * 0.0389,
                          fontWeight: FontWeight.w300)),
                ),

              ],
            ),
          ),
        ],
      ),
    );
  }
}
