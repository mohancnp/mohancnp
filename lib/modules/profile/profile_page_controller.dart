import 'package:get/get.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/user_profile.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/core/services/storage/sharedpref/temp_storage.dart';

class ProfilePageController extends GetxController {
  var authService = locator<AuthService>();
  final Rx<UserProfile> _newUser = UserProfile(
          id: 0,
          securityKey: "",
          firstName: "Caffeinator",
          lastName: "",
          email: "email not available",
          mobile: "mobile",
          image: "image")
      .obs;

  Future<void> getProfile() async {
    final response = await authService.getProfile();
    response.fold((userProfile) {
      newUser = userProfile;
    }, (failure) {
      print("${failure.tag}: ${failure.message}");
    });
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
    if (user.image.isEmpty && user.firstName.isNotEmpty) {
      imagePlaceHolder = "";
      imagePlaceHolder = user.firstName[0].toUpperCase();
      var surname = user.lastName.isEmpty ? "A" : user.lastName[0];
      imagePlaceHolder = imagePlaceHolder + surname.toUpperCase();
    }
    return imagePlaceHolder;
  }

  Future logout() async {
    locator<TempStorage>().delete(TempStorageKeys.authToken);
    Get.offAllNamed(PageName.loginpage);
  }

  @override
  void onInit() {
    getProfile();
    super.onInit();
  }
}
