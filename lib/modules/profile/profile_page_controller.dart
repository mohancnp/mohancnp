import 'package:get/get.dart';
import 'package:metrocoffee/core/models/older/user_model.dart';

class ProfilePageController extends GetxController {
  Rx<User> _newUser = User().obs;

  Future getProfile() async {
    //TODO: implement get user profile data
  }

  set newUser(User user) {
    _newUser.value = user;
    _newUser.refresh();
  }

  User get newUser {
    return _newUser.value;
  }

  String getImagePlacholder() {
    //code can be reused later
    var user = this.newUser;
    String imagePlaceHolder = "NA";
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
    //TODO: Implement logout
  }
}
