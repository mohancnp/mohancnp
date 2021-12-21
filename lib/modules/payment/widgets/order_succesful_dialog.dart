import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/theme.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';

class OrderSuccesfulDialog extends StatelessWidget {
  const OrderSuccesfulDialog({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return WillPopScope(
      onWillPop: () async {
        return true;
      },
      child: Container(
        width: screenwidth * 0.803,
        padding: EdgeInsets.symmetric(
          horizontal: screenwidth * 0.0535,
          vertical: screenwidth * 0.096,
        ),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(
            Radius.circular(22),
          ),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.06),
              blurRadius: 10,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  "assets/images/ordersuccesful/Order Confirmed_Two Color@3x.png",
                  width: 155,
                ),
              ],
            ),
            Container(
              margin: EdgeInsets.only(
                  top: screenwidth * 0.0973, bottom: screenwidth * 0.0827),
              child: Text(
                "Order Successful!",
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: darkgrey,
                  fontSize: screenwidth * 0.0437,
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.offAllNamed(PageName.homepage);
              },
              child: Container(
                height: screenwidth * 0.1021,
                width: screenwidth * 0.498,
                decoration: BoxDecoration(
                  color: coffeecolor,
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffC3916A).withOpacity(0.2),
                      blurRadius: 30,
                      offset: const Offset(0, 9),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Back to home",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Colors.white,
                      fontSize: screenwidth * 0.0328,
                    ),
                  ),
                ),
              ),
            ),
            GestureDetector(
              onTap: () {
                Get.find<BaseController>().setindex(2);
                Get.offAllNamed(PageName.homepage);
              },
              child: Container(
                margin: EdgeInsets.only(
                    top: screenwidth * 0.0364, bottom: screenwidth * 0.034),
                height: screenwidth * 0.1021,
                width: screenwidth * 0.498,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: coffeecolor, width: 1),
                  borderRadius: const BorderRadius.all(
                    Radius.circular(10),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: const Color(0xffC3916A).withOpacity(0.2),
                      blurRadius: 30,
                      offset: const Offset(0, 9),
                    ),
                  ],
                ),
                child: Center(
                  child: Text(
                    "Check Order",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: coffeecolor,
                      fontSize: screenwidth * 0.0328,
                       
                    ),
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
