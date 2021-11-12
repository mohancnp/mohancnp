import 'package:flutter/material.dart';
import 'package:get/get.dart';

showCustomSnackBarMessage(String message) {
  var context = Get.context;
  if (context != null) {
    final snackBar = SnackBar(
      content: Text('$message'),
      duration: Duration(milliseconds: 700),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }
}
