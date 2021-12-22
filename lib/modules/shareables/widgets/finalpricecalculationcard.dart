import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/currency.dart';
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
            offset: const Offset(0, 3),
          )
        ],
        borderRadius: const BorderRadius.all(
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
              Text(
                "Discount",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                   
                  color: const Color(0xff404D4D),
                  fontSize: 12.sp,
                ),
              ),
              Text(
                "${Currency.symbol} 0",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: const Color(0xff404D4D),
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Delivery Fee",
                style: TextStyle(
                  fontWeight: FontWeight.w300,
                   
                  color: const Color(0xff404D4D),
                  fontSize: 12.sp,
                ),
              ),
              SizedBox(
                child: Text(
                  "${Currency.symbol} 0.0",
                  style: TextStyle(
                    fontWeight: FontWeight.w300,
                     
                    color: const Color(0xff404D4D),
                    fontSize: 12.sp,
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(top: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Total",
                    style: TextStyle(
                      fontWeight: FontWeight.w500,
                       
                      color: const Color(0xff404D4D),
                      fontSize: 16.sp,
                    ),
                  ),
                  Obx(
                    () {
                      return SizedBox(
                        child: Text(
                          "${Currency.symbol} ${controller.totalAmount.toStringAsPrecision(3)}",
                          style: TextStyle(
                             
                            fontWeight: FontWeight.w500,
                            color: const Color(0xff404D4D),
                            fontSize: 16.sp,
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
