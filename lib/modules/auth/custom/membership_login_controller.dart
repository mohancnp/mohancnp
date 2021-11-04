import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/auth_state.dart';

class MemberShipLoginController extends GetxController {
  TextEditingController _membershipNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _showpassword = false;
  bool _eye = false;
  AuthState _authState = AuthState.unverified;
  String _errorMessage = "";

  get errorMessage => this._errorMessage;

  set errorMessage(value) => this._errorMessage = value;
  get membershipNumberController => this._membershipNumberController;

  set membershipNumberController(value) =>
      this._membershipNumberController = value;

  get passwordController => this._passwordController;

  set passwordController(value) => this._passwordController = value;

  get showpassword => this._showpassword;

  set showpassword(value) => this._showpassword = value;

  get eye => this._eye;

  set eye(value) => this._eye = value;

  get authState => this._authState;

  set authState(value) => this._authState = value;

  @override
  void onInit() {
    super.onInit();
  }

  Future performMembershipLogin() async {}
}
