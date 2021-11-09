import 'package:flutter/material.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class FinalProductCalculationCard extends StatelessWidget {
  // final CartController controller = Get.find<CartController>();

  const FinalProductCalculationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: 320.w,
      height: 128.h,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 10.r,
              offset: Offset(0, 3),
            )
          ],
          borderRadius: BorderRadius.all(Radius.circular(9))),
      padding: EdgeInsets.symmetric(
          //     vertical: 26,horizontal: 26
          vertical: screenwidth * 0.06326,
          horizontal: screenwidth * 0.06326),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Discount",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color(0xff404D4D),
                      //       fontSize: 12.5
                      fontSize: screenwidth * 0.03041)),
                ),
              ),
              Container(
                child: Text(
                  "\$0.00",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color(0xff404D4D),
                      //      fontSize: 12.5
                      fontSize: screenwidth * 0.03041)),
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Delivery Fee",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color(0xff404D4D),
                      //       fontSize: 12.5
                      fontSize: screenwidth * 0.03041)),
                ),
              ),
              SizedBox(
                  child: Text(
                "\$ 2.0",
                style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w300,
                    color: Color(0xff404D4D),
                    //      fontSize: 12.5
                    fontSize: screenwidth * 0.03041)),
              )),
            ],
          ),
          Container(
            margin: EdgeInsets.only(top: 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  child: Text(
                    "Total",
                    style: getpoppins(TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Color(0xff404D4D),
                        //       fontSize: 16
                        fontSize: 16.sp)),
                  ),
                ),
                SizedBox(
                    child: Text(
                  "\$ 3.00",
                  style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w500,
                      color: Color(0xff404D4D),
                      //      fontSize: 16
                      fontSize: 16.sp)),
                )),
              ],
            ),
          )
        ],
      ),
    );
  }
}
