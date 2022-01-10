import 'dart:io';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/profile.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/core/services/inter_module_service/communication.dart';
import 'package:metrocoffee/ui/widgets/custom_snackbar_widget.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/validator.dart';

class PersonalDataPageController extends GetxController {
  TextEditingController firstNamecontroller = TextEditingController();
  TextEditingController lastNamecontroller = TextEditingController();
  TextEditingController currentpasswordcontroller = TextEditingController();
  TextEditingController emailcontroller = TextEditingController();
  TextEditingController jobcontroller = TextEditingController();
  TextEditingController membershipcontroller = TextEditingController();
  TextEditingController newpasswordcontroller = TextEditingController();
  TextEditingController confirmpasswordcontroller = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  final _authService = locator<AuthService>();
  final key = GlobalKey<FormState>();
  bool obscurecurrentpassword = true;
  String? gender;
  bool changesmade = false;
  bool passwordchangedsuccesfully = false;
  String? imageUri;
  String? errorMessage;
  File? _imageData;

  final profile = InterModuleService().profile;

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

  void setchangesmadetrue() {
    changesmade = true;
    update();
  }

  void setcurrentpasswordview() {
    obscurecurrentpassword = !obscurecurrentpassword;
    update();
  }

  void setgender(String g) {
    gender = g;
    update();
  }

  void emptychangepasswordtextfields() {
    currentpasswordcontroller.text = "";
    confirmpasswordcontroller.text = "";
    newpasswordcontroller.text = "";
    update();
  }

  void initializeFeilds() {
    firstNamecontroller.text = profile.newUser.firstName;
    lastNamecontroller.text = profile.newUser.lastName;
    emailcontroller.text = profile.newUser.email;
    jobcontroller.text = "Graphic Designer";
    imageUri = profile.newUser.image;
    phoneController.text = profile.newUser.mobile;
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

  Future<void> updateUserInfo() async {
    if (key.currentState!.validate()) {
      showCustomDialog();
      final data = ProfileUpdate(
        firstName: firstNamecontroller.text,
        lastName: lastNamecontroller.text,
        email: emailcontroller.text,
        mobile: phoneController.text,
      ).toJson();
      final response = await _authService.updateProfile(data);
      if (response.isLeft()) {
        profile.newUser.firstName = firstNamecontroller.text;
        profile.newUser.lastName = lastNamecontroller.text;
        profile.newUser.email = emailcontroller.text;
        profile.newUser.mobile = phoneController.text;
        InterModuleService.updateProfileController();
        removeDialog();

        showCustomSnackBarMessage(
          title: "Sucess",
          message: "Profile updated",
          snackPosition: SnackPosition.BOTTOM,
        );
        return;
      }
      removeDialog();
      showCustomSnackBarMessage(
        title: "Error!!",
        message: "Couldn't update your profile try,again later",
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  void removeDialog() {
    Get.back();
  }

  Future<void> changePassword() async {
    if (changesmade) {
      if (currentpasswordcontroller.text != newpasswordcontroller.text) {
        if (newpasswordcontroller.text == confirmpasswordcontroller.text) {
          showCustomDialog();
          await Future.delayed(const Duration(seconds: 2));
          removeDialog();
          emptyFeilds();
          errorMessage = "Feature not yet implemented";
          update();
        } else {
          errorMessage = "Password pair doesn't match";
          update();
        }
      } else {
        errorMessage = "New password must be different from the previous";
        update();
      }
    } else {
      errorMessage = "feilds can't be empty";
      update();
    }
    changesmade = false;
  }

  void emptyFeilds() {
    currentpasswordcontroller.text = "";
    newpasswordcontroller.text = "";
    confirmpasswordcontroller.text = "";
  }

  String? validateEmail(String? value) {
    return emailValidtor(value: value);
  }

  String? validateName(String? value) {
    if (value != null && value.isNotEmpty) {
      return null;
    }
    return "Name Feild can't be empty";
  }

  String? phoneValidator(String? value) {
    if (value != null && value.isNotEmpty) {
      if (phoneNumberValidator(value)) {
        return null;
      }
      return "Please Enter the Valid Phone Number";
    } else {
      return "Name Feild can't be empty";
    }
  }
}
