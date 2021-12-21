import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
              vertical: screenwidth * 0.0340,
              horizontal: screenwidth * 0.0291,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: screenwidth * 0.02676),
                  child: Text(
                    "Google Pay",
                    style: TextStyle(
                      color: const Color(0xff404D4D),
                      fontSize: screenwidth * 0.0328,
                       
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  Icons.forward,
                  color: const Color(0xff404D4D),
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
              vertical: screenwidth * 0.0340,
              horizontal: screenwidth * 0.0291,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: screenwidth * 0.02676),
                  child: Text(
                    "Debit Card",
                    style: TextStyle(
                      color: const Color(0xff404D4D),
                      fontSize: screenwidth * 0.0328,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: const Color(0xff404D4D),
                  size: screenwidth * 0.0486,
                ),
              ],
            ),
          ),
          Container(
            margin: EdgeInsets.only(
              top: screenwidth * 0.0535,
            ),
            padding: EdgeInsets.symmetric(
              vertical: screenwidth * 0.0340,
              horizontal: screenwidth * 0.0291,
            ),
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.05),
                  blurRadius: 10,
                  offset: const Offset(0, 3),
                ),
              ],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  margin: EdgeInsets.only(left: screenwidth * 0.02676),
                  child: Text(
                    "Mobile Pay",
                    style: TextStyle(
                      color: const Color(0xff404D4D),
                      fontSize: screenwidth * 0.0328,
                       
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Icon(
                  CupertinoIcons.forward,
                  color: const Color(0xff404D4D),
                  size: screenwidth * 0.0486,
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
