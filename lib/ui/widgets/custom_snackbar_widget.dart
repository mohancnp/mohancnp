import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/ui/src/palette.dart';

showCustomSnackBarMessage(
    {required String title,
    required String message,
    SnackPosition? snackPosition}) {
  Get.snackbar(
    title,
    message,
    colorText: Palette.textColor,
    backgroundColor: Colors.white,
    duration: const Duration(milliseconds: 1000),
    isDismissible: true,
    snackPosition: snackPosition,
  );
}
