import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/palette.dart';

void showErrorDialog({String? errorMessage, String? errorTitle}) {
  Get.defaultDialog(
    content: Center(
      child: Text(
        errorMessage ?? ' ',
        style: const TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
    ),

    titleStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    title: errorTitle ?? 'Error!',
    barrierDismissible: true,
    cancel: GestureDetector(
      onTap: Get.back,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: Palette.deepOrange,
        ),
        child: Padding(
          padding: EdgeInsets.all(4.w),
          child: Text(
            "Cancel",
            style: TextStyle(fontSize: 12.sp),
          ),
        ),
      ),
    ),
    // onCancel: ()=>print('called'),
  );
}
