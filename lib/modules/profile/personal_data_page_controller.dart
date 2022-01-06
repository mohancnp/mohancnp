import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/services/older/profile_service/profile_service.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

import 'profile_page_controller.dart';

class PersonalDataPageController extends GetxController {
  TextEditingController namecontroller = TextEditingController();
  TextEditingController currentpasswordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  TextEditingController membershipcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  final _profileService = locator<ProfileService>();
  bool obscurecurrentpassword = true;
  String? gender;
  bool changesmade = false;
  bool passwordchangedsuccesfully = false;
  String? imageUri;
  String? errorMessage;
  File? _imageData;

  final profileController = Get.find<ProfilePageController>();

  setpasswordchangestate() {
    passwordchangedsuccesfully = !passwordchangedsuccesfully;
    update();
  }

  set imageData(imd) {
    _imageData = imd;
  }

  get imageData {
    return _imageData;
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
    namecontroller.text = profileController.newUser.firstName +
        "  " +
        profileController.newUser.lastName;
    emailcontroller.text = profileController.newUser.email;
    jobcontroller.text = "Graphic Designer";
    imageUri = profileController.newUser.image;
  }

  Future<void> getUserImage() async {
    //TODO: uncomment on profile update

    // final ImagePicker _picker = ImagePicker();
    // final XFile? image = await _picker.pickImage(
    //   source: ImageSource.gallery,
    // );
    // if (image != null) {
    //   imageData = File(image.path);
    // }
  }

  updateUserInfoInDbAndServer() async {
    showCustomDialog();
    await Future.delayed(const Duration(milliseconds: 2000));
    profileController.newUser.email = emailcontroller.text;
    final splittedName = namecontroller.text.split(' ');
    profileController.newUser.firstName =
        splittedName.isNotEmpty ? splittedName[0] : " ";
    profileController.newUser.lastName =
        splittedName.length > 1 ? splittedName[1] : " ";
    Get.back();
  }

  showSnackBarWithMsg(String title, String message) {
    Get.snackbar(
      title,
      message,
      snackPosition: SnackPosition.BOTTOM,
      duration: const Duration(milliseconds: 1500),
    );
  }

  changePassword() async {
    if (changesmade) {
      Get.defaultDialog(
          content: const SizedBox(
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
      } on AppException {
        Get.back();
        showSnackBarWithMsg("password", "update failed");
        emptychangepasswordtextfields();
      } on Exception {
        // TODO: Handle Exception
      }
    }
  }
}
