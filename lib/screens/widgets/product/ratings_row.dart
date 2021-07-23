import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

import '../../../theme.dart';
class RatingsRow extends StatelessWidget {
  final double? rating;
  final bool? backgrounddark;
  const RatingsRow({Key? key,@required this.rating,this.backgrounddark}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Icon(Ionicons.star,
            color: Color(0xffFFA200),
       //     size: 13.5,
        size: screenwidth*0.0328,  ),
          Container(
            margin: EdgeInsets.only(
        //        left: 4.5
          left: screenwidth*0.0109  ),
            child: Text("$rating",style: getpoppins(
                TextStyle(
                    fontWeight: FontWeight.w500,
                    color: backgrounddark!?Colors.white:darkgrey,
               //     fontSize: 11.5
                fontSize: screenwidth*0.0279
                )
            ),),
          )
        ],
      ),
    );  }
}
