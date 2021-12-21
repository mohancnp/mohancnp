import 'package:flutter/material.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/core/theme.dart';

class OrderDetailRow extends StatelessWidget {
  final OrderProduct odp;
  const OrderDetailRow({
    Key? key,
    required this.odp,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: screenwidth * 0.0486),
      width: screenwidth,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Prodct Name",
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  color: darkgrey,
                   
                  fontSize: screenwidth * 0.0328,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(right: screenwidth * 0.2433),
                    child: Text(
                      "${odp.qty ?? '0'} unit",
                      style: TextStyle(
                        fontWeight: FontWeight.w300,
                        color: darkgrey.withOpacity(0.8),
                         
                        fontSize: screenwidth * 0.0243,
                      ),
                    ),
                  ),
                  Text(
                    "\$ " "${odp.cost ?? '0.0'}",
                    style: TextStyle(
                      fontWeight: FontWeight.w300,
                      color: darkgrey.withOpacity(0.8),
                       
                      fontSize: screenwidth * 0.0243,
                    ),
                  ),
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: screenwidth * 0.0194),
            width: screenwidth,
            height: 2.5,
            decoration: BoxDecoration(
              color: darkgrey.withOpacity(0.2),
              borderRadius: BorderRadius.circular(10),
            ),
          )
        ],
      ),
    );
  }
}
