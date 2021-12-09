import 'package:get/get.dart';
import 'package:metrocoffee/modules/home/home_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';

enum UserVerficationStatus { verified, unverified, unknown }

class BaseController extends GetxController {
  static BaseController get to => Get.find();

  int _currentindex = 0;
  UserVerficationStatus _userVerficationStatus =
      UserVerficationStatus.unverified;

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
    if (RedirectionController.to.userExists)
      updateUserVerificationStatus(UserVerficationStatus.verified);
    else
      updateUserVerificationStatus(UserVerficationStatus.unknown);
  }

  Future<void> initializeData() async {
    var rc = Get.find<RedirectionController>();
    if (rc.userExists) {
      updateUserVerificationStatus(UserVerficationStatus.verified);
      // try {
      //   homeController.initializeAllData().then((value) {
      //   }).onError((error, stackTrace) {
      //     updateUserVerificationStatus(UserVerficationStatus.unverified);
      //     // print("Error getting data: $error");
      //   });
      //   Get.find<HomeTabController>().getUser();
      // } on Exception catch (e) {
      //   print(e);
      //   // print("Exception initializeing data");
      // }
    } else {
      updateUserVerificationStatus(UserVerficationStatus.unknown);
      // try {
      //   await homeController.initializePublicData();
      // } on Exception catch (e) {
      //   print(e);
      //   // print("Exception initializeing data");
      // }
    }
  }
}
