import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';

import 'singlenotification.dart';

class SingleDayNotifications extends StatelessWidget {
  final int? index;
  const SingleDayNotifications({Key? key, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      margin: EdgeInsets.only(
          //      top: 24
          top: screenwidth * 0.0583),
      padding: EdgeInsets.symmetric(
          //       horizontal: 24
          horizontal: screenwidth * 0.0583),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
                //       bottom: 12
                bottom: screenwidth * 0.0291),
            child: Text(
              getnotificationdaytitlefromindex(index),
              style: getpoppins(TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff344141),
                  //        fontSize: 12.5
                  fontSize: screenwidth * 0.03284)),
            ),
          ),
          ListView.builder(
              physics: NeverScrollableScrollPhysics(),
              itemCount: 2,
              shrinkWrap: true,
              scrollDirection: Axis.vertical,
              itemBuilder: (context, index) {
                return SingleNotification(
                  index: index,
                );
              })
        ],
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
