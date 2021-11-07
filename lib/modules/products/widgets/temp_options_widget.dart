import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";

class TempratureOptionWidget extends StatelessWidget {
  const TempratureOptionWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return SizedBox(
        width: screenwidth,
        child: AnimatedContainer(
          margin: EdgeInsets.only(
              //                      top: 16, bottom: 18
              left: screenwidth * 0.0535,
              right: screenwidth * 0.0535,
              top: screenwidth * 0.0389,
              bottom: screenwidth * 0.0437),
          duration: Duration(milliseconds: 350),
          //         height: 41,
          height: screenwidth * 0.0997,
          width: screenwidth,
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: Color(0xffE8E8E8),
            borderRadius: BorderRadius.all(Radius.circular(9)),
          ),
          child: Stack(children: [
            AnimatedContainer(
              duration: Duration(milliseconds: 250),
              //                height: 41,
              height: screenwidth * 0.0997,
              width: screenwidth,
              alignment: Alignment.centerLeft,
              child: AnimatedContainer(
                duration: Duration(milliseconds: 250),
                //                     height: 41, width: 180,
                height: screenwidth * 0.0997,
                width: screenwidth * 0.437,
                decoration: BoxDecoration(
                    color: Color(0xff404D4D),
                    borderRadius: BorderRadius.all(Radius.circular(9))),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                    onTap: () {
                      // orderProducts.orderProductOptions()
                      // orderProducts.orderProductOptions
                      //     ?.add(tempOptions.elementAt(0));
                    },
                    child: Container(
                      //             height: 41, width: 180,
                      height: 41.h,
                      width: 160.w,
                      child: Center(
                          child: Text(
                        "Hot",
                        style: TextStyle(
                            fontFamily: proximanovaregular,
                            fontSize: 17.w,
                            color: Color(0xFFFEFEFE)),
                      )),
                    )),
                GestureDetector(
                  onTap: () {
                    // settabindex(1);
                    // orderProducts.orderProductOptions
                    //     ?.add(tempOptions.elementAt(1));
                  },
                  child: Container(
                    //                            height: 41, width: 180,
                    height: 41.h,
                    width: 160.w,
                    child: Center(
                        child: Text(
                      "Chilled",
                      style: TextStyle(
                          fontFamily: proximanovaregular,
                          //             fontSize: 15.5,
                          fontSize: 17.w,
                          color: Color(0xFF404D4D)),
                    )),
                  ),
                )
              ],
            )
          ]),
        ));
  }
}
