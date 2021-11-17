import 'package:get/get.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';

enum UserVerficationStatus { verified, unverified, unknown }

class BaseController extends GetxController {
  int currentindex = 0;
  // bool userIsVerified = false;

  UserVerficationStatus _userVerficationStatus =
      UserVerficationStatus.unverified;

  UserVerficationStatus get userVerificationStatus => _userVerficationStatus;

  void updateUserVerificationStatus(
      UserVerficationStatus userVerficationStatus) {
    _userVerficationStatus = userVerficationStatus;
    update();
  }

  setindex(int index) {
    currentindex = index;
    update();
  }

  // setUserVerified() {
  //   userIsVerified = true;
  //   update();
  // }

  // unverifyUser() {
  //   userIsVerified = false;
  // }

  @override
  void onInit() {
    super.onInit();
  }

  Future<void> initializeData() async {
    var rc = Get.find<RedirectionController>();
    var homeController = Get.find<HomeTabController>();
    if (rc.userExists) {
      try {
        homeController.initializeAllData().then((value) {
          updateUserVerificationStatus(UserVerficationStatus.verified);
        }).onError((error, stackTrace) {
          updateUserVerificationStatus(UserVerficationStatus.unverified);
          print("Error getting data: $error");
        });
        Get.find<HomeTabController>().getUser();
      } on Exception catch (e) {
        print(e);
        // print("Exception initializeing data");
      }
    } else {
      try {
        var status = await homeController.initializePublicData();
        if (status) {
          updateUserVerificationStatus(UserVerficationStatus.unknown);
        }
      } on Exception catch (e) {
        print(e);
        // print("Exception initializeing data");
      }
    }
  }
}
