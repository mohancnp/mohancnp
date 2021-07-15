import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/screens/contents/cartcontent/cartproductcard.dart';

import 'finalpricecalculationcard.dart';
class NewOrdersPage extends StatelessWidget {
  const NewOrdersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return  Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
            margin: EdgeInsets.only(bottom: 12),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "2 items",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w400,
                        color: Color(0xff344141),
                        fontSize: 12.5)),
                  ),
                ),
                Container(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "Add",
                            style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w500,
                                color: Color(0xff550E1C),
                                fontSize: 12.5)),
                          ),
                          Container(
                            margin: EdgeInsets.only(left: 8),
                            child: Icon(
                              CupertinoIcons.add_circled_solid,
                              color: Color(0xff550E1C),
                              size: 16,
                            ),
                          )
                        ]))
              ],
            )),
        ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            itemCount: 2,
            scrollDirection: Axis.vertical,
            itemBuilder: (context,index){
              return
                CartProductCard(index: index,);}),

        Container(
          margin: EdgeInsets.only(top:14,bottom: 24),
          width: screenwidth,
          height: 1,
          decoration: BoxDecoration(
            color: Color(0xffA5A5A5).withOpacity(0.4),
          ),
        ),
        FinalProductCalculationCard()
      ],
    );
  }
}
