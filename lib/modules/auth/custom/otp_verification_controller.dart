import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

class OtpVerificationController extends GetxController {
  String errorMessage = "";
  late List<FocusNode> customFocusNodeList = [];
  late var textEditingControllerList = <TextEditingController>[];
  String? verificationCode;
  @override
  void onInit() {
    textEditingControllerList = List.generate(
      4,
      (index) => TextEditingController(),
    );
    customFocusNodeList = List.generate(
      4,
      (index) => FocusNode(),
    );
    super.onInit();
  }

  @override
  void onClose() {
    for (var element in customFocusNodeList) {
      element.dispose();
    }
    super.onClose();
  }

  void navigateToPageName({required String pageName}) {
    Get.toNamed(pageName);
  }

  Future<void> verifyOTPandNavigate() async {
    if (verificationCode != null) {
      showCustomDialog(message: "Verifying Otp");
      await Future.delayed(
        const Duration(milliseconds: 2000),
      );
      Get.back();
      navigateToPageName(pageName: PageName.resetPasswordPage);
    }
  }
}
