import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/contents/cartcontent/reorders/timeframeorders.dart';
class SingleTimeFrameReorders extends StatelessWidget {
  final int? index;
  const SingleTimeFrameReorders({Key? key,@required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
        width: screenwidth,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          width: screenwidth,
          margin: EdgeInsets.only(
            //       bottom: 12
              bottom: screenwidth*0.0291 ),
          child: Row(children:[Text(getnotificationdaytitlefromindex(index),style: getpoppins(TextStyle(
              fontWeight: FontWeight.w500,
              color: Color(0xff344141),
              //        fontSize: 12.5
              fontSize: screenwidth*0.03284
          )),)]),
        ),
        ListView.builder(
            itemCount: index==0?1:2,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context,index){
          return TimeFrameOrders(index: index);
        })


      ],
    ),);
  }
  getnotificationdaytitlefromindex(int? index){
    if( index==0){
      return "Today";
    }
    if( index==1){
      return "Last Week";
    }
    if( index==2){
      return "Last Month";
    }
  }
}
