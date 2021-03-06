import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/new_user.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';
import 'package:metrocoffee/modules/shareables/dialogs/error_dialog.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/validator.dart';

class LoginController extends GetxController {
  final emailEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final loginFormKey = GlobalKey<FormState>();
  Rx<String> passwordErrorMessage = ''.obs;
  Rx<String> emailErrorMessage = ''.obs;
  final _authService = locator<AuthService>();
  final _tempStorage = locator<TempStorage>();
  final redirectionController = Get.find<RedirectionController>();
  bool _eye = false;
  get eye => _eye;
  set eye(value) {
    _eye = value;
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

  Future<void> performEmailLogin() async {
    final validated = loginFormKey.currentState!.validate();
    if (validated) {
      showCustomDialog(message: "Logging In");
      final data = {
        "email": emailEditingController.text,
        "password": passwordEditingController.text,
      };
      final serverResponse = await _authService.loginUserWithEmail(data);
      await handleLoginResponse(serverResponse);
    }
  }

  Future<void> handleLoginResponse(Either<SignupResponse, Failure> data) async {
    data.fold((signup) async {
      _tempStorage.writeString(TempStorageKeys.authToken, signup.accessToken);
      await Get.find<ProfilePageController>().getProfile();
      removeDialog();
      redirectionController.userExists = true;
      if (redirectionController.fromCheckoutPage) {
        BaseController.to
            .updateUserVerificationStatus(UserVerficationStatus.verified);
        Get.offAllNamed(PageName.homepage);
      } else {
        Get.offAllNamed(PageName.homepage);
      }
    }, (failure) {
      removeDialog();
      showErrorDialog(errorTitle: failure.tag, errorMessage: failure.message);
    });
  }

  void navigateToRoute({required String pageName}) {
    Get.toNamed(pageName);
  }

  void removeDialog() {
    Get.back();
  }
}
