import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/cartcontroller.dart';
import 'package:metrocoffee/GetXController/contentcontrollers/home/hometabcontroller.dart';

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
    print("On init");
    super.onInit();
  }

  Future<bool> initializeData() async {
    try {
      print("initialization starts");
      Get.find<CartController>().getOrderProducts();
      Get.find<HomeTabController>().initializeAllData().then((value) {
        Get.find<BaseController>().setUserVerified();
      });
      Get.find<HomeTabController>().setUserDetail();
    } on Exception catch (e) {
      print("Exception initializeing data");
      return false;
    }
    return true;
  }
}
