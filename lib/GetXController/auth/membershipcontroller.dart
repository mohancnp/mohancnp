import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/instances.dart';
import 'package:metrocoffee/core/enums/uistate.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/services/rest/login.dart';

class MemberShipController extends GetxController {
  TextEditingController membershipnumbercontroller = TextEditingController();
  TextEditingController passwordcontroller = TextEditingController();
  bool showpassword = false;
  bool eye = false;
  String? memberShipLoginErrorMsg;

  @override
  void onInit() {
    super.onInit();
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

//v-2 perform login with membershipnumber and password

  Future memberShipLogin() async {
    // print("MemberShip ID: $memberShipNumber and Passowrd: $password");
    setUiState(UIState.processing);

    LoginService()
        .memberShipLogin(
            memberNo: membershipnumbercontroller.text,
            password: passwordcontroller.text)
        .then((response) {
      if (response != null) {
        if (response['success'] == true) {
          // print("Response data: ${response['data']}");
          var data = response['data'];
          var token = data['token'];
          var tempStorage = TempStorage();
          tempStorage.initialise().then((value) {
            tempStorage.writeString(
                TempStorageKeys.authToken, token.toString());
          });
          // addToken(provider: 'membership', token: token.toString());
          Client newUser = Client.fromJson(response['data']['user']);
          setUiState(UIState.completed);

          // userTableHandler.addUser(newUser).then((value) {
          //   setUiState(UIState.completed);
          // }).onError((error, stackTrace) {
          //   print(error);
          // });
          membershipnumbercontroller.text = "";
          memberShipLoginErrorMsg = "";
          passwordcontroller.text = "";
          Get.toNamed(PageName.homepage);
        }
      } else {
        setMemberShipLoginError("Error occured, try again!!!");
        setUiState(UIState.completed);
        print("Catched error message in membership login]");
      }
    });
    return false;
  }

  Widget loginfields(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            margin: EdgeInsets.only(
                //        top: 37
                top: screenwidth * 0.0900),
            padding: EdgeInsets.only(
                //         horizontal: 24
                left: screenwidth * 0.0583,
                right: 3),
            //      height: 46,
            height: screenwidth * 0.1119,
            width: screenwidth,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.all(Radius.circular(26)),
            ),
            child: TextFormField(
              controller: membershipnumbercontroller,
              cursorColor: Colors.black87,
              style: TextStyle(
                  fontFamily: poppinsregular,
                  color: Colors.black87,
                  //       fontSize: 13.5
                  fontSize: screenwidth * 0.0328),
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                suffixIcon: Icon(
                  FeatherIcons.user,
                  color: Color(0xff404d4d),
                  //                 size: 18,
                  size: screenwidth * 0.0437,
                ),
                border: InputBorder.none,
                hintText: 'Membership No.',
                hintStyle: TextStyle(
                    fontFamily: poppinsregular, color: Color(0xff404d4d)),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(
                //        top: 37
                top: screenwidth * 0.0800),
            padding: EdgeInsets.only(
                //         horizontal: 24
                left: screenwidth * 0.0583,
                right: 3),
            //      height: 46,
            height: screenwidth * 0.1119,
            width: screenwidth,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.85),
              borderRadius: BorderRadius.all(Radius.circular(26)),
            ),
            child: TextFormField(
              onChanged: (v) {
                if (passwordcontroller.text != "") {
                  eye = true;
                  update();
                }
                if (passwordcontroller.text == "") {
                  eye = false;
                  update();
                }
              },
              obscureText: !showpassword,
              controller: passwordcontroller,
              cursorColor: Colors.black87,
              style: TextStyle(
                  fontFamily: poppinsregular,
                  color: Colors.black87,
                  //       fontSize: 13.5
                  fontSize: screenwidth * 0.0328),
              keyboardType: TextInputType.visiblePassword,
              textInputAction: TextInputAction.done,
              decoration: InputDecoration(
                suffixIcon: GestureDetector(
                    onTap: () {
                      showpassword = !showpassword;
                      update();
                    },
                    child: Icon(
                      passwordcontroller.text == ""
                          ? FeatherIcons.lock
                          : showpassword
                              ? FeatherIcons.eyeOff
                              : FeatherIcons.eye,
                      color: Color(0xff404d4d),
                      //             size: 18,
                      size: screenwidth * 0.0437,
                    )),
                border: InputBorder.none,
                hintText: 'Password',
                hintStyle: TextStyle(
                    fontFamily: poppinsregular, color: Color(0xff404d4d)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
