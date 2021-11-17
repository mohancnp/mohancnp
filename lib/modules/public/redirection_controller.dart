import 'package:get/get.dart';

class UserExistence {
  bool exits;
  UserExistence(this.exits);
}

class RedirectionController extends GetxController {
  Rx<UserExistence> _userExists = UserExistence(false).obs;
  set userExists(bool status) {
    _userExists.value.exits = status;
  }

  bool get userExists {
    return _userExists.value.exits;
  }
}
