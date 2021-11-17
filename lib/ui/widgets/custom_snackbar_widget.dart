import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCustomSnackBarMessage({required String title, required String message}) {
  Get.snackbar(title, message,
      colorText: Colors.red, duration: Duration(milliseconds: 1500));
}
