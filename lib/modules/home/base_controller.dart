import 'package:get/get.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';

enum UserVerficationStatus { verified, unverified, unknown }

class BaseController extends GetxController {
  static BaseController get to => Get.find();

  int _currentindex = 0;
  UserVerficationStatus _userVerficationStatus =
      UserVerficationStatus.unverified;
    final _redirectionController = Get.find<RedirectionController>();

  UserVerficationStatus get userVerificationStatus => _userVerficationStatus;

  void updateUserVerificationStatus(
      UserVerficationStatus userVerficationStatus) {
    _userVerficationStatus = userVerficationStatus;
    update();
  }

  set currentIndex(ci) {
    _currentindex = ci;
  }

  get currentIndex {
    return _currentindex;
  }

  setindex(int index) {
    currentIndex = index;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    determineUserType();
  }

  Future determineUserType() async {
    if (_redirectionController.userExists) {
      updateUserVerificationStatus(UserVerficationStatus.verified);
    } else {
      updateUserVerificationStatus(UserVerficationStatus.unknown);
    }
  }

  Future<void> initializeData() async {
    if (_redirectionController.userExists) {
      updateUserVerificationStatus(UserVerficationStatus.verified);
    } else {
      updateUserVerificationStatus(UserVerficationStatus.unknown);
    }
  }
}
