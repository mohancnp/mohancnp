import 'package:get/get.dart';

class BaseController extends GetxController {
  int currentindex = 0;
  bool userIsVerified = false;

  setindex(int index) {
    currentindex = index;
    update();
  }

  setUserVerified() {
    this.userIsVerified = true;
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

}
