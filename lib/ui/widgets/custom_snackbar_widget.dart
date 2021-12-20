import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/ui/src/palette.dart';

showCustomSnackBarMessage({required String title, required String message}) {
  Get.snackbar(
    title,
    message,
    colorText: Palette.textColor,
    backgroundColor: Colors.white,
    duration: Duration(milliseconds: 500),
    isDismissible: true,
  );
}
