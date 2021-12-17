import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/validator.dart';

class EmailLoginController extends GetxController {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  Rx<String> passwordErrorMessage = ''.obs;
  Rx<String> emailErrorMessage = ''.obs;

  bool _eye = false;
  get eye => this._eye;
  set eye(value) {
    this._eye = value;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      print("password not validated");
      passwordErrorMessage.value = "password not valid";
      return "";
    }
    passwordErrorMessage.value = "";
    return null;
  }

  String? validateEmail(String? value) {
    var message = emailValidtor(value: value);
    if (message != null) {
      emailErrorMessage.value = message;
    }
    return null;
  }

  void performEmailLogin() async {
    var validated = loginFormKey.currentState!.validate();

    if (validated) {
      print("validated");
      // print(validated);
      showCustomDialog(message: "Logging In");
      await Future.delayed(
        Duration(milliseconds: 2000),
      );
      Get.back();
      Get.offAllNamed(PageName.homepage);
    } else {
      print("not validated");
    }
  }

  void navigateToRoute({required String routeName}) {
    Get.toNamed(routeName);
  }
}
