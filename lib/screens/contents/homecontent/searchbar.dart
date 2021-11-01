import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';

class SearchBar extends StatelessWidget {
  const SearchBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
        //    height: 42,
        height: screenwidth * 0.1021,
        margin: EdgeInsets.only(
            //      top: 23,
            top: screenwidth * 0.0879,
            left: screenwidth * 0.0583,
            right: screenwidth * 0.0583),
        width: screenwidth,
        decoration: BoxDecoration(
          color: Color(0xffFFEEF1),
          borderRadius: BorderRadius.all(Radius.circular(15)),
        ),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          GestureDetector(
              child: Container(
            margin: EdgeInsets.symmetric(
                //        horizontal: 12
                horizontal: screenwidth * 0.02919),
            child: Icon(
              Ionicons.search,
              color: Color(0xff404D4D),
              //        size: 22,
              size: screenwidth * 0.0535,
            ),
          )),
          Expanded(
              child: Container(
                  padding: EdgeInsets.only(
                      //       bottom: 4
                      bottom: screenwidth * 0.00973),
                  child: TextField(
                    style: TextStyle(
                        fontFamily: poppinsregular,
                        color: Colors.black87,
                        //     fontSize: 11.5
                        fontSize: screenwidth * 0.0279),
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: 'What will energize you today?',
                      hintStyle: TextStyle(
                          fontFamily: poppinslight,
                          color: Color(0xff404D4D),
                          //     fontSize: 11.5
                          fontSize: screenwidth * 0.0279),
                    ),
                  )))
        ]));
  }
}
