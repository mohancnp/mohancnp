import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:metrocoffee/ui/src/palette.dart';

void showErrorDialog({String? errorMessage, String? errorTitle}) {
  Get.defaultDialog(
    content: Center(
      child: Text(
        "${errorMessage ?? ' '}",
        style: TextStyle(
          fontWeight: FontWeight.w500,
          color: Colors.red,
        ),
        textAlign: TextAlign.center,
      ),
    ),
    titleStyle: TextStyle(
      fontWeight: FontWeight.bold,
    ),
    title: "${errorTitle ?? 'Error!'}",
    barrierDismissible: true,
    cancel: GestureDetector(
      onTap: Get.back,
      child: Container(
        padding: EdgeInsets.all(4.w),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4.r),
          color: Palette.pagebackgroundcolor,
        ),
        child: Text("Cancel"),
      ),
    ),
    // onCancel: ()=>print('called'),
  );
}
