import 'package:get/get.dart';

class UserExistence {
  bool exits;
  bool fromPaymentPage;
  bool editFromProfile;
  UserExistence(
      {required this.exits,
      required this.fromPaymentPage,
      required this.editFromProfile});
}

class RedirectionController extends GetxController {
  static RedirectionController get to => Get.find();

  final Rx<UserExistence> _userExists = UserExistence(
          exits: false, fromPaymentPage: false, editFromProfile: false)
      .obs;

  set userExists(bool status) {
    _userExists.value.exits = status;
  }

  bool get userExists {
    return _userExists.value.exits;
  }

  set fromPaymentPage(bool from) {
    _userExists.value.fromPaymentPage = from;
  }

  bool get fromPaymentPage {
    return _userExists.value.fromPaymentPage;
  }

  set editFromProfile(bool from) {
    _userExists.value.fromPaymentPage = from;
  }

  bool get editFromProfile {
    return _userExists.value.fromPaymentPage;
  }
}
