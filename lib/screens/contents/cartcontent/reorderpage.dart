import 'package:flutter/material.dart';
import 'package:metrocoffee/screens/contents/cartcontent/reorders/singletimeframeorders.dart';
class ReOrderPage extends StatelessWidget {
  const ReOrderPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
//                top:14,bottom: 24
                top:screenwidth*0.0340,bottom: screenwidth*0.0583
            ),
            width: screenwidth,
            height: 1,
            decoration: BoxDecoration(
              color: Color(0xffA5A5A5).withOpacity(0.4),
            ),
          ),
          ListView.builder(
            physics: NeverScrollableScrollPhysics(),
              itemCount: 3,
              scrollDirection: Axis.vertical,
              shrinkWrap: true,
              itemBuilder: (context,index){
            return SingleTimeFrameReorders(index: index);
          })
        ]
    );
  }
}
