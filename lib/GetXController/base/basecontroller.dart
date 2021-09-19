import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/user_detail.dart';

class BaseController extends GetxController {
  int currentindex = 0;
  bool userIsVerified = false;

  setindex(int index) {
    currentindex = index;
    update();
  }

  setUserVerified() {
    userIsVerified = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
    final HomeTabController homeTabController = Get.put(HomeTabController());

    verifyToken().then((status) {
      print('verification status: $status');
      if (status == false) {
        Get.offAllNamed('/Login');
        // setUserVerified();
        // Future.delayed(Duration.zero).then((value) => Get.offNamed('/Login'));
      } else {
        print("user has been verified section");
        setUserVerified();
        homeTabController.initializeAllData();
      }
    });
  }
}
