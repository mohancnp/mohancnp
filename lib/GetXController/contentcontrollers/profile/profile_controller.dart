import 'package:flutter/widgets.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/basecontroller.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/user_detail.dart';

class ProfileController extends GetxController {
  Rx<String?> userName = "".obs;
  Rx<String?> email = "".obs;

  Future getUserNameAndEmail() async {
    userName.value = await getUserName();
    email.value = await getEmail();
    print("${userName.value}  ${email.value}");
  }

  @override
  void onClose() {
    super.onClose();
    print('onclose being called');
  }

  Future logout() async {
    String provider = await getProvider();

    bool tokenRemoved = await removeToken();
    bool userRemoved = await removeUserDetail();

    if (provider == "facebook") {
      final fb = FacebookLogin();
      fb.logOut();
    }
    Get.find<BaseController>().setindex(0);
    return (tokenRemoved && userRemoved) ? true : false;
  }
}
