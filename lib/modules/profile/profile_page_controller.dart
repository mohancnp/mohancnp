import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/controllerbinding.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/user_model.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/core/services/profile_service/profile_service.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/modules/home/widgets/categories_controller.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

class ProfilePageController extends GetxController {
  var _profileService = locator.get<ProfileService>();
  Rx<User> _newUser = User().obs;

  Future getProfile() async {
    try {
      var data = await _profileService.getUserDetail();
      var user = User.fromJson(data["data"]);
      newUser = user;
      return user;
    } on AppException catch (e) {
      print(e.message);
    }
  }

  set newUser(User user) {
    _newUser.value = user;
    _newUser.refresh();
  }

  User get newUser {
    return _newUser.value;
  }

  String getFirstLetterOfNameAndSurname() {
    var user = this.newUser;
    String imagePlaceHolder = "N/A";
    if (user.imageUri == null && user.name != null) {
      imagePlaceHolder = "";
      imagePlaceHolder = user.name?.substring(0, 1).toUpperCase() ?? "N";
      var surname = user.name?.split(" ")[1];
      var length = surname?.length ?? 0;
      if (length > 0) {
        imagePlaceHolder =
            imagePlaceHolder + surname!.substring(0, 1).toUpperCase();
      }
    }
    return imagePlaceHolder;
  }

  Future logout() async {
    // Future.delayed(Duration(milliseconds: 1500));
    await showCustomDialog(message: "Loggin out");
    var canLogout = await processLogout();
    if (canLogout) {
      Get.back();
      Get.offAllNamed(PageName.loginpage);
    }
  }

  Future processLogout() async {
    locator.get<TempStorage>().delete(TempStorageKeys.authToken);
    // var hc = Get.find<HomeTabController>();
    var bc = Get.find<BaseController>();
    // var categoriesController = Get.find<CategoriesController>();
    // categoriesController.setActiveCategory = 0;
    bc.setindex(0);
    // hc.allBakery.clear();
    // hc.allDrinks.clear();
    // hc.allSnacks.clear();

    return true;
  }
}
