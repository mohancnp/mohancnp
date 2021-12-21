import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/ui/src/palette.dart';

import '../checkout_page_controller.dart';

class TimerWidget extends StatelessWidget {
  final void Function() onPressed;
  final int index;
  const TimerWidget({Key? key, required this.index, required this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Obx(
        () {
          final controller = Get.find<CheckoutPageController>();

          return AnimatedContainer(
            // width: 100.w,
            duration: const Duration(milliseconds: 200),
            margin: EdgeInsets.only(
                //     right: 16
                right: 16.w,
                top: 8.h),
            padding: EdgeInsets.symmetric(
                //          horizontal: 17.5
                horizontal: 17.w),
            decoration: BoxDecoration(
                color: index == controller.selectedTimeIndex.value
                    ? Palette.coffeeColor
                    : Colors.white,
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                border: Border.all(color: Palette.textColor, width: 1.25)),
            child: Center(
              child: Text(
                controller.timeValues[index],
                style: TextStyle(
                  color: index == controller.selectedTimeIndex.value
                      ? Colors.white
                      : Colors.black54,
                  fontSize: 11.sp,
                   
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
