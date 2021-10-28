import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';
import 'package:metrocoffee/constants/instances.dart';
import 'package:metrocoffee/models/user.dart';

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

  unverifyUser() {
    userIsVerified = false;
  }

  @override
  void onInit() {
    super.onInit();
  }

  initializeData() {
    Get.find<CartController>().getOrderProducts();
    Get.find<HomeTabController>().initializeAllData().then((value) {
      Get.find<BaseController>().setUserVerified();
    });
    Get.find<HomeTabController>().setUserDetail();
  }
}
