import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/profile/contents/order_details_controller.dart';

import '../../../core/theme.dart';

class CancelOrderDialog extends StatelessWidget {
  final int orderId;
  const CancelOrderDialog({Key? key, required this.orderId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          horizontal: screenwidth * 0.03041, vertical: screenwidth * 0.03041),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.all(Radius.circular(9)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: screenwidth * 0.199,
                width: screenwidth * 0.199,
                decoration: const BoxDecoration(
                    color: Color(0xffEBEBEB), shape: BoxShape.circle),
                child: Center(
                    child: Icon(
                  CupertinoIcons.delete,
                  color: coffeecolor,
                  size: screenwidth * 0.09489,
                )),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
                top: screenwidth * 0.0389, bottom: screenwidth * 0.07055),
            child: Text(
              "Are you sure you want to\ncancel your order?",
              textAlign: TextAlign.center,
              style: TextStyle(
                 
                fontSize: screenwidth * 0.0328,
                color: darkgrey,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          GestureDetector(
            onTap: () =>
                Get.find<OrderDetailsController>().cancelOrderWithId(orderId),
            child: Container(
              width: screenwidth * 0.450,
              height: screenwidth * 0.0875,
              decoration: BoxDecoration(
                color: coffeecolor,
                borderRadius: const BorderRadius.all(Radius.circular(17)),
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
                  "Cancel Order",
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
            onTap: Get.back,
            child: Container(
              margin: EdgeInsets.only(top: screenwidth * 0.0389),
              width: screenwidth * 0.450,
              height: screenwidth * 0.0875,
              decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(
                    color: coffeecolor,
                    width: 1.2,
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(17)),
                  boxShadow: [
                    BoxShadow(
                        color: const Color(0xffC3916A).withOpacity(0.2),
                        blurRadius: 30,
                        offset: const Offset(0, 9))
                  ]),
              child: Center(
                child: Text(
                  "Keep Order",
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
    );
  }
}
