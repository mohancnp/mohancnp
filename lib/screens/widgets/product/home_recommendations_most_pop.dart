import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/enums/section.dart';
import 'package:metrocoffee/screens/widgets/product/home_smallrow.dart';

class HomeRecPopRow extends StatelessWidget {
  final Section section;
  final int page;

  HomeRecPopRow({Key? key, required this.page, required this.section})
      : super(key: key);

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
              section == Section.recommendation
                  ? "Recommendation"
                  : "Most Popular",
              style: getpoppins(TextStyle(
                  fontWeight: FontWeight.w500,
                  color: Color(0xff344141),
                  //      fontSize: 15.5
                  fontSize: screenwidth * 0.0377)),
            ),
          ),
          HomeSmallRow(
            page: page,
            section: section,
          )
        ],
      ),
    );
  }
}
