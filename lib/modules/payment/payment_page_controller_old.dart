import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/theme.dart';

class PaymentPageController extends GetxController {
  bool emailreceiptswitch = true;

  setemailreceiptswitch() {
    emailreceiptswitch = !emailreceiptswitch;
    update();
  }

  Widget paymentoptions(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      padding: EdgeInsets.symmetric(
        horizontal: screenwidth * 0.05352,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
              top: screenwidth * 0.0535,
            ),
            padding: EdgeInsets.symmetric(
                vertical: screenwidth * 0.0340,
                horizontal: screenwidth * 0.0291),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: screenwidth * 0.02676),
                  child: Text(
                    "Google Pay",
                    style: TextStyle(
                      color: const Color(0xff404D4D),
                       
                      fontSize: screenwidth * 0.0328,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: const Color(0xff404D4D),
                  size: screenwidth * 0.0486,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenwidth * 0.0535,
            ),
            padding: EdgeInsets.symmetric(
              vertical: screenwidth * 0.0340,
              horizontal: screenwidth * 0.0291,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: screenwidth * 0.02676),
                  child: Text(
                    "Debit Card",
                    style: TextStyle(
                      color: const Color(0xff404D4D),
                      fontSize: screenwidth * 0.0328,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: const Color(0xff404D4D),
                  size: screenwidth * 0.0486,
                )
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: screenwidth * 0.0535),
            padding: EdgeInsets.symmetric(
                vertical: screenwidth * 0.0340,
                horizontal: screenwidth * 0.0291),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: const BorderRadius.all(
                Radius.circular(10),
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: screenwidth * 0.02676),
                  child: Text(
                    "Mobile Pay",
                    style: TextStyle(
                      color: const Color(0xff404D4D),
                      fontSize: screenwidth * 0.0328,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: const Color(0xff404D4D),
                  size: screenwidth * 0.0486,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget receiptemailswitchrow(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      padding: EdgeInsets.symmetric(
        horizontal: screenwidth * 0.05352,
      ),
      margin: EdgeInsets.only(
        top: screenwidth * 0.0535,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            margin: EdgeInsets.only(left: screenwidth * 0.02676),
            child: Text(
              "Send receipt to your email",
              style: TextStyle(
                color: const Color(0xff404D4D),
                fontSize: screenwidth * 0.0328,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              setemailreceiptswitch();
            },
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(horizontal: screenwidth * 0.00729),
              height: screenwidth * 0.0656,
              width: screenwidth * 0.126,
              duration: const Duration(milliseconds: 175),
              decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(40)),
                  color: emailreceiptswitch ? coffeecolor : Colors.transparent,
                  border: Border.all(
                      color: emailreceiptswitch ? Colors.transparent : darkgrey,
                      width: 1.2)),
              alignment: emailreceiptswitch
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 175),
                height: screenwidth * 0.0486,
                width: screenwidth * 0.0486,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: emailreceiptswitch ? Colors.white : darkgrey,
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
