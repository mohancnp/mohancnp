import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/ui/src/palette.dart';

class TimeFrameOrders extends StatelessWidget {
  final int? index;
  final OrderHistory orderData;
  final bool? reorder;
  const TimeFrameOrders(
      {Key? key, @required this.index, this.reorder, required this.orderData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return InkWell(
      onTap: () {
        Get.toNamed(PageName.orderdetailspage, arguments: orderData.id);
      },
      child: Container(
        padding: EdgeInsets.symmetric(
            horizontal: screenwidth * 0.0194, vertical: screenwidth * 0.0145),
        margin: EdgeInsets.only(bottom: screenwidth * 0.0486),
        decoration: BoxDecoration(
            color: const Color(0xffFBFBFB),
            borderRadius: const BorderRadius.all(Radius.circular(9)),
            boxShadow: [
              BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  offset: const Offset(0, 3),
                  blurRadius: 10)
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  height: screenwidth * 0.2433,
                  width: screenwidth * 0.2433,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  child: Image.asset(
                    "assets/images/metro_coffee_logo.png",
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  margin: EdgeInsets.only(left: screenwidth * 0.0437),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${orderData.orderProductsCount} items",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff404D4D),
                           
                          fontSize: screenwidth * 0.03527,
                        ),
                      ),
                      Text(
                        "Date: ${DateTime.parse(orderData.createdAt!.substring(0, 16).toString()).toString().substring(0, 16)}",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff404D4D),
                           
                          fontSize: screenwidth * 0.0279,
                        ),
                      ),
                      Text(
                        "Order ID: #${orderData.id}",
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          color: const Color(0xff404D4D),
                           
                          fontSize: screenwidth * 0.0279,
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      height: screenwidth * 0.0754,
                      width: 2,
                      decoration: const BoxDecoration(
                        color: Color(0xffA5A5A5),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: screenwidth * 0.0218,
                          right: screenwidth * 0.0389),
                      child: Text(
                        "\$ ${orderData.cost}",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          color: const Color(0xff550E1C),
                           
                          fontSize: screenwidth * 0.0389,
                        ),
                      ),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      size: screenwidth * 0.0486,
                      color: const Color(0xff404D4D),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.greenAccent),
                    borderRadius: BorderRadius.circular(4),
                  ),
                  margin: const EdgeInsets.only(top: 16),
                  padding: const EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.cancel_rounded,
                        color: Palette.coffeeColor,
                        size: 12,
                      ),
                      Container(
                        margin: const EdgeInsets.only(left: 4),
                        child: const Text(
                          "Pending",
                          style: TextStyle(
                            fontWeight: FontWeight.w300,
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
