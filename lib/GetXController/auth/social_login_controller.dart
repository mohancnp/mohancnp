import 'package:flutter/cupertino.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:metrocoffee/GetXController/base/basecontroller.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';
import 'package:metrocoffee/enums/uistate.dart';
import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/user_detail.dart';
import 'package:metrocoffee/services/rest/login.dart';

class SocialLoginController extends GetxController {
  BaseController? baseController;
  HomeTabController? homeTabController;
  bool isLoggedIn = false;

  UIState state = UIState.passive;

  setLoginStatus() {
    isLoggedIn = !isLoggedIn;
  }

  setActivity(state) {
    this.state = state;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    baseController = Get.find<BaseController>();
    homeTabController = Get.find<HomeTabController>();
  }

  Future performFacebookLogin() async {
    setActivity(UIState.processing);

    //facebook login object xz
    final fb = FacebookLogin();

    final result = await fb.logIn(permissions: [
      FacebookPermission.publicProfile,
      FacebookPermission.email,
    ]);
    switch (result.status) {
      case FacebookLoginStatus.error:
        print("error occured during the login procedure");
        setActivity(UIState.error);
        break;
      case FacebookLoginStatus.cancel:
        print("user has cancelled the login");
        setActivity(UIState.error);
        break;
      case FacebookLoginStatus.success:
        print("Access token for facebook: ${result.accessToken}");
        // final profile = await fb.getUserProfile();
        //now send the facebook accessToken to the server
        LoginService()
            .socialLogin(
                accessToken: result.accessToken!.token, provider: "facebook")
            .then((response) {
          // print("Server Response: $response");

          if (response['success'] == true) {
            var data = response['data'];
            var token = data['token'];
            var user = data['user'];
            var newClient = Client.fromJson(user);

            addToken(provider: 'facebook', token: token.toString());
            addUserDetail(
                name: response['data']['name'],
                email: response['data']['email'],
                id: response['data']['id']);
            homeTabController?.initializeAllData();
            baseController?.setUserVerified();
            Get.offNamedUntil('/Base', (route) => false);
            // print("server response data: $data");
          } else {
            print(
                'undefined situation in api call to store facebook access token');
          }
        });
        setActivity(UIState.completed);

        break;
      default:
        print('undefined situation in facebook login');
        break;
    }
  }

  Future performGoogleSignin() async {
    final googleSignIn = GoogleSignIn();
    try {
      final user = await googleSignIn.signIn();
      if (user == null) {
        print('user is null');
        // Navigator.pushNamedAndRemoveUntil(context, "/Base", (route) => false);
        return;
      } else {
        // _setloginstatus();
        // setloggingstatefalse();
        print('user is not null');
        final googleAuth = await user.authentication;
        print(googleAuth.accessToken.toString());
        //send this accessToken to the server
        LoginService()
            .socialLogin(
                accessToken: googleAuth.accessToken.toString(),
                provider: 'google')
            .then((response) {
          print("Response from Google Login: $response['message']");
        });
        // Navigator.pushNamedAndRemoveUntil(context, "/Base", (route) => false);
      }
    } catch (e) {
      print("Google Signing Error: $e");
    }
  }
}
