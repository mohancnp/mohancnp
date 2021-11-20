import 'package:get/get.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';

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

  Future handleUserLogin() async {
    // var hc = Get.find<HomeTabController>();
    var bc = Get.find<BaseController>();
    bc.setindex(0);
    // hc.allBakery.clear();
    // hc.allDrinks.clear();
    // hc.allSnacks.clear();
    // hc.allProducts.clear();
    return true;
  }
}
