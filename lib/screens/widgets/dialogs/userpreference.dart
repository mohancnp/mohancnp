import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/initial/userpreferencecontroller.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

class UserPreference extends StatelessWidget {
  const UserPreference({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return ClipRRect(
        borderRadius: BorderRadius.all(Radius.circular(18)),
        child: Material(
            child: GetBuilder<UserPreferenceController>(
                init: UserPreferenceController(),
                builder: (userpreferencecontroller) {
                  return Container(
                    width: screenwidth * 0.7615,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.all(Radius.circular(18)),
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                      //      height: 115,
                       height: screenwidth*0.279,
                            width: screenwidth,
                            child: Stack(children: [
                              Positioned(
                           //       right: -55, top: -60,
                                  right:- screenwidth*0.1338,
                                  top: -screenwidth*0.1459,
                                  child: Image.asset(
                                    "assets/images/nathan-dumlao-ikU3J1nr52w-unsplash@3x.png",
                             //       width: 162,
                               width:screenwidth*0.394,
                                  ))
                            ])),
                        Center(
                            child: Container(
                          child: Text(
                            "How would you like to\nhave your order?",
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              height: 1.4,
                                fontFamily: montserratsemibold,
                                color: Color(0xff2A3434),
                    //            fontSize: 17
                      fontSize: screenwidth*0.0413
                            ),
                          ),
                        )),
                        userpreferencecontroller.preferenceoptions(context),
                        Container(
                    //       height: 115,
                            height: screenwidth*0.279,
                            width: screenwidth,
                            child: Stack(children: [
                              Positioned(
                            //      left: -55,
                           //       bottom: -60,
                                  left:- screenwidth*0.1338,
                                  bottom: -screenwidth*0.1459,
                                  child: Image.asset(
                                    "assets/images/nathan-dumlao-ikU3J1nr52w-unsplash@3x.png",
                              //      width: 162,
                                    width:screenwidth*0.394,
                                  ))
                            ])),
                      ],
                    ),
                  );
                })));
  }
}
