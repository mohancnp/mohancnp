import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/theme.dart';

class AddCardController extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController cardnumbercontroller = TextEditingController();
  TextEditingController expdatecontroller = TextEditingController();
  TextEditingController cvccontroller = TextEditingController();

  Widget addcardtextfields(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      margin: EdgeInsets.only(top: 27),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Cardholder name",
                  textAlign: TextAlign.center,
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w400,
                      color: darkgrey,
                      //      fontSize: 10.5
                      fontSize: screenwidth * 0.02554)),
                ),
              ),
            ],
          ),
          TextField(
            controller: namecontroller,
            style: getpoppins(TextStyle(
                //      fontSize: 12.5,
                fontSize: screenwidth * 0.0304,
                color: Color(0xff054B83),
                fontWeight: FontWeight.w400)),
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: "Robert Fox",
                hintStyle: getpoppins(TextStyle(
                    //   fontSize: 12.5,
                    fontSize: screenwidth * 0.0304,
                    color: Colors.grey[600],
                    fontWeight: FontWeight.w400))),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 17.5),
            width: screenwidth,
            height: 0.5,
            decoration: BoxDecoration(
              color: Color(0xff054B83),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                child: Text(
                  "Card Number",
                  textAlign: TextAlign.center,
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w400,
                      color: darkgrey,
                      //      fontSize: 10.5
                      fontSize: screenwidth * 0.02554)),
                ),
              ),
            ],
          ),
          TextField(
            keyboardType: TextInputType.number,
            controller: cardnumbercontroller,
            style: getpoppins(TextStyle(
                //      fontSize: 12.5,
                fontSize: screenwidth * 0.0304,
                color: Color(0xff054B83),
                fontWeight: FontWeight.w400)),
            decoration: InputDecoration(
                border: InputBorder.none,
                suffixIcon: GestureDetector(
                  onTap: () {},
                  child: Image.asset(
                    "assets/images/paymentimages/favpng_visa-debit-card-credit-card-logo-mastercard@3x.png",
                    width: 22,
                  ),
                ),
                hintText: "0000 - 0000 - 0000 - 0000",
                hintStyle: getpoppins(TextStyle(
                    //   fontSize: 12.5,
                    fontSize: screenwidth * 0.0304,
                    color: Colors.grey[800],
                    fontWeight: FontWeight.w400))),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 17.5),
            width: screenwidth,
            height: 0.5,
            decoration: BoxDecoration(
              color: Color(0xff054B83),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: screenwidth * 0.31,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "Exp Date",
                        textAlign: TextAlign.center,
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkgrey,
                            //      fontSize: 10.5
                            fontSize: screenwidth * 0.02554)),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.datetime,
                      controller: expdatecontroller,
                      style: getpoppins(TextStyle(
                          //      fontSize: 12.5,
                          fontSize: screenwidth * 0.0304,
                          color: Color(0xff054B83),
                          fontWeight: FontWeight.w400)),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "01/23",
                          hintStyle: getpoppins(TextStyle(
                              //   fontSize: 12.5,
                              fontSize: screenwidth * 0.0304,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w400))),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 17.5),
                      width: screenwidth,
                      height: 0.5,
                      decoration: BoxDecoration(
                        color: Color(0xff054B83),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                width: screenwidth * 0.31,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Text(
                        "CVC",
                        textAlign: TextAlign.center,
                        style: getpoppins(TextStyle(
                            fontWeight: FontWeight.w400,
                            color: darkgrey,
                            //      fontSize: 10.5
                            fontSize: screenwidth * 0.02554)),
                      ),
                    ),
                    TextField(
                      keyboardType: TextInputType.numberWithOptions(),
                      controller: cvccontroller,
                      style: getpoppins(TextStyle(
                          //      fontSize: 12.5,
                          fontSize: screenwidth * 0.0304,
                          color: Color(0xff054B83),
                          fontWeight: FontWeight.w400)),
                      decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "****",
                          hintStyle: getpoppins(TextStyle(
                              //   fontSize: 12.5,
                              fontSize: screenwidth * 0.0304,
                              color: Colors.grey[800],
                              fontWeight: FontWeight.w400))),
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 17.5),
                      width: screenwidth,
                      height: 0.5,
                      decoration: BoxDecoration(
                        color: Color(0xff054B83),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          addcardactions(context)
        ],
      ),
    );
  }

  Widget addcardactions(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
//          top: 18.5
          top: screenwidth * 0.0450),
      width: screenwidth,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
              margin: EdgeInsets.only(
//                  right: 24
                  right: screenwidth * 0.0583),
              child: Text(
                "Cancel",
                textAlign: TextAlign.center,
                style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
                    color: Colors.redAccent,
                    decoration: TextDecoration.underline,
                    //      fontSize: 13.5
                    fontSize: screenwidth * 0.0328)),
              ),
            ),
          ),
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: Container(
//              height: 33,width: 104,
              height: screenwidth * 0.0802, width: screenwidth * 0.253,
              decoration: BoxDecoration(
                  color: coffeecolor,
                  borderRadius: BorderRadius.all(Radius.circular(17)),
                  boxShadow: [
                    BoxShadow(
                        color: Color(0xffC3916A4D).withOpacity(0.35),
                        blurRadius: 30,
                        offset: Offset(0, 9))
                  ]),
              child: Center(
                child: Text(
                  "Save",
                  textAlign: TextAlign.center,
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w400,
                      color: Colors.white,
                      //      fontSize: 12.5
                      fontSize: screenwidth * 0.0304)),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
