import 'package:flutter/material.dart';
import "package:get/get.dart";
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/modules/shareables/dialogs/error_dialog.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/validator.dart';

class ForgotPasswordController extends GetxController {
  Rx<String> errorMessage = "".obs;
  final emailEditingController = TextEditingController();
  final sendCodeForm = GlobalKey<FormState>();
  var _authService = locator.get<AuthService>();
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
      var data = {"email": emailEditingController.text};
      var response = await _authService.sendEmailForPasswordReset(data);
      response.fold((l) {
        Get.back();
        Get.toNamed(PageName.otpVerificationPage);
      }, (r) {
        Get.back();
        showErrorDialog(errorTitle: r.tag, errorMessage: r.message);
      });
    } else {
      print("not validated");
    }
  }

  void navigateToPageName({required String PageNameName}) {}

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
