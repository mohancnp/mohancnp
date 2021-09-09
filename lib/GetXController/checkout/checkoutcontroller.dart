import 'package:day_night_time_picker/day_night_time_picker.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

import '../../theme.dart';

class CheckoutController extends GetxController {
  int selectedtimeindex = 0;
  String selectedorderconfirmationtype = 'email';
  TextEditingController orderinstructionscontroller = TextEditingController();
  TimeOfDay _time = TimeOfDay.now().replacing(minute: 30);

  setselectedtimeindex(int index) {
    selectedtimeindex = index;
    update();
  }

  setselectedoderconfirmationindex(String type) {
    selectedorderconfirmationtype = type;
    update();
  }


  Widget checkoutlocation(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          //          horizontal: 22
          horizontal: screenwidth * 0.0535),
      margin: EdgeInsets.only(
          //      bottom: 23
          bottom: screenwidth * 0.0559),
      width: screenwidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                    //      left: 6
                    left: screenwidth * 0.0145),
                child: Text(
                  "Delivery Location",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w500,
                      color: darkgrey,
                      //       fontSize:14.5
                      fontSize: screenwidth * 0.0352)),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        //          right: 4
                        right: screenwidth * 0.00973),
                    child: Text(
                      "Add",
                      style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w500,
                          color: coffeecolor,
                          //       fontSize:12.5
                          fontSize: screenwidth * 0.0304)),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.add_circled_solid,
                    color: coffeecolor,
//                  size: 18,
                    size: screenwidth * 0.0437,
                  )
                ],
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//               top: 11
                top: screenwidth * 0.0267),
            padding: EdgeInsets.symmetric(
//                vertical: 10,horizontal: 12
                vertical: screenwidth * 0.0243,
                horizontal: screenwidth * 0.0291),
            width: screenwidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(mainAxisAlignment: MainAxisAlignment.start, children: [
                  Container(
//                  height: 57,width: 58,
                    height: screenwidth * 0.138, width: screenwidth * 0.141,
                    decoration: BoxDecoration(
                      color: Color(0xffE8E8E8),
                      borderRadius: BorderRadius.all(Radius.circular(9)),
                    ),
                    child: Center(
                      child: Icon(
                        Icons.location_on,
                        color: coffeecolor,
                        //    size: 22,
                        size: screenwidth * 0.0535,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(
                        //       left: 19
                        left: screenwidth * 0.0462),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "2 Saint Street. st",
                            style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w400,
                                color: darkgrey,
//                              fontSize:13.5
                                fontSize: screenwidth * 0.0328)),
                          ),
                        ),
                        Container(
                          child: Text(
                            "Park In, United Kingdom",
                            style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w400,
                                color: darkgrey.withOpacity(0.8),
//                              fontSize:10.5
                                fontSize: screenwidth * 0.0255)),
                          ),
                        ),
                        Container(
                          child: Text(
                            "+99 56581464",
                            style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w400,
                                color: darkgrey.withOpacity(0.8),
                                //           fontSize:10.5
                                fontSize: screenwidth * 0.0255)),
                          ),
                        ),
                      ],
                    ),
                  ),
                ]),
                Container(
                    //    height: 57,
                    height: screenwidth * 0.138,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            FeatherIcons.edit,
                            color: darkgrey,
                            //       size: 19,
                            size: screenwidth * 0.0462,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Icon(
                            CupertinoIcons.delete,
                            color: Colors.redAccent,
                            //       size: 19,
                            size: screenwidth * 0.0462,
                          ),
                        ),
                      ],
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget setdeliverytime(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          //          horizontal: 22
          horizontal: screenwidth * 0.0535),
      margin: EdgeInsets.only(
          //      bottom: 26
          bottom: screenwidth * 0.0632),
      width: screenwidth,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    //      left: 6
                    left: screenwidth * 0.0145),
                child: Text(
                  "Delivery Time",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w500,
                      color: darkgrey,
                      //       fontSize:14.5
                      fontSize: screenwidth * 0.0352)),
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//               top: 11
                top: screenwidth * 0.0267),
            padding: EdgeInsets.symmetric(
//                vertical: 10,horizontal: 12
                vertical: screenwidth * 0.0243,
                horizontal: screenwidth * 0.0291),
            width: screenwidth,
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.07),
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.start, children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Enter Time",
                      style: getpoppins(TextStyle(
                          fontWeight: FontWeight.w400,
                          color: darkgrey,
//                              fontSize:13.5
                          fontSize: screenwidth * 0.0328)),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(showPicker(
                          value: _time,
                          borderRadius: 9,
                          okText: "SET TIME",
                          accentColor: coffeecolor,
                          onChange: (v) {}));
                    },
                    child: Icon(
                      FeatherIcons.clock,
                      color: coffeecolor,
                      //       size: 19,
                      size: screenwidth * 0.0462,
                    ),
                  ),
                ],
              ),
              Divider(
                color: darkgrey.withOpacity(0.15),
                thickness: 1.5,
              ),
              Container(
                  margin: EdgeInsets.symmetric(
                      //        vertical: 8
                      vertical: screenwidth * 0.01946),
                  width: screenwidth,
                  //    height: 31,
                  height: screenwidth * 0.0754,
                  child: ListView.builder(
                      itemCount: 4,
                      scrollDirection: Axis.horizontal,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        return timecontainer(
                            context, index, gettimetext(index));
                      }))
            ]),
          )
        ],
      ),
    );
  }

  Widget timecontainer(BuildContext context, int index, String timetext) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          setselectedtimeindex(index);
        },
        child: AnimatedContainer(
          duration: Duration(milliseconds: 200),
          margin: EdgeInsets.only(
              //     right: 16
              right: screenwidth * 0.03892),
          padding: EdgeInsets.symmetric(
//          horizontal: 17.5
              horizontal: screenwidth * 0.0425),
          decoration: BoxDecoration(
              color: selectedtimeindex == index ? coffeecolor : Colors.white,
              borderRadius: BorderRadius.all(Radius.circular(20)),
              border: Border.all(
                  color: selectedtimeindex == index
                      ? Colors.transparent
                      : coffeecolor,
                  width: 1.25)),
          child: Center(
            child: Text(
              timetext,
              style: getpoppins(TextStyle(
                  color: selectedtimeindex == index ? Colors.white : darkgrey,
                  //     fontSize: 11.5
                  fontSize: screenwidth * 0.0279)),
            ),
          ),
        ));
  }

  gettimetext(int index) {
    if (index == 0) {
      return "As soon as possible.";
    }
    if (index == 1) {
      return "1:00 - 1:10 PM";
    }
    if (index == 2) {
      return "1:10 - 1:20 PM";
    }
    if (index == 3) {
      return "1:20 - 1:30 PM";
    }
  }

  Widget orderconfirmationoptions(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          //          horizontal: 22
          horizontal: screenwidth * 0.0535),
      margin: EdgeInsets.only(
          //       bottom: 24
          bottom: screenwidth * 0.0583),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            child: Text(
              "How would you like to receive your order confirmation?",
              textAlign: TextAlign.center,
              style: getpoppins(TextStyle(
                  color: Color(0xff404D4D),
                  fontWeight: FontWeight.w400,
                  //       fontSize: 11.5
                  fontSize: screenwidth * 0.0279)),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                //       top: 11
                top: screenwidth * 0.0267),
            width: screenwidth,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setselectedoderconfirmationindex('email');
                    },
                    child: AnimatedContainer(
//                  height: 26,width: 78,
                      height: screenwidth * 0.0632,
                      width: screenwidth * 0.1897,
                      duration: Duration(milliseconds: 175),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        color: selectedorderconfirmationtype == 'email'
                            ? coffeecolor
                            : Colors.white,
                        border: Border.all(
                            color: selectedorderconfirmationtype == 'email'
                                ? Colors.transparent
                                : coffeecolor,

//                  width: 1.25
                            width: screenwidth * 0.00304),
                      ),
                      child: Center(
                        child: Text(
                          'Email',
                          style: getpoppins(TextStyle(
//                        fontSize: 10.5,
                              fontSize: screenwidth * 0.0255,
                              fontWeight: FontWeight.w400,
                              color: selectedorderconfirmationtype == 'email'
                                  ? Colors.white
                                  : darkgrey)),
                        ),
                      ),
                    )),
                GestureDetector(
                    onTap: () {
                      setselectedoderconfirmationindex('text');
                    },
                    child: AnimatedContainer(
                      margin: EdgeInsets.only(
//                          left: 26
                          left: screenwidth * 0.0632),
//                  height: 26,width: 78,
                      height: screenwidth * 0.0632,
                      width: screenwidth * 0.1897,
                      duration: Duration(milliseconds: 175),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(13)),
                        color: selectedorderconfirmationtype == 'text'
                            ? coffeecolor
                            : Colors.white,
                        border: Border.all(
                            color: selectedorderconfirmationtype == 'text'
                                ? Colors.transparent
                                : coffeecolor,
//                  width: 1.25
                            width: screenwidth * 0.00304),
                      ),
                      child: Center(
                        child: Text(
                          'Text',
                          style: getpoppins(TextStyle(
//                        fontSize: 10.5,
                              fontSize: screenwidth * 0.0255,
                              fontWeight: FontWeight.w400,
                              color: selectedorderconfirmationtype == 'text'
                                  ? Colors.white
                                  : darkgrey)),
                        ),
                      ),
                    )),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget orderinstruction(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
//          bottom: 35
          bottom: screenwidth * 0.0851,
          left: screenwidth * 0.0535,
          right: screenwidth * 0.0535),
      padding: EdgeInsets.symmetric(
//          horizontal: 26
          horizontal: screenwidth * 0.0632),
//      height: 114,
      height: screenwidth * 0.277,
      width: screenwidth,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.07),
                blurRadius: 10,
                offset: Offset(0, 3)),
          ]),
      child: TextField(
        maxLines: 5,
        controller: orderinstructionscontroller,
        style: getpoppins(TextStyle(
            fontWeight: FontWeight.w300,
            color: darkgrey,
//                fontSize: 11.5
            fontSize: screenwidth * 0.0279)),
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: "Type here if you have any special "
                "instruction for this order or allergy of any kind.",
            hintStyle: getpoppins(TextStyle(
                fontWeight: FontWeight.w300,
                color: darkgrey.withOpacity(0.85),
                //         fontSize: 11.5
                fontSize: screenwidth * 0.0279))),
      ),
    );
  }
}
