import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/shareables/userpreference.dart';

class DiscountDialog extends StatelessWidget {
  const DiscountDialog({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Material(
        child: Container(
      width: screenwidth * 0.7615,
      padding: EdgeInsets.only(
//          left: 20
          left: screenwidth * 0.04866),
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Container(
                    margin: EdgeInsets.only(
//                         top: 35
                        top: screenwidth * 0.0851),
                    child: RichText(
                      text: TextSpan(
                          style: TextStyle(
                              height: 1.6,
                              fontFamily: montserratmedium,
                              color: Color(0xff2A3434),
                              //      fontSize: 20
                              fontSize: screenwidth * 0.04866),
                          children: [
                            TextSpan(text: "Thanks for being\n a "),
                            TextSpan(
                                text: "Gold Member.\n",
                                style: TextStyle(
                                    height: 1.6,
                                    fontFamily: montserratbold,
                                    color: Color(0xffD4874C),
                                    //        fontSize: 20

                                    fontSize: screenwidth * 0.04866)),
                            TextSpan(text: "Enjoy your 15%\ndiscount."),
                          ]),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
//                        top: 38
                        top: screenwidth * 0.092),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (_) {
                                      return ClipRRect(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(18)),
                                          child: SimpleDialog(
                                              contentPadding: EdgeInsets.all(0),
                                              //     insetPadding: EdgeInsets.all(0),
                                              //      titlePadding: EdgeInsets.all(0),
                                              shape: RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                    Radius.circular(18)),
                                              ),
                                              children: [
                                                // UserPreference()
                                              ]));
                                    });
                              },
                              child: Container(
                                margin: EdgeInsets.only(
                                    //             bottom: 12
                                    bottom: screenwidth * 0.02919),
//          height: 41, width: 155,
                                height: screenwidth * 0.0997,
                                width: screenwidth * 0.377,
                                decoration: BoxDecoration(
                                    color: Color(0xffD4874C),
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25)),
                                    boxShadow: [
                                      BoxShadow(
                                          color: Color(0xC3916A4D),
                                          offset: Offset(0, 9),
                                          blurRadius: 30)
                                    ]),
                                child: Center(
                                  child: Container(
                                    child: Text(
                                      "CONTINUE",
                                      style: TextStyle(
                                          fontFamily: poppinsregular,
                                          //       fontSize: 13.5,
                                          fontSize: screenwidth * 0.0328,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                              )),
                        ]),
                  )
                ],
              ),
              Image.asset(
                "assets/images/coffematt.png",
                //     width: 140,
                width: screenwidth * 0.3406,
              )
            ],
          ),
        ],
      ),
    ));
  }
}
