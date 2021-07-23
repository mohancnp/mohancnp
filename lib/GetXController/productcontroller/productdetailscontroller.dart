import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/constants/fontconstants.dart';
import 'package:metrocoffee/theme.dart';
class ProductDetailController extends GetxController{
  int currentsize = 0;

  setsize(int index) {
    currentsize = index;
    update();
  }

  Widget fooditemsize(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.only(
        //          left: 22, right: 22
          left: screenwidth * 0.0535,
          right: screenwidth * 0.0535),
      width: screenwidth,
      child:
      Column(
      children:[
          Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [  Container(
          margin: EdgeInsets.only(
//              top: 22,bottom: 9.5
              top: screenwidth*0.0535,bottom: screenwidth*0.0231
          ),
          child: Text("Select size",style:  getpoppins(
            TextStyle(
              color: Color(0xff344141),
         //     fontSize: 14.5,
           fontSize: screenwidth*0.0352,
              fontWeight: FontWeight.w500
            )
          ),),

      )]),Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setsize(0);
                    },
                    child: AnimatedContainer(
                      padding: EdgeInsets.all(8),
                      duration: Duration(milliseconds: 150),
                      //   height: 74,width: 75,
                      height: screenwidth * 0.2, width: screenwidth * 0.2,
                      decoration: BoxDecoration(
                        color: Color(0xffE8E8E8),
                        border: Border.all(
                            color: currentsize != 0
                                ? Colors.transparent
                                : Color(0xff550E1C),
                            width: currentsize != 0 ? 0 : 2),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/productimages/burgermetrocoffee.png",
                          //    height: 75,
                      //    height: screenwidth*0.2,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(
                    //      top: 4
                      top: screenwidth * 0.0097),
                  child: Text(
                    "Small",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w400,
                        color: darkgrey,
                        //     fontSize: 13.5
                        fontSize: screenwidth * 0.0328)),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setsize(1);
                    },
                    child: AnimatedContainer(
                      padding: EdgeInsets.all(8),
                      duration: Duration(milliseconds: 150),
                      //       height: 90,width: 91,
                      height: screenwidth * 0.2426, width: screenwidth * 0.2426,
                      decoration: BoxDecoration(
                        color: Color(0xffE8E8E8),
                        border: Border.all(
                            color: currentsize != 1
                                ? Colors.transparent
                                : coffeecolor,
                            width: currentsize != 1 ? 0 : 2),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/productimages/burgermetrocoffee.png",
                          //        height: 91,
                      //    height: screenwidth*0.242,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),
                Container(
                  margin: EdgeInsets.only(
                    //      top: 4
                      top: screenwidth * 0.0097),
                  child: Text(
                    "Medium",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w400,
                        color: darkgrey,
                        //     fontSize: 13.5
                        fontSize: screenwidth * 0.0328)),
                  ),
                )
              ],
            ),
          ),
          Container(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                GestureDetector(
                    onTap: () {
                      setsize(2);
                    },
                    child: AnimatedContainer(
                      padding: EdgeInsets.all(8),
                      duration: Duration(milliseconds: 150),
                      //      height: 100,width: 101,
                      height: screenwidth * 0.2693, width: screenwidth * 0.2693,
                      decoration: BoxDecoration(
                        color: Color(0xffE8E8E8),
                        border: Border.all(
                            color: currentsize != 2
                                ? Colors.transparent
                                : coffeecolor,
                            width: currentsize != 2 ? 0 : 2),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                      ),
                      child: Center(
                        child: Image.asset(
                          "assets/images/productimages/burgermetrocoffee.png",
                          //      height: 101,
//                          height: screenwidth*0.2693,
                          fit: BoxFit.cover,
                        ),
                      ),
                    )),

                Container(
                  margin: EdgeInsets.only(
                    //      top: 4
                      top: screenwidth * 0.0097),
                  child: Text(
                    "Large",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w400,
                        color: darkgrey,
                        //     fontSize: 13.5
                        fontSize: screenwidth * 0.0328)),
                  ),
                )
              ],
            ),
          ),
        ],
      ),])
    );
  }
}