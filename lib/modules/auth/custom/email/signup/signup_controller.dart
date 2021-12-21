import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/validator.dart';

class SignUpController extends GetxController {
  final emailEditingController = TextEditingController();
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final rePasswordEditingController = TextEditingController();
  final redirectionController = Get.find<RedirectionController>();
  final loginEmailEditingController = TextEditingController();
  final loginPasswordEditingController = TextEditingController();
  final signUpFormKey = GlobalKey<FormState>();
  Rx<String> firstNameErrorMessage = "".obs;
  Rx<String> lastNameErrorMessage = "".obs;
  Rx<String> emailErrorMessage = "".obs;
  Rx<String> passwordErrorMessage = "".obs;
  Rx<String> rePasswordErrorMessage = "".obs;

  bool _eye = false;
  get eye => _eye;

  set eye(value) {
    _eye = value;
    update();
  }

  void navigateToPageName({required String pageName}) {
    if (redirectionController.userExists) {}
    Get.toNamed(pageName);
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      passwordErrorMessage.value = "password not valid";
      return "";
    }
    passwordErrorMessage.value = "";
    return null;
  }

  String? validateRePassword(String? value) {
    if (value == null || value.isEmpty) {
      rePasswordErrorMessage.value = "password doesn't match";
      return "";
    }
    rePasswordErrorMessage.value = "";
    return null;
  }

  String? validateFirstName(String? value) {
    if (value == null || value.isEmpty) {
      firstNameErrorMessage.value = "first name can't be empty";
      return "";
    }
    firstNameErrorMessage.value = "";
    return null;
  }

  String? validateSecondName(String? value) {
    if (value == null || value.isEmpty) {
      lastNameErrorMessage.value = "last name can't be empty";
      return "";
    } else {
      lastNameErrorMessage.value = "";
      return null;
    }
  }

  String? validateEmail(String? value) {
    var message = emailValidtor(value: value);
    if (message != null) {
      emailErrorMessage.value = message;
      return "";
    }
    emailErrorMessage.value = "";

    return null;
  }

  void resigterUser() async {
    var validated = signUpFormKey.currentState!.validate();
    if (validated) {
      showCustomDialog(message: "Logging In");
      await Future.delayed(
        const Duration(milliseconds: 2000),
      );
      Get.back();
      Get.offAllNamed(PageName.homepage);
    }
  }
}
