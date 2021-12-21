import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showErrorDialog({String? errorMessage, String? errorTitle}) {
  Get.defaultDialog(
    content: Center(
      child: Text(
        errorMessage ?? ' ',
        style: const TextStyle(
          fontWeight: FontWeight.w500,
        ),
      textAlign: TextAlign.center,
      ),
    ),
  
    titleStyle: const TextStyle(
      fontWeight: FontWeight.bold,
    ),
    title: errorTitle ?? 'Error!',
    barrierDismissible: true,
  );
}
