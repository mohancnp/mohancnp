import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/profile/profile_controller.dart';
import 'package:metrocoffee/core/constants/fontconstants.dart';
import 'package:metrocoffee/core/constants/instances.dart';
import 'package:metrocoffee/core/enums/uistate.dart';
import 'package:metrocoffee/models/UserprofileModel.dart';
import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/services/api_service.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/core/theme.dart';

class PersonalDataPageController extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController currentpasswordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  TextEditingController membershipcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  bool obscurecurrentpassword = true;
  String? gender;
  bool changesmade = false;
  bool passwordchangedsuccesfully = false;
  String? imageUri;
  String? errorMessage;

  @override
  void onInit() {
    super.onInit();
  }

  Future updateUserInfo(context) async {
    Client client =
        new Client.update(namecontroller.text, emailcontroller.text);

    if (gender != null) {
      client.gender = gender;
    }

    var dialog = showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) {
          return Center(
            child: CircularProgressIndicator(
              color: coffeecolor,
            ),
          );
        });
    UIState uiState = await updateUserInfoInServer(client.jsonToUpdate());
    if (uiState == UIState.completed) {
      Get.find<ProfileController>().getUserData();
      Navigator.pop(context);
      final snackBar = SnackBar(content: Text('Profile Updated'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    } else if (uiState == UIState.error) {
      Navigator.pop(context);
      final snackBar = SnackBar(content: Text('Profile update failed'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
  }

  getUserDataFromServer() async {
    var token = await getToken();
    var user = await profileService.getUserProfileDataWithToken(token);
    Client existingUser = Client.fromJson(user['data']);
    namecontroller.text = existingUser.name!;
    emailcontroller.text = existingUser.email!;
    jobcontroller.text = existingUser.job ?? "Add Your Job";
    imageUri = existingUser.imageUri;
    update();
  }

  Future<UIState> updateUserInfoInServer(
      Map<String, dynamic> dataToUpdate) async {
    //todo: also update the user detail in the local database on update.

    var response = await profileService.updateUserProfile(dataToUpdate);
    if (response == null) {
      print("Update Failed");
      return UIState.error;
    } else {
      print("profile update sucessfull");
      return UIState.completed;
    }
  }

  setpasswordchangestate() {
    passwordchangedsuccesfully = !passwordchangedsuccesfully;
    update();
  }

  setchangesmadetrue() {
    changesmade = true;
    update();
  }

  setcurrentpasswordview() {
    obscurecurrentpassword = !obscurecurrentpassword;
    update();
  }

  setgender(String Gender) {
    gender = Gender;
    update();
  }

  Widget getuserdatatextfields(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      padding: EdgeInsets.only(
        left: screenwidth * 0.0535,
        right: screenwidth * 0.0535,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    //         left: 4
                    left: screenwidth * 0.0097),
                child: Text(
                  "Your Name",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                    fontSize: screenwidth * 0.0304,
                    color: darkgrey.withOpacity(0.95),
                  )),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                top: screenwidth * 0.0182,
                bottom: screenwidth * 0.0486),
            padding: EdgeInsets.symmetric(
//                horizontal: 14
                horizontal: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: TextField(
              keyboardType: TextInputType.name,
              style: getpoppins(
                TextStyle(
                    fontWeight: FontWeight.w400,
                    //    fontSize: 13.5,
                    fontSize: screenwidth * 0.0328,
                    color: Color(0xff1A1C1C)),
              ),
              cursorColor: Color(0xff1A1C1C),
              controller: namecontroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        //      fontSize: 13.5,
                        fontSize: screenwidth * 0.0328,
                        color: Color(0xff1A1C1C).withOpacity(0.78)),
                  ),
                  hintText: "Robert Fox"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                margin: EdgeInsets.only(
                    //         left: 4
                    left: screenwidth * 0.0097),
                child: Text(
                  "Current password",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                    fontSize: screenwidth * 0.0304,
                    color: darkgrey.withOpacity(0.95),
                  )),
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.pushNamedAndRemoveUntil(
                      context, "/ChangePassword", (route) => true);
                },
                child: Container(
                  margin: EdgeInsets.only(
                      //         left: 4
                      left: screenwidth * 0.0097),
                  child: Text(
                    "Change Password",
                    style: getpoppins(TextStyle(
                      fontWeight: FontWeight.w500,
//                  fontSize: 12.5,
                      decoration: TextDecoration.underline,
                      fontSize: screenwidth * 0.0304,
                      color: coffeecolor,
                    )),
                  ),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                top: screenwidth * 0.0182,
                bottom: screenwidth * 0.0486),
            padding: EdgeInsets.only(
//                horizontal: 14
                left: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: TextField(
              style: getpoppins(
                TextStyle(
                    fontWeight: FontWeight.w400,
                    //    fontSize: 13.5,
                    fontSize: screenwidth * 0.0328,
                    color: Color(0xff1A1C1C)),
              ),
              cursorColor: Color(0xff1A1C1C),
              obscureText: obscurecurrentpassword,
              controller: currentpasswordcontroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setcurrentpasswordview();
                    },
                    child: Icon(
                      obscurecurrentpassword
                          ? FeatherIcons.eye
                          : FeatherIcons.eyeOff,
                      color: Color(0xff1A1C1C).withOpacity(0.85),
                      //     size: 18.5,
                      size: screenwidth * 0.0450,
                    ),
                  ),
                  hintStyle: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        //      fontSize: 13.5,
                        fontSize: screenwidth * 0.0328,
                        color: Color(0xff1A1C1C).withOpacity(0.78)),
                  ),
                  hintText: "Type a strong password"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    //         left: 4
                    left: screenwidth * 0.0097),
                child: Text(
                  "Email",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                    fontSize: screenwidth * 0.0304,
                    color: darkgrey.withOpacity(0.95),
                  )),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                top: screenwidth * 0.0182,
                bottom: screenwidth * 0.0486),
            padding: EdgeInsets.symmetric(
//                horizontal: 14
                horizontal: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: TextField(
              style: getpoppins(
                TextStyle(
                    fontWeight: FontWeight.w400,
                    //    fontSize: 13.5,
                    fontSize: screenwidth * 0.0328,
                    color: Color(0xff1A1C1C)),
              ),
              cursorColor: Color(0xff1A1C1C),
              controller: emailcontroller,
              keyboardType: TextInputType.emailAddress,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        //      fontSize: 13.5,
                        fontSize: screenwidth * 0.0328,
                        color: Color(0xff1A1C1C).withOpacity(0.78)),
                  ),
                  hintText: "robertfox@gmail.com"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    //         left: 4
                    left: screenwidth * 0.0097),
                child: Text(
                  "Your Job",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                    fontSize: screenwidth * 0.0304,
                    color: darkgrey.withOpacity(0.95),
                  )),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                top: screenwidth * 0.0182,
                bottom: screenwidth * 0.0486),
            padding: EdgeInsets.symmetric(
//                horizontal: 14
                horizontal: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: TextField(
              style: getpoppins(
                TextStyle(
                    fontWeight: FontWeight.w400,
                    //    fontSize: 13.5,
                    fontSize: screenwidth * 0.0328,
                    color: Color(0xff1A1C1C)),
              ),
              cursorColor: Color(0xff1A1C1C),
              controller: jobcontroller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        //      fontSize: 13.5,
                        fontSize: screenwidth * 0.0328,
                        color: Color(0xff1A1C1C).withOpacity(0.78)),
                  ),
                  hintText: "Graphic Designer"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    //         left: 4
                    left: screenwidth * 0.0097),
                child: Text(
                  "Membership",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                    fontSize: screenwidth * 0.0304,
                    color: darkgrey.withOpacity(0.95),
                  )),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                top: screenwidth * 0.0182,
                bottom: screenwidth * 0.0486),
            padding: EdgeInsets.symmetric(
//                horizontal: 14
                horizontal: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: TextField(
              enabled: false,
              style: getpoppins(
                TextStyle(
                    fontWeight: FontWeight.w400,
                    //    fontSize: 13.5,
                    fontSize: screenwidth * 0.0328,
                    color: Color(0xff1A1C1C)),
              ),
              cursorColor: Color(0xff1A1C1C),
              controller: membershipcontroller,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  hintStyle: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        //      fontSize: 13.5,
                        fontSize: screenwidth * 0.0328,
                        color: Color(0xff1A1C1C).withOpacity(0.78)),
                  ),
                  hintText: "Gold Member"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    //         left: 4
                    left: screenwidth * 0.0097),
                child: Text(
                  "Gender",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                    fontSize: screenwidth * 0.0304,
                    color: darkgrey.withOpacity(0.95),
                  )),
                ),
              )
            ],
          ),
          Container(
            width: screenwidth,
            margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                top: screenwidth * 0.0182,
                bottom: screenwidth * 0.0486),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setgender('male');
                  },
                  child: Container(
                    padding: EdgeInsets.symmetric(
//                      horizontal: 12.5
                        horizontal: screenwidth * 0.0304),
//                  width: 151, height: 38,
                    width: screenwidth * 0.367,
                    height: screenwidth * 0.0924,
                    decoration: BoxDecoration(
                        color: Color(0xffF9F9F9),
                        borderRadius: BorderRadius.all(Radius.circular(9)),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.03),
                              blurRadius: 10,
                              offset: Offset(0, 3))
                        ]),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          gender == 'male'
                              ? CupertinoIcons.largecircle_fill_circle
                              : CupertinoIcons.circle,
                          color: gender == 'male'
                              ? Color(0xff1A1C1C)
                              : Colors.grey[600],
                          //   size: 20,
                          size: screenwidth * 0.04866,
                        ),
                        Container(
                          margin: EdgeInsets.only(
                              //         left: 9
                              left: screenwidth * 0.0218),
                          child: Text(
                            "Male",
                            style: getpoppins(TextStyle(
                              fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                              fontSize: screenwidth * 0.0304,
                              color: Color(0xff1A1C1C),
                            )),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      setgender('female');
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
//                      horizontal: 12.5
                          horizontal: screenwidth * 0.0304),
//                  width: 151, height: 38,
                      width: screenwidth * 0.367,
                      height: screenwidth * 0.0924,
                      decoration: BoxDecoration(
                          color: Color(0xffF9F9F9),
                          borderRadius: BorderRadius.all(Radius.circular(9)),
                          boxShadow: [
                            BoxShadow(
                                color: Colors.black.withOpacity(0.03),
                                blurRadius: 10,
                                offset: Offset(0, 3))
                          ]),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            gender == 'female'
                                ? CupertinoIcons.largecircle_fill_circle
                                : CupertinoIcons.circle,
                            color: gender == 'female'
                                ? Color(0xff1A1C1C)
                                : Colors.grey[600],
                            //   size: 20,
                            size: screenwidth * 0.04866,
                          ),
                          Container(
                            margin: EdgeInsets.only(
                                //         left: 9
                                left: screenwidth * 0.0218),
                            child: Text(
                              "Female",
                              style: getpoppins(TextStyle(
                                fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                                fontSize: screenwidth * 0.0304,
                                color: Color(0xff1A1C1C),
                              )),
                            ),
                          )
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget changepasswordtextfields(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      width: screenwidth,
      padding: EdgeInsets.only(
        //          horizontal: 22
        left: screenwidth * 0.0535,
        right: screenwidth * 0.0535,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    //         left: 4
                    left: screenwidth * 0.0097),
                child: Text(
                  "Current Password",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                    fontSize: screenwidth * 0.0304,
                    color: darkgrey.withOpacity(0.65),
                  )),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                top: screenwidth * 0.0182,
                bottom: screenwidth * 0.0486),
            padding: EdgeInsets.only(
//                horizontal: 14
                left: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: TextField(
              onChanged: (v) {
                setchangesmadetrue();
              },
              style: getpoppins(
                TextStyle(
                    fontWeight: FontWeight.w400,
                    //    fontSize: 13.5,
                    fontSize: screenwidth * 0.0328,
                    color: Color(0xff1A1C1C)),
              ),
              cursorColor: Color(0xff1A1C1C),
              obscureText: obscurecurrentpassword,
              controller: currentpasswordcontroller,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setcurrentpasswordview();
                    },
                    child: Icon(
                      obscurecurrentpassword
                          ? FeatherIcons.eye
                          : FeatherIcons.eyeOff,
                      color: Color(0xff1A1C1C).withOpacity(0.85),
                      //     size: 18.5,
                      size: screenwidth * 0.0450,
                    ),
                  ),
                  hintStyle: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        //      fontSize: 13.5,
                        fontSize: screenwidth * 0.0328,
                        color: Color(0xff1A1C1C).withOpacity(0.65)),
                  ),
                  hintText: "Type a strong password"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    //         left: 4
                    left: screenwidth * 0.0097),
                child: Text(
                  "New Password",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                    fontSize: screenwidth * 0.0304,
                    color: darkgrey.withOpacity(0.65),
                  )),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                top: screenwidth * 0.0182,
                bottom: screenwidth * 0.0486),
            padding: EdgeInsets.only(
//                horizontal: 14
                left: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: TextField(
              textInputAction: TextInputAction.next,
              onChanged: (v) {
                setchangesmadetrue();
              },
              style: getpoppins(
                TextStyle(
                    fontWeight: FontWeight.w400,
                    //    fontSize: 13.5,
                    fontSize: screenwidth * 0.0328,
                    color: Color(0xff1A1C1C)),
              ),
              cursorColor: Color(0xff1A1C1C),
              obscureText: obscurecurrentpassword,
              controller: newpasswordcontroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setcurrentpasswordview();
                    },
                    child: Icon(
                      obscurecurrentpassword
                          ? FeatherIcons.eye
                          : FeatherIcons.eyeOff,
                      color: Color(0xff1A1C1C).withOpacity(0.85),
                      //     size: 18.5,
                      size: screenwidth * 0.0450,
                    ),
                  ),
                  hintStyle: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        //      fontSize: 13.5,
                        fontSize: screenwidth * 0.0328,
                        color: Color(0xff1A1C1C).withOpacity(0.65)),
                  ),
                  hintText: "Type a new strong password"),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(
                    //         left: 4
                    left: screenwidth * 0.0097),
                child: Text(
                  "Confirm Password",
                  style: getpoppins(TextStyle(
                    fontWeight: FontWeight.w400,
//                  fontSize: 12.5,
                    fontSize: screenwidth * 0.0304,
                    color: darkgrey.withOpacity(0.65),
                  )),
                ),
              )
            ],
          ),
          Container(
            margin: EdgeInsets.only(
//                top: 7.5,bottom: 20
                top: screenwidth * 0.0182,
                bottom: screenwidth * 0.0486),
            padding: EdgeInsets.only(
//                horizontal: 14
                left: screenwidth * 0.03406),
            width: screenwidth,
            decoration: BoxDecoration(
                color: Color(0xffF9F9F9),
                borderRadius: BorderRadius.all(Radius.circular(9)),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.03),
                      blurRadius: 10,
                      offset: Offset(0, 3))
                ]),
            child: TextField(
              textInputAction: TextInputAction.done,
              onChanged: (v) {
                setchangesmadetrue();
              },
              style: getpoppins(
                TextStyle(
                    fontWeight: FontWeight.w400,
                    //    fontSize: 13.5,
                    fontSize: screenwidth * 0.0328,
                    color: Color(0xff1A1C1C)),
              ),
              cursorColor: Color(0xff1A1C1C),
              obscureText: obscurecurrentpassword,
              controller: confirmpasswordcontroller,
              decoration: InputDecoration(
                  border: InputBorder.none,
                  suffixIcon: GestureDetector(
                    onTap: () {
                      setcurrentpasswordview();
                    },
                    child: Icon(
                      obscurecurrentpassword
                          ? FeatherIcons.eye
                          : FeatherIcons.eyeOff,
                      color: Color(0xff1A1C1C).withOpacity(0.85),
                      //     size: 18.5,
                      size: screenwidth * 0.0450,
                    ),
                  ),
                  hintStyle: getpoppins(
                    TextStyle(
                        fontWeight: FontWeight.w400,
                        //      fontSize: 13.5,
                        fontSize: screenwidth * 0.0328,
                        color: Color(0xff1A1C1C).withOpacity(0.65)),
                  ),
                  hintText: "Re-Type your new password"),
            ),
          ),
        ],
      ),
    );
  }

  changepassword(
    String currentpass,
    String newpass,
    String confirmnewpass,
  ) async {
    print(
        "current: $currentpass , newpass : $newpass, confirmpass: $confirmnewpass");
    var response = await profileService.changePassword(
        oldPassword: currentpass,
        newPassword: newpass,
        confirmPassword: confirmnewpass);

    if (response != null && response['success'] == true) {
      errorMessage = "";
      setpasswordchangestate();
      // print(response);
    } else {
      errorMessage = "Error Occured Try again";

      update();
    }
  }

  emptychangepasswordtextfields() {
    currentpasswordcontroller.text = "";
    confirmpasswordcontroller.text = "";
    update();
  }

  Widget changepasswordbutton(BuildContext context) {
    double screenwidth = MediaQuery.of(context).size.width;
    return GestureDetector(
        onTap: () {
          if (changesmade) {
            changepassword(currentpasswordcontroller.text,
                newpasswordcontroller.text, confirmpasswordcontroller.text);
          }
        },
        child: Container(
          margin: EdgeInsets.only(
              //          horizontal: 22
              left: screenwidth * 0.0535,
              right: screenwidth * 0.0535,
//          top: 26
              top: screenwidth * 0.0632),
//      width: 267,height: 46,
          width: screenwidth * 0.6496,
          height: screenwidth * 0.1119,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: coffeecolor,
              boxShadow: [
                BoxShadow(
                    color: Color(0xffC3916A4D).withOpacity(0.38),
                    blurRadius: 30,
                    offset: Offset(0, 9))
              ]),
          child: Center(
            child: Text(
              "Change Password",
              style: getpoppins(TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                  //    fontSize: 14.5
                  fontSize: screenwidth * 0.0352)),
            ),
          ),
        ));
  }
}
