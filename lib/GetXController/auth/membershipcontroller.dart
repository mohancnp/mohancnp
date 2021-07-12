import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
class MemberShipController extends GetxController{
  TextEditingController membershipnumbercontroller=TextEditingController();
  TextEditingController passwordcontroller=TextEditingController();

  Widget loginfields(BuildContext context){
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
        //        top: 37
          top: screenwidth*0.0900
            ),
            padding: EdgeInsets.symmetric(
       //         horizontal: 24
         horizontal: screenwidth*0.0583
            ),
      //      height: 45,
        height: screenwidth*0.1094,
            width: screenwidth,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.all(Radius.circular(26)),
            ),
            child: TextFormField(
              controller: membershipnumbercontroller,
              style: TextStyle(
                fontFamily: poppinslight,
                color: Colors.black87,
         //       fontSize: 13.5
           fontSize: screenwidth*0.0328
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Membership No.',
                hintStyle: TextStyle(
                  fontFamily: poppinslight,
                  color: Color(0xff404d4d)
                ),

              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              //        top: 37
                top: screenwidth*0.0800
            ),
            padding: EdgeInsets.symmetric(
              //         horizontal: 24
                horizontal: screenwidth*0.0583
            ),
            //      height: 45,
            height: screenwidth*0.1094,
            width: screenwidth,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.all(Radius.circular(26)),
            ),
            child: TextFormField(
              controller: passwordcontroller,
              style: TextStyle(
                  fontFamily: poppinslight,
                  color: Colors.black87,
                  //       fontSize: 13.5
                  fontSize: screenwidth*0.0328
              ),
              decoration: InputDecoration(
                border: InputBorder.none,
                hintText: 'Password',
                hintStyle: TextStyle(
                    fontFamily: poppinslight,
                    color: Color(0xff404d4d)
                ),

              ),
            ),
          ),
          Container(
            child: Text("Forgot Password?",style: TextStyle(
            ),),
          )
        ],
      ),
    );
  }
}