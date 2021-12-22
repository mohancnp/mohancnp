import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/modules/auth/custom/password/forgot_password_page_controller.dart';
import 'package:metrocoffee/modules/shareables/dialogs/error_dialog.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

class OtpVerificationController extends GetxController {
  String errorMessage = "";
  late List<FocusNode> customFocusNodeList = [];
  final forgotPasswordController = Get.find<ForgotPasswordController>();
  final _authService = locator.get<AuthService>();
  String? verificationCode;

  void navigateToPageName({required String PageName}) {
    Get.toNamed(PageName);
  }

  Future<void> verifyOTPandNavigate() async {
    if (verificationCode != null) {
      showCustomDialog(message: "Verifying Otp");
      final data = {
        "email": forgotPasswordController.emailEditingController.text,
        "pincode": verificationCode,
      };
      final response = await _authService.verifyOtp(data);
      response.fold((l) {
        Get.back();
        navigateToPageName(PageName: PageName.resetPasswordPage);
      }, (r) {
        Get.back();
        showErrorDialog(errorTitle: r.tag, errorMessage: r.message);
      });
    }
  }
}
