import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/shareables/dialogs/error_dialog.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

class ResetPasswordPageController extends GetxController {
  final passwordEditingController = TextEditingController();
  final passwordConfirmEditingController = TextEditingController();
  final resetPassKey = GlobalKey<FormState>();
  bool _eye = false;
  Rx<String> passwordErrorMessage = "".obs;
  Rx<String> confirmErrorMessage = "".obs;

  get eye => this._eye;

  set eye(value) {
    this._eye = value;
    update();
  }

  Future<void> changePassword() async {
    var validated = resetPassKey.currentState!.validate();
    if (validated) {
      //logic will be changed for different api error.
      if (passwordConfirmEditingController.text ==
          passwordEditingController.text) {
        showCustomDialog(message: "Reseting Your Password");
        await Future.delayed(
          Duration(milliseconds: 2000),
        );
        Get.back();
        Get.offAllNamed(PageName.loginpage);
      } else {
        showErrorDialog(
            errorMessage: "Set of Password Doesn't match,try again!!",
            errorTitle: "Error!!!");
      }
    } else {
      print("validation error");
    }
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      passwordErrorMessage.value = "password not valid";
      return "";
    }
    passwordErrorMessage.value = "";
    return null;
  }

  String? validateConfirmPassword(String? value) {
    if (passwordConfirmEditingController.text !=
        passwordEditingController.text) {
      confirmErrorMessage.value = "password doesn't match";
      return "";
    }
    confirmErrorMessage.value = "";
    return null;
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
