import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/theme.dart';

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
//                  vertical: 14, horizontal: 12
                  vertical: screenwidth * 0.0340,
                  horizontal: screenwidth * 0.0291),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 3))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        //        left: 11
                        left: screenwidth * 0.02676),
                    child: Text(
                      "Google Pay",
                      style: getpoppins(TextStyle(
                          color: Color(0xff404D4D),
                          //   fontSize: 13.5,
                          fontSize: screenwidth * 0.0328,
                          fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    color: Color(0xff404D4D),
                    //     size: 20,
                    size: screenwidth * 0.0486,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: screenwidth * 0.0535,
              ),
              padding: EdgeInsets.symmetric(
//                  vertical: 14, horizontal: 12
                  vertical: screenwidth * 0.0340,
                  horizontal: screenwidth * 0.0291),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 3))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        //        left: 11
                        left: screenwidth * 0.02676),
                    child: Text(
                      "Debit Card",
                      style: getpoppins(TextStyle(
                          color: Color(0xff404D4D),
                          //   fontSize: 13.5,
                          fontSize: screenwidth * 0.0328,
                          fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    color: Color(0xff404D4D),
                    //     size: 20,
                    size: screenwidth * 0.0486,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: screenwidth * 0.0535,
              ),
              padding: EdgeInsets.symmetric(
//                  vertical: 14, horizontal: 12
                  vertical: screenwidth * 0.0340,
                  horizontal: screenwidth * 0.0291),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 3))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        //        left: 11
                        left: screenwidth * 0.02676),
                    child: Text(
                      "Mobile Pay",
                      style: getpoppins(TextStyle(
                          color: Color(0xff404D4D),
                          //   fontSize: 13.5,
                          fontSize: screenwidth * 0.0328,
                          fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    color: Color(0xff404D4D),
                    //     size: 20,
                    size: screenwidth * 0.0486,
                  )
                ],
              ),
            ),
          ],
        ));
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
            margin: EdgeInsets.only(
                //        left: 11
                left: screenwidth * 0.02676),
            child: Text(
              "Send receipt to your email",
              style: getpoppins(TextStyle(
                  color: Color(0xff404D4D),
                  //   fontSize: 13.5,
                  fontSize: screenwidth * 0.0328,
                  fontWeight: FontWeight.w400)),
            ),
          ),
          GestureDetector(
            onTap: () {
              setemailreceiptswitch();
            },
            child: AnimatedContainer(
              padding: EdgeInsets.symmetric(
//                  horizontal: 3
                  horizontal: screenwidth * 0.00729),
//              height: 27,width: 52,
              height: screenwidth * 0.0656, width: screenwidth * 0.126,
              duration: Duration(milliseconds: 175),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(40)),
                  color: emailreceiptswitch ? coffeecolor : Colors.transparent,
                  border: Border.all(
                      color: emailreceiptswitch ? Colors.transparent : darkgrey,
                      width: 1.2)),
              alignment: emailreceiptswitch
                  ? Alignment.centerRight
                  : Alignment.centerLeft,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 175),
//                  height: 20,width: 20,
                height: screenwidth * 0.0486, width: screenwidth * 0.0486,
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
