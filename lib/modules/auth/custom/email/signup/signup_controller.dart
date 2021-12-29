import 'package:dartz/dartz.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/new_user.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';
import 'package:metrocoffee/modules/shareables/dialogs/error_dialog.dart';
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
  final _authService = locator<AuthService>();
  final _tempStorage = locator<TempStorage>();
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

  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      passwordErrorMessage.value = "Password can't be empty";
      return "";
    }
    passwordErrorMessage.value = "";
    return null;
  }

  String? validateRePassword(String? value) {
    if (rePasswordEditingController.text != passwordEditingController.text) {
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

  Future<void> resigterUser() async {
    var validated = signUpFormKey.currentState!.validate();
    if (validated) {
      showCustomDialog(message: "Logging In");
      final newUser = NewUser(
        firstName: firstNameEditingController.text,
        lastName: lastNameEditingController.text,
        email: emailEditingController.text,
        password: passwordEditingController.text,
        passwordConfirmation: rePasswordEditingController.text,
      );
      final data = await _authService.createUser(newUser.toJson());
      handleRegistrationResponse(data);
      await Get.find<ProfilePageController>().getProfile();
    }
  }

  void handleRegistrationResponse(Either<SignupResponse, Failure> data) {
    data.fold((signup) {
      _tempStorage.writeString(TempStorageKeys.authToken, signup.accessToken);
      Get.back();
      Get.offAllNamed(PageName.homepage);
    }, (failure) {
      Get.back();
      showErrorDialog(errorTitle: failure.tag, errorMessage: failure.message);
    });
  }
}
