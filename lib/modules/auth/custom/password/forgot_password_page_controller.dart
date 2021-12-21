import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/validator.dart';

class ForgotPasswordController extends GetxController {
  Rx<String> errorMessage = "".obs;
  final emailEditingController = TextEditingController();
  final sendCodeForm = GlobalKey<FormState>();

  Future<void> sendOtpInEmail() async {
    var validated = sendCodeForm.currentState!.validate();
    if (validated) {
      showCustomDialog(message: "Sending Email");
      await Future.delayed(
        const Duration(milliseconds: 2000),
      );
      Get.back();
      Get.toNamed(PageName.otpVerificationPage);
    }
  }

  void navigateToPageName({required String pageName}) {}

  String? validateEmail(String? value) {
    var message = emailValidtor(value: value);
    if (message != null) {
      errorMessage.value = message;
      return "";
    }
    errorMessage.value = "";

    return null;
  }
}
