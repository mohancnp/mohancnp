import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/new_user.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/modules/home/home_controller.dart';
import 'package:metrocoffee/modules/shareables/dialogs/error_dialog.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/validator.dart';

class EmailLoginController extends GetxController {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  Rx<String> passwordErrorMessage = ''.obs;
  Rx<String> emailErrorMessage = ''.obs;
  final _authService = locator<AuthService>();
  final _tempStorage = locator<TempStorage>();

  bool _eye = false;
  get eye => this._eye;
  set eye(value) {
    this._eye = value;
    update();
  }

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
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
      return "";
    }
    emailErrorMessage.value = "";
    return null;
  }

  void performEmailLogin() async {
    var validated = loginFormKey.currentState!.validate();
    if (validated) {
      showCustomDialog(message: "Logging In");
      var data = {
        "email": emailEditingController.text,
        "password": passwordEditingController.text,
      };
      var serverResponse = await _authService.loginUserWithEmail(data);
      handleLoginResponse(serverResponse);
    } else {
      print("not validated");
    }
  }

  void handleLoginResponse(Either<SignupResponse, Failure> data) {
    data.fold((signup) {
      _tempStorage.writeString(TempStorageKeys.authToken, signup.accessToken);
      Get.find<HomeController>().user = signup.customer;
      Get.back();
      Get.offAllNamed(PageName.homepage);
    }, (failure) {
      Get.back();
      showErrorDialog(errorTitle: failure.tag, errorMessage: failure.message);
    });
  }

//TODO: shall we go for make it specific named routing function?
  void navigateToRoute({required String pageName}) {
    Get.toNamed(pageName);
  }
}
