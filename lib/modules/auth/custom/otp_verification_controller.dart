import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/routing/names.dart';
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
    customFocusNodeList.forEach((element) {
      element.dispose();
    });
    super.onClose();
  }

  void navigateToRoute({required String routeName}) {
    Get.toNamed(routeName);
  }

  Future<void> verifyOTPandNavigate() async {
    if (verificationCode != null) {
      showCustomDialog(message: "Verifying Otp");
      await Future.delayed(
        Duration(milliseconds: 2000),
      );
      Get.back();
      navigateToRoute(routeName: PageName.resetPasswordPage);
    }
  }
}
