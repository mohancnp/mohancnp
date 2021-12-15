import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/currency.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';

class FinalProductCalculationCard extends StatelessWidget {
  final CartController controller = Get.find<CartController>();

  FinalProductCalculationCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        borderRadius: BorderRadius.all(
          Radius.circular(9),
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 26.h, horizontal: 26.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                child: Text(
                  "Discount",
                  style: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xff404D4D),
                        fontSize: 12.sp),
                  ),
                ),
              ),
              Container(
                child: Text(
                  "${Currency.symbol} 0",
                  style: getpoppins(
                    TextStyle(
                      fontWeight: FontWeight.w300,
                      color: Color(0xff404D4D),
                      fontSize: 12.sp,
                    ),
                  ),
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
                  style: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xff404D4D),
                        fontSize: 12.sp),
                  ),
                ),
              ),
              SizedBox(
                child: Text(
                  "${Currency.symbol} 0.0",
                  style: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w300,
                        color: Color(0xff404D4D),
                        fontSize: 12.sp),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    child: Text(
                      "Total",
                      style: getpoppins(
                        TextStyle(
                          fontWeight: FontWeight.w500,
                          color: Color(0xff404D4D),
                          fontSize: 16.sp,
                        ),
                      ),
                    ),
                  ),
                  Obx(
                    () {
                      return SizedBox(
                        child: Text(
                          "${Currency.symbol} ${controller.totalAmount.toStringAsPrecision(3)}",
                          style: getpoppins(
                            TextStyle(
                              fontWeight: FontWeight.w500,
                              color: Color(0xff404D4D),
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
