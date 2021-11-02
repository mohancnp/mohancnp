import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';

class AddonsWidget extends StatelessWidget {
  const AddonsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
        height: 140,
        child: ListView.builder(
            itemCount: 3,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              return Container(
                  margin: EdgeInsets.only(
                    left: index != 0 ? 0 : screenwidth * 0.0535,
                    //          right: 17
                    right: screenwidth * 0.04136,
                  ),
                  //                        height: 94,width: 134,
                  height: screenwidth * 0.2287,
                  width: screenwidth * 0.326,
                  child: Stack(children: [
                    Positioned(
                        left: 0,
                        //         bottom:24,
                        bottom: screenwidth * 0.0583,
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            padding: EdgeInsets.only(
                                //          left: 12,bottom: 4,right: 4
                                left: screenwidth * 0.0291,
                                bottom: screenwidth * 0.00973,
                                right: screenwidth * 0.00973),
                            //                      height: 88,width: 110,
                            height: screenwidth * 0.2141,
                            width: screenwidth * 0.267,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                border: Border.all(
                                    color: (Color(0xFF550E1C)), width: 2.0),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(9),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.black12,
                                      blurRadius: 20,
                                      offset: Offset(0, 3))
                                ]),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.end,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Container(
                                  child: Text(
                                    "Choclate".toString(),
                                    style: getpoppins(TextStyle(
                                        fontWeight: FontWeight.w300,
                                        color: darkgrey,
                                        //              fontSize: 12
                                        fontSize: screenwidth * 0.0291)),
                                  ),
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Container(
                                      child: Text(
                                        "\$ 1.00",
                                        style: getpoppins(TextStyle(
                                            fontWeight: FontWeight.w500,
                                            color: darkgrey,
                                            //             fontSize: 13.5
                                            fontSize: screenwidth * 0.0328)),
                                      ),
                                    ),
                                    Icon(
                                      CupertinoIcons.add_circled_solid,
                                      color: coffeecolor,
                                      //      size: 21,
                                      size: screenwidth * 0.0510,
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        )),
                    Positioned(
                      right: 0,
                      top: 20,
                      child: Image.asset(
                          "assets/images/favpng_dark-chocolate-chocolate-bar-health-effects-of-chocolate@3x.png",
                          width: screenwidth * 0.2092),
                    ),
                  ]));
            }));
  }
}
