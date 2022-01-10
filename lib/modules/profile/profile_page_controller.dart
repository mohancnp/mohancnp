import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/user_profile.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/debug_printer.dart';

class ProfilePageController extends GetxController {
  var authService = locator<AuthService>();
  final Rx<UserProfile> _newUser = UserProfile(
    id: 0,
    securityKey: "",
    firstName: "User",
    lastName: "",
    email: "metro.admin@gmail.com",
    mobile: "+010000000",
    image: "image",
  ).obs;

  Future<void> getProfile() async {
    final response = await authService.getProfile();
    response.fold(
      (userProfile) {
        newUser = userProfile;
      },
      (failure) {
        final accessToken =
            locator<TempStorage>().readString(TempStorageKeys.authToken);
        if (accessToken != null) {
          if (failure.errorStatusCode != null) {
            if (failure.errorStatusCode == 401) {
              print("user session has expired");
              // locator<TempStorage>().delete(TempStorageKeys.authToken);
            }
          }
        }
        dPrint("${failure.errorStatusCode}: ${failure.message}");
      },
    );
  }

  set newUser(UserProfile user) {
    _newUser.value = user;
    _newUser.refresh();
  }

  UserProfile get newUser {
    return _newUser.value;
  }

  String getImagePlacholder() {
    var user = newUser;
    String imagePlaceHolder = "NA";
    if (user.image.isEmpty &&
        user.firstName.isNotEmpty &&
        user.lastName.isNotEmpty) {
      imagePlaceHolder = "";
      imagePlaceHolder = user.firstName[0].toUpperCase();
      var surname = user.lastName[0].toUpperCase();
      imagePlaceHolder = imagePlaceHolder + surname;
    }
    return imagePlaceHolder;
  }

  Future logout() async {
    locator<TempStorage>().delete(TempStorageKeys.authToken);
    showCustomDialog(message: "logging out...");
    await authService.logout();
    Get.offAllNamed(PageName.loginpage);
  }

  void removeDialog() => Get.back();

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
