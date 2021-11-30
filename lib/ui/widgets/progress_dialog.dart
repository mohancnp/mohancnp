import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/ui/src/palette.dart';

Future showCustomDialog({String? message}) async {
  Get.defaultDialog(
    content: SizedBox(
      width: 20.w,
      height: 20.h,
      child: CircularProgressIndicator(
        color: Palette.coffeeColor,
      ),
    ),
    title: "${message ?? 'Processing'}",
    barrierDismissible: false,
  );
}
