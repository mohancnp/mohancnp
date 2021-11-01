import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import '../../../core/theme.dart';

class RatingsRowProductDetails extends StatelessWidget {
  final double? rating;
  final bool? backgrounddark;
  const RatingsRowProductDetails(
      {Key? key, @required this.rating, this.backgrounddark})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
          //          left: 22, right: 22
          left: screenwidth * 0.0535,
          right: screenwidth * 0.0535,
//      top: 4,bottom: 14
          top: screenwidth * 0.0097,
          bottom: screenwidth * 0.0340),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          for (int i = 0; i <= 3; i++)
            Container(
                child: Icon(
              Ionicons.star,
              color: Color(0xffFFA200),
              //     size: 13.5,
              size: screenwidth * 0.0328,
            )),
          Container(
              child: Icon(
            Ionicons.star_half,
            color: Color(0xffFFA200),
            //     size: 13.5,
            size: screenwidth * 0.0328,
          )),
          Container(
            margin: EdgeInsets.only(
                //        left: 11
                left: screenwidth * 0.0267),
            child: Text("$rating  (50 reviews)",
                style: TextStyle(
                    fontFamily: proximanovaregular,
                    color: backgrounddark!
                        ? Colors.white
                        : darkgrey.withOpacity(0.8),
                    //     fontSize: 12.5
                    fontSize: screenwidth * 0.0304)),
          )
        ],
      ),
    );
  }
}
