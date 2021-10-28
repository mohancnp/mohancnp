import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:metrocoffee/enums/uistate.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/user_detail.dart';
import 'package:metrocoffee/services/rest/login.dart';

class SocialLoginController extends GetxController {
  // BaseController? baseController;
  // HomeTabController? homeTabController;
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
          print("Server Response Facebook Login: $response");

          if (response['success'] == true) {
            var data = response['data'];
            var token = data['token'];
            var user = data['user'];
            // bool userVerified = data['user_registered'];

            if (token != null && user != null) {
              // var newClient = Client.fromJson(user);

              addToken(provider: 'facebook', token: token.toString());
              setActivity(UIState.completed);
              Get.offNamedUntil('/Base', (route) => false);
            } else {
              print("Error logging into facebook");
              // setActivity(UIState.error);
              // Get.offNamedUntil('/SocialRegister', (route) => false,
              //     arguments: {
              //       "token": token,
              //       "provider": "facebook",
              //       "name": response['data']['name'],
              //       "email": response['data']['email'],
              //       "provider_id": response['data']['id'],
              //     });
            }
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
      GoogleSignIn _googleSignIn = GoogleSignIn(scopes: ["email"]);
      GoogleSignInAccount? user = await _googleSignIn.signIn();
      // _setloginstatus();
      // setloggingstatefalse();
      // print('user is not null');
      final googleAuth = await user?.authentication;
      print(" google access token: ${googleAuth?.accessToken.toString()}");
      //send this accessToken to the server
      if (googleAuth != null) {
        LoginService()
            .socialLogin(
                accessToken: googleAuth.accessToken.toString(),
                provider: 'google')
            .then((response) {
          print("Response from Google Sign in : $response['message']");
          Get.offAllNamed("/Base");
        });
      }
      // Navigator.pushNamedAndRemoveUntil(context, "/Base", (route) => false);

    } catch (e) {
      print("Google Signing Error: $e");
    }
  }
}
