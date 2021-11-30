import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';

class PaymentOptions extends StatelessWidget {
  const PaymentOptions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
        width: 375.w,
        padding: EdgeInsets.symmetric(
          horizontal: screenwidth * 0.05352,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: EdgeInsets.only(
                top: screenwidth * 0.0535,
              ),
              padding: EdgeInsets.symmetric(
//                  vertical: 14, horizontal: 12
                  vertical: screenwidth * 0.0340,
                  horizontal: screenwidth * 0.0291),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 3))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        //        left: 11
                        left: screenwidth * 0.02676),
                    child: Text(
                      "Google Pay",
                      style: getpoppins(TextStyle(
                          color: Color(0xff404D4D),
                          //   fontSize: 13.5,
                          fontSize: screenwidth * 0.0328,
                          fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    color: Color(0xff404D4D),
                    //     size: 20,
                    size: screenwidth * 0.0486,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: screenwidth * 0.0535,
              ),
              padding: EdgeInsets.symmetric(
//                  vertical: 14, horizontal: 12
                  vertical: screenwidth * 0.0340,
                  horizontal: screenwidth * 0.0291),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 3))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        //        left: 11
                        left: screenwidth * 0.02676),
                    child: Text(
                      "Debit Card",
                      style: getpoppins(TextStyle(
                          color: Color(0xff404D4D),
                          //   fontSize: 13.5,
                          fontSize: screenwidth * 0.0328,
                          fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    color: Color(0xff404D4D),
                    //     size: 20,
                    size: screenwidth * 0.0486,
                  )
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(
                top: screenwidth * 0.0535,
              ),
              padding: EdgeInsets.symmetric(
//                  vertical: 14, horizontal: 12
                  vertical: screenwidth * 0.0340,
                  horizontal: screenwidth * 0.0291),
              decoration: BoxDecoration(
                  color: Colors.white,
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.05),
                        blurRadius: 10,
                        offset: Offset(0, 3))
                  ],
                  borderRadius: BorderRadius.all(Radius.circular(10))),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.only(
                        //        left: 11
                        left: screenwidth * 0.02676),
                    child: Text(
                      "Mobile Pay",
                      style: getpoppins(TextStyle(
                          color: Color(0xff404D4D),
                          //   fontSize: 13.5,
                          fontSize: screenwidth * 0.0328,
                          fontWeight: FontWeight.w400)),
                    ),
                  ),
                  Icon(
                    CupertinoIcons.forward,
                    color: Color(0xff404D4D),
                    //     size: 20,
                    size: screenwidth * 0.0486,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
