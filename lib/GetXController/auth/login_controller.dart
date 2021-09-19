import 'package:flutter/material.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:metrocoffee/GetXController/base/basecontroller.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';
import 'package:metrocoffee/enums/uistate.dart';
import 'package:metrocoffee/screens/widgets/dialogs/discount_dialog.dart';
import 'package:metrocoffee/services/api_service.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/user_detail.dart';

import 'package:metrocoffee/services/rest/login.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../locator.dart';

class LoginController extends GetxController {
  bool isSigningIn = false;
  final googleSignIn = GoogleSignIn();
  final FacebookLogin facebookLogin = FacebookLogin();
  String? memberShipLoginErrorMsg;
  BaseController? baseController;
  HomeTabController? homeTabController;
  String? userName, email;

  @override
  void onInit() {
    super.onInit();
    baseController = Get.find<BaseController>();
    homeTabController = Get.find<HomeTabController>();
    getUserNameAndEmail();
  }

  //to change ui based on the status of the future result(like api call file io etc)
  UIState state = UIState.passive;

  //v-2
  setUiState(UIState st) {
    this.state = st;
    update();
  }

  // v-2 setting the error in membership login if occured
  setMemberShipLoginError(message) {
    this.memberShipLoginErrorMsg = message;
    update();
  }

  Future getUserNameAndEmail() async {
    userName = await getUserName();
    email = await getEmail();
    update();
  }

  loginwithemail(
      {required String emailaddress, required String password}) async {
    setUiState(UIState.processing);

    var response = await LoginService()
        .emailLogin(email: emailaddress, password: password);
    if (response != null) {
      if (response.containsKey("success")) {
        if (response["success"]) {
          addToken(provider: 'email', token: response['data']['token']);
          addUserDetail(
              name: response['data']['user']['name'] ?? "",
              email: response['data']['user']['email'] ?? "",
              id: response['data']['user']['id'] ?? 0);
          baseController?.setUserVerified();
          homeTabController?.initializeAllData();
          Get.offNamedUntil('/Base', (route) => false);
        }
        // setloggingstatefalse();
        // showDialog(
        //     context: context,
        //     barrierDismissible: false,
        //     builder: (_) {
        //       return SimpleDialog(
        //           backgroundColor: Colors.white,
        //           shape: RoundedRectangleBorder(
        //             borderRadius: BorderRadius.all(Radius.circular(18)),
        //           ),
        //           children: [DiscountDialog()]);
        //     });
      } else {
        print("email login undefined error");
      }
    }
    setUiState(UIState.completed);
  }

  Future logout() async {
    String provider = await getProvider();

    bool tokenRemoved = await removeToken();
    bool userRemoved = await removeUserDetail();

    if (provider == "facebook") {
      final fb = FacebookLogin();
      fb.logOut();
    }
    return (tokenRemoved && userRemoved) ? true : false;
  }

  changepassword(
    String? currentpass,
    String? newpass,
    String? confirmnewpass,
  ) async {
    Map response = await locator<ApiService>().changepassword(
        currentpassword: currentpass,
        newpassword: newpass,
        confirmnewpassword: confirmnewpass);
    print(response.values);
  }
}
