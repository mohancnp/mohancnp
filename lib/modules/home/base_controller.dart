import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';

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
    // print("On init");
    // initializeData();
    super.onInit();
  }

  Future<void> initializeData() async {
    print("initializing data");
    try {
      // print("initialization starts");
      Get.find<HomeTabController>().initializeAllData().then((value) {
        updateUserVerificationStatus(UserVerficationStatus.verified);
      }).onError((error, stackTrace) {
        updateUserVerificationStatus(UserVerficationStatus.unverified);
        print("Error getting data: $error");
      });
      Get.find<CartController>().getOrderProducts();
      Get.find<HomeTabController>().setUserDetail();
    } on Exception catch (e) {
      print(e);
      // print("Exception initializeing data");
    }
  }
}
