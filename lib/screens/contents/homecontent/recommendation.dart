import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/enums/section.dart';
import 'package:metrocoffee/screens/widgets/product/smallerrow.dart';

class Recommendation extends StatelessWidget {
  const Recommendation({Key? key}) : super(key: key);

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
              "Recommendation",
              style: getpoppins(TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff344141),
                  //      fontSize: 15.5
                  fontSize: screenwidth * 0.0377)),
            ),
          ),
          SmallProductRow(
            tag: Section.recommendation,
          )
        ],
      ),
    );
  }
}
