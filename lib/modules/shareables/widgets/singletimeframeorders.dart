import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/models/order_model.dart';
import 'package:metrocoffee/modules/profile/widgets/timeframeorders.dart';

class SingleTimeFrameReorders extends StatelessWidget {
  final int? index;
  final OrderHistory orderData;
  const SingleTimeFrameReorders(
      {Key? key, @required this.index, required this.orderData})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
      onTap: () {
        Navigator.pushNamedAndRemoveUntil(
            context, "/OrderDetails", (route) => true);
      },
      child: Container(
        width: screenwidth,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: screenwidth,
              margin: EdgeInsets.only(
                  //       bottom: 12
                  bottom: screenwidth * 0.0291),
              child: Row(children: [
                Text(
                  getnotificationdaytitlefromindex(index),
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff344141),
                      //        fontSize: 12.5
                      fontSize: screenwidth * 0.03284)),
                )
              ]),
            ),
            ListView.builder(
                itemCount: index == 0 ? 1 : 2,
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return TimeFrameOrders(index: index, orderData: orderData);
                })
          ],
        ),
      ),
    );
  }

  getnotificationdaytitlefromindex(int? index) {
    if (index == 0) {
      return "Today";
    }
    if (index == 1) {
      return "Last Week";
    }
    if (index == 2) {
      return "Last Month";
    }
  }
}
