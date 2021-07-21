import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/constants/fontconstants.dart';

class CartProductCard extends StatelessWidget {
  final int? index;

  const CartProductCard({Key? key, @required this.index}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      padding: EdgeInsets.symmetric(
          //        horizontal: 8,vertical: 6
          horizontal: screenwidth * 0.0194,
          vertical: screenwidth * 0.0145),
      margin: EdgeInsets.only(
          //     bottom: 20
          bottom: screenwidth * 0.0486),
      decoration: BoxDecoration(
          color: Color(0xffFBFBFB),
          borderRadius: BorderRadius.all(Radius.circular(9)),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.05),
                offset: Offset(0, 3),
                blurRadius: 10)
          ]),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  //     height: 100, width: 100,
                  height: screenwidth * 0.2433, width: screenwidth * 0.2433,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(9)),
                  ),
                  child: Image.asset(
                    getimageforrow1(index),
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  //  height: 76,
                  height: screenwidth * 0.1849,
                  margin: EdgeInsets.only(
                      //        left: 18
                      left: screenwidth * 0.0437),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        child: Text(
                          gettitleforrow1(index),
                          style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff404D4D),
                              //       fontSize: 14.5
                              fontSize: screenwidth * 0.03527)),
                        ),
                      ),
                      Container(
                        child: Text(
                          '\$ ' + getpriceforrow1(index),
                          style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff550E1C),
                              //         fontSize: 14.5
                              fontSize: screenwidth * 0.03527)),
                        ),
                      ),
                      Container(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                CupertinoIcons.minus_circle,
                                //       size: 20,
                                size: screenwidth * 0.0486,
                                color: Colors.black54,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.symmetric(
                                  //         horizontal: 6
                                  horizontal: screenwidth * 0.01459),
                              child: Text(
                                "1",
                                style: getpoppins(TextStyle(
                                    fontWeight: FontWeight.w300,
                                    color: Colors.black54)),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {},
                              child: Icon(
                                CupertinoIcons.plus_circle,
                                //      size: 20,
                                size: screenwidth * 0.0486,
                                color: Colors.black54,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          GestureDetector(
              onTap: () {},
              child: Icon(
                CupertinoIcons.xmark_circle,
            //    size: 18,
              size: screenwidth*0.0437,
                color: Colors.redAccent,
              ))
        ],
      ),
    );
  }

  getimageforrow1(int? index) {
    if (index == 0) {
      return "assets/images/coffee1.png";
    }
    if (index == 1) {
      return "assets/images/coffe2.png";
    }
    if (index == 2) {
      return "assets/images/coffee4.png";
    }
  }

  gettitleforrow1(int? index) {
    if (index == 0) {
      return "Café Latte";
    }
    if (index == 1) {
      return "Latte Machiato";
    }
    if (index == 2) {
      return "Café Americano";
    }
  }

  getpriceforrow1(int? index) {
    if (index == 0) {
      return "3.00";
    }
    if (index == 1) {
      return "2.00";
    }
    if (index == 2) {
      return "4.00";
    }
  }
}
