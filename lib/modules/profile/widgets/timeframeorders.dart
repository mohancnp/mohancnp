import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
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
            //        horizontal: 8,vertical: 6
            horizontal: screenwidth * 0.0194,
            vertical: screenwidth * 0.0145),
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    //     height: 100, width: 100,
                    height: screenwidth * 0.2433, width: screenwidth * 0.2433,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Image.asset(
                      "assets/images/metro_coffee_logo.png",
                      fit: BoxFit.cover,
                    ),
                  ),
                  Container(
                    //  height: 76,
                    margin: EdgeInsets.only(
                        //        left: 18
                        left: screenwidth * 0.0437),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "${orderData.orderProductsCount} items",
                            style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff404D4D),
                                //       fontSize: 14.5
                                fontSize: screenwidth * 0.03527)),
                          ),
                        ),
                        Text(
                          "Date: ${DateTime.parse('${orderData.createdAt!.substring(0, 16).toString()}').toString().substring(0, 16)}",
                          style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff404D4D),
                              //         fontSize: 11.5
                              fontSize: screenwidth * 0.0279)),
                        ),
                        Container(
                            child: Text(
                          "Order ID: #${orderData.id}",
                          style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Color(0xff404D4D),
                              //         fontSize: 11.5
                              fontSize: screenwidth * 0.0279)),
                        ))
                      ],
                    ),
                  )
                ],
              ),
            ),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      //                  height: 31,width: 2,
                      height: screenwidth * 0.0754, width: 2,
                      decoration: BoxDecoration(
                        color: Color(0xffA5A5A5),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          //                      left: 9,right: 16
                          left: screenwidth * 0.0218,
                          right: screenwidth * 0.0389),
                      child: Text(
                        "\$ ${orderData.cost}",
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w500,
                            color: Color(0xff550E1C),
                            //      fontSize: 16
                            fontSize: screenwidth * 0.0389)),
                      ),
                    ),
                    Icon(
                      CupertinoIcons.forward,
                      //     size: 20,
                      size: screenwidth * 0.0486,
                      color: Color(0xff404D4D),
                    )
                  ],
                ),
                Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: Colors.greenAccent),
                      borderRadius: BorderRadius.circular(4)),
                  margin: EdgeInsets.only(top: 16),
                  padding: EdgeInsets.all(4),
                  child: Row(
                    children: [
                      Icon(
                        Icons.cancel_rounded,
                        color: Palette.coffeeColor,
//                            size: 15,
                        size: 12,
                      ),
                      Container(
                        margin: EdgeInsets.only(
//                                left: 4
                            left: 4),
                        child: Text(
                          "Pending",
                          style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w300,
                              color: Colors.red,
//                                  fontSize: 10.5
                              fontSize: 12)),
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
