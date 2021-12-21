import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/auth_state.dart';
import 'package:metrocoffee/modules/shareables/dialogs/error_dialog.dart';

class MemberShipLoginController extends GetxController {
  var membershipNumberController = TextEditingController();
  var passwordController = TextEditingController();
  bool _visiblilty = false;
  AuthState _authState = AuthState.unverified;
  final loginFormKey = GlobalKey<FormState>();
  Rx<String> passwordErrorMessage = ''.obs;
  Rx<String> memberShipErrorMessage = ''.obs;

  get visiblilty => _visiblilty;

  set visiblilty(value) {
    _visiblilty = value;
    update();
  }

  get authState => _authState;

  set authState(value) => _authState = value;

  Future performMembershipLogin() async {
    var validated = loginFormKey.currentState!.validate();
    if (validated) {
      showErrorDialog(
        errorMessage: "Looks like the membership doesn't exists",
        errorTitle: "Login Error!!!",
      );
    }
  }

  void navigateToPageName({required String pageName}) {
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

  String? validateMemberShip(String? value) {
    if (value == null || value.isEmpty) {
      // print("membershp id not validated");
      memberShipErrorMessage.value = "membership id  not valid";
      return "";
    }
    memberShipErrorMessage.value = "";
    return null;
  }
}
