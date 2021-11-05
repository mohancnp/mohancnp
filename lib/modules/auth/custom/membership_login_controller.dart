import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/auth_state.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/user_model.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/core/services/storage/db/user_table.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';

class MemberShipLoginController extends GetxController {
  TextEditingController _membershipNumberController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  bool _showpassword = false;
  bool _eye = false;
  AuthState _authState = AuthState.unverified;
  String _errorMessage = "";

  get errorMessage => this._errorMessage;

  set errorMessage(value) {
    this._errorMessage = value;
    update();
  }

  get membershipNumberController => this._membershipNumberController;

  set membershipNumberController(value) =>
      this._membershipNumberController = value;

  get passwordController => this._passwordController;

  set passwordController(value) => this._passwordController = value;

  get showpassword => this._showpassword;

  set showpassword(value) => this._showpassword = value;

  get eye => this._eye;

  set eye(value) {
    this._eye = value;
    update();
  }

  get authState => this._authState;

  set authState(value) => this._authState = value;

  @override
  void onInit() {
    super.onInit();
  }
/*perform membershp login and stores the token in shared pref and user detail in to the  local database*/

  Future performMembershipLogin() async {
    if (_membershipNumberController.text.isNotEmpty ||
        _passwordController.text.isNotEmpty) {
      try {
        var response = await locator.get<AuthService>().performMemberShipLogin(
            _membershipNumberController.text, _passwordController.text);
        var token = response["token"];
        var user = response["user"];
        locator<TempStorage>().writeString(TempStorageKeys.authToken, token);
        User newUser = User.fromJson(user);
        await locator.get<UserTableHandler>().addUser(newUser);
        _membershipNumberController.text = "";
        _passwordController.text = "";
        errorMessage = "";
        _authState = AuthState.loggedIn;
      } on AppException catch (e) {
        print(e.message);
        errorMessage = e.message;
      } on ServerException catch (e) {
        print(e.message);
        errorMessage = e.message;
      }
    } else {
      errorMessage = "please fill the form";
      print("empty membership number or password");
    }
  }
}
