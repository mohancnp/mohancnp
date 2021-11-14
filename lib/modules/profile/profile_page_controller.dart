import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/user_model.dart';
import 'package:metrocoffee/core/services/profile_service/profile_service.dart';

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

  Future logout() async {}
}
