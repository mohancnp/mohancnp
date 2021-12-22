import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/modules/auth/custom/otp_verification_controller.dart';
import 'package:metrocoffee/modules/auth/custom/password/forgot_password_page_controller.dart';
import 'package:metrocoffee/modules/shareables/dialogs/error_dialog.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

class ResetPasswordPageController extends GetxController {
  final passwordEditingController = TextEditingController();
  final passwordConfirmEditingController = TextEditingController();
  final forgotPasswordController = Get.find<ForgotPasswordController>();
  final otpController = Get.find<OtpVerificationController>();

  final resetPassKey = GlobalKey<FormState>();
  bool _eye = false;
  Rx<String> passwordErrorMessage = "".obs;
  Rx<String> confirmErrorMessage = "".obs;
  final _authService = locator.get<AuthService>();

  get eye => _eye;

  set eye(value) {
    _eye = value;
    update();
  }

  Future<void> changePassword() async {
    var validated = resetPassKey.currentState!.validate();
    if (validated) {
      showCustomDialog(message: "Reseting Your Password");
      final data = {
        "email": forgotPasswordController.emailEditingController.text,
        "password": passwordEditingController.text,
        "confirm_password": passwordConfirmEditingController.text,
        "pincode": otpController.verificationCode,
      };
      final response = await _authService.resetPassword(data);
      response.fold((l) {
        Get.back();
        Get.offAllNamed(PageName.loginpage);
      }, (r) {
        Get.back();
        showErrorDialog(
          errorMessage: r.message,
          errorTitle: r.tag,
        );
      });
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
}
