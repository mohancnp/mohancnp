import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:metrocoffee/core/constants/instances.dart';
import 'package:metrocoffee/core/enums/uistate.dart';
import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/services/api_service.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/user_detail.dart';
import 'package:metrocoffee/services/rest/login.dart';

class LoginController extends GetxController {
  bool isSigningIn = false;
  final googleSignIn = GoogleSignIn();
  final FacebookLogin facebookLogin = FacebookLogin();
  String? memberShipLoginErrorMsg;

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    // print('onclose being called');
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

  loginwithemail(
      {required String emailaddress, required String password}) async {
    setUiState(UIState.processing);

    var response = await LoginService()
        .emailLogin(email: emailaddress, password: password);
    if (response != null) {
      if (response.containsKey("success")) {
        if (response["success"]) {
          addToken(provider: 'email', token: response['data']['token']);
          Client client = Client.fromJson(response['data']['user']);
          userTableHandler.addUser(client);
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
}
