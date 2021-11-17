import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/user_model.dart';
import 'package:metrocoffee/core/services/profile_service/profile_service.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';

import 'profile_page_controller.dart';

class PersonalDataPageController extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController currentpasswordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  TextEditingController membershipcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  var _profileService = locator.get<ProfileService>();

  bool obscurecurrentpassword = true;
  String? gender;
  bool changesmade = false;
  bool passwordchangedsuccesfully = false;
  String? imageUri;
  String? errorMessage;
  final profileController = Get.find<ProfilePageController>();

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

  setgender(String g) {
    gender = g;
    update();
  }

  emptychangepasswordtextfields() {
    currentpasswordcontroller.text = "";
    confirmpasswordcontroller.text = "";
    newpasswordcontroller.text = "";
    update();
  }

  initializeFeilds() {
    namecontroller.text = profileController.newUser.name ?? " ";
    emailcontroller.text = profileController.newUser.email ?? " ";
    jobcontroller.text = profileController.newUser.job ?? "Add Your Job";
    imageUri = profileController.newUser.imageUri;
  }

  updateUserInfoInDbAndServer() async {
    //todo: add code to implement server user update

    Get.defaultDialog(
        content: SizedBox(
      height: 50,
      width: 50,
      child: Center(child: CircularProgressIndicator()),
    ));

    User user = User();
    user.name = namecontroller.text;
    user.email = emailcontroller.text;
    user.job = jobcontroller.text;
    user.gender = gender;

    // print(user.toJson());

    try {
      var result =
          await _profileService.updateProfile(profileData: user.toJson());
      User updatedUser = User.fromJson(result["data"]);
      namecontroller.text = updatedUser.name ?? " ";
      emailcontroller.text = updatedUser.email ?? " ";
      gender = updatedUser.gender;
      jobcontroller.text = updatedUser.job ?? " ";
      profileController.newUser = updatedUser;
      Get.find<HomeTabController>().user = updatedUser;
      // print(result);
      if (result != null) {
        Get.back();
        showSnackBarWithMsg("Profile", "update sucessfull!");
      }
    } on AppException catch (e) {
      Get.back();
      showSnackBarWithMsg("profile", "update failed");
      print(e);
    } on Exception catch (e) {
      Get.back();
      showSnackBarWithMsg("profile", "update failed");
      print("generic error: $e");
    }

    //todo: add code to implement db update for user
  }

  showSnackBarWithMsg(String title, String message) {
    Get.snackbar("$title", "$message",
        snackPosition: SnackPosition.BOTTOM,
        duration: Duration(milliseconds: 1500));
  }

  changePassword() async {
    if (changesmade) {
      Get.defaultDialog(
          content: SizedBox(
        height: 50,
        width: 50,
        child: Center(child: CircularProgressIndicator()),
      ));
      try {
        var result = await _profileService.changeUserPassword(
          currentPassword: currentpasswordcontroller.text,
          newPassword: newpasswordcontroller.text,
          passwordConfirmation: confirmpasswordcontroller.text,
        );
        if (result != null) {
          Get.back();
          showSnackBarWithMsg("password", "update sucessfull!!");
          emptychangepasswordtextfields();
        }
      } on AppException catch (e) {
        Get.back();
        showSnackBarWithMsg("password", "update failed");
        emptychangepasswordtextfields();
        print(e.message);
      } on Exception catch (e) {
        print("generic error: $e");
      }
    }
  }
}