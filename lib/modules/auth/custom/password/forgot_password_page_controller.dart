import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/validator.dart';

class ForgotPasswordController extends GetxController {
  Rx<String> errorMessage = "".obs;
  final emailEditingController = TextEditingController();
  final sendCodeForm = GlobalKey<FormState>();
  @override
  void onInit() {
    print("called");
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  Future<void> sendOtpInEmail() async {
    var validated = sendCodeForm.currentState!.validate();
    // print(validated);
    if (validated) {
      showCustomDialog(message: "Sending Email");
      await Future.delayed(
        Duration(milliseconds: 2000),
      );
      Get.back();
      Get.toNamed(PageName.otpVerificationPage);
    } else {
      print("not validated");
    }
  }

  void navigateToRoute({required String routeName}) {}

  String? validateEmail(String? value) {
    var message = emailValidtor(value: value);
    if (message != null) {
      errorMessage.value = message;
    }
    return null;
  }
}
