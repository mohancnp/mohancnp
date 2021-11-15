import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCustomSnackBarMessage({required String title, required String message}) {
  Get.snackbar(title, message,
      colorText: Colors.red, duration: Duration(milliseconds: 1500));

  // var context = Get.context;
  // if (context != null) {
  //   final snackBar = SnackBar(
  //     content: Text('$message'),
  //     duration: Duration(milliseconds: 700),
  //   );
  //   ScaffoldMessenger.of(context).showSnackBar(snackBar);
  // }
}
