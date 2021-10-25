import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/models/order_data.dart';

import '../../../theme.dart';

class OrderDetailRow extends StatelessWidget {
  final int? index;
  final UserOrder? userOrder;
  final bool? reorder;
  OrderDetailRow({Key? key,this.reorder, this.userOrder, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
//          top: 20
          top: screenwidth * 0.0486),
      width: screenwidth,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  gettitleforrow1(index),
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w500,
                      color: darkgrey,
//                      fontSize: 13.5
                      fontSize: screenwidth * 0.0328)),
                ),
              ),
              Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                Container(
                  margin: EdgeInsets.only(
//                    right: 100
                      right: screenwidth * 0.2433),
                  child: Text(
                    "${userOrder?.qty} unit",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w300,
                        color: darkgrey.withOpacity(0.8),
//                      fontSize: 10
                        fontSize: screenwidth * 0.0243)),
                  ),
                ),
                Text(
                  "\$ " + "${userOrder?.cost}",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w300,
                      color: darkgrey.withOpacity(0.8),
//                      fontSize: 10
                      fontSize: screenwidth * 0.0243)),
                ),
              ])
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 8
                top: screenwidth * 0.0194),
            width: screenwidth,
            height: 2.5,
            decoration: BoxDecoration(
                color: darkgrey.withOpacity(0.2),
                borderRadius: BorderRadius.all(Radius.circular(10))),
          )
        ],
      ),
    );
  }

  getimageforrow1(int? index) {
    if (index == 0) {
      return "assets/images/coffee1.png";
    }
    if (index == 1) {
      return "assets/images/coffe2.png";
    }
    if (index == 2) {
      return "assets/images/coffee4.png";
    }
  }

  gettitleforrow1(int? index) {
    if (index == 0) {
      return "Café Latte";
    }
    if (index == 1) {
      return "Latte Machiato";
    }
    if (index == 2) {
      return "Café Americano";
    }
  }

  getpriceforrow1(int? index) {
    if (index == 0) {
      return "3.00";
    }
    if (index == 1) {
      return "2.00";
    }
    if (index == 2) {
      return "4.00";
    }
  }
}
