import 'package:flutter/material.dart';

class SingleTimeFrameOrderDetails extends StatelessWidget {
  final int? index;
  const SingleTimeFrameOrderDetails({Key? key, @required this.index})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
      width: screenwidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: screenwidth,
            padding: EdgeInsets.symmetric(
              horizontal: screenwidth * 0.0535,
            ),
            child: Row(
              children: [
                Text(
                  getnotificationdaytitlefromindex(index),
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    color: const Color(0xff344141),
                     
                    fontSize: screenwidth * 0.03284,
                  ),
                )
              ],
            ),
          ),
          ListView.builder(
              itemCount: index == 0 ? 1 : 2,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                return Container();
                // return TimeFrameOrderDetails(index: index);
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
