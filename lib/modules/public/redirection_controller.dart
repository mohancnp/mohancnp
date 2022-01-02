import 'package:get/get.dart';

class UserExistence {
  bool exits;
  bool fromCheckoutPage;
  bool editFromProfile;
  UserExistence(
      {required this.exits,
      required this.fromCheckoutPage,
      required this.editFromProfile});
}

class RedirectionController extends GetxController {
  static RedirectionController get to => Get.find();

  final Rx<UserExistence> _userExists = UserExistence(
          exits: false, fromCheckoutPage: false, editFromProfile: false)
      .obs;

  set userExists(bool status) {
    _userExists.value.exits = status;
  }

  bool get userExists {
    return _userExists.value.exits;
  }

  set fromCheckoutPage(bool from) {
    _userExists.value.fromCheckoutPage = from;
  }

  bool get fromCheckoutPage {
    return _userExists.value.fromCheckoutPage;
  }

  set editFromProfile(bool from) {
    _userExists.value.fromCheckoutPage = from;
  }

  bool get editFromProfile {
    return _userExists.value.fromCheckoutPage;
  }
}
