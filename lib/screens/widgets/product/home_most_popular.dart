import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

import 'home_smallrow.dart';
class HomeMostPopularRow extends StatelessWidget {
  const HomeMostPopularRow({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.only(
              left: screenwidth * 0.0583,
            ),
            child: Text(
              "Most Popular",
              style: getpoppins(TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff344141),
                  //      fontSize: 15.5
                  fontSize: screenwidth * 0.0377)),
            ),
          ),
          HomeSmallRow()
        ],
      ),

    );
  }
}
