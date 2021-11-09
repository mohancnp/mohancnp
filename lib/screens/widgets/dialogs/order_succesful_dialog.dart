import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';

class OrderSuccesfulDialog extends StatelessWidget {
  OrderSuccesfulDialog({Key? key}) : super(key: key);
  final BaseController baseController = Get.put(BaseController());
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        throw Navigator.pushNamedAndRemoveUntil(
            context, "/Base", (route) => false);
      },
      child: Container(
        width: screenwidth * 0.803,
        padding: EdgeInsets.symmetric(
//          horizontal: 22,vertical: 36
            horizontal: screenwidth * 0.0535,
            vertical: screenwidth * 0.096),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(22)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.06),
                  blurRadius: 10,
                  offset: Offset(0, 3))
            ]),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  child: Image.asset(
                    "assets/images/ordersuccesful/Order Confirmed_Two Color@3x.png",
                    width: 155,
                  ),
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
//                top:40, bottom: 34
                  top: screenwidth * 0.0973,
                  bottom: screenwidth * 0.0827),
              child: Text(
                "Order Successful!",
                textAlign: TextAlign.center,
                style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w500,
                    color: darkgrey,
                    //      fontSize: 18
                    fontSize: screenwidth * 0.0437)),
              ),
            ),
            GestureDetector(
              onTap: () {
                baseController.setindex(0);
                Navigator.pushNamedAndRemoveUntil(
                    context, "/Base", (route) => false);
              },
              child: Container(
//            height: 42,width: 205,
                height: screenwidth * 0.1021, width: screenwidth * 0.498,
                decoration: BoxDecoration(
                    color: coffeecolor,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffC3916A).withOpacity(0.2),
                          blurRadius: 30,
                          offset: Offset(0, 9))
                    ]),
                child: Center(
                  child: Text(
                    "Back to home",
                    textAlign: TextAlign.center,
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Colors.white,
                        //      fontSize: 13.5
                        fontSize: screenwidth * 0.0328)),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, "/MyOrders", (route) => true);
              },
              child: Container(
                margin: EdgeInsets.only(
//                top: 15,bottom: 14
                    top: screenwidth * 0.0364,
                    bottom: screenwidth * 0.034),
//            height: 42,width: 205,
                height: screenwidth * 0.1021, width: screenwidth * 0.498,
                decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: coffeecolor, width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    boxShadow: [
                      BoxShadow(
                          color: Color(0xffC3916A).withOpacity(0.2),
                          blurRadius: 30,
                          offset: Offset(0, 9))
                    ]),
                child: Center(
                  child: Text(
                    "Check Order",
                    textAlign: TextAlign.center,
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w300,
                        color: coffeecolor,
                        //      fontSize: 13.5
                        fontSize: screenwidth * 0.0328)),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
