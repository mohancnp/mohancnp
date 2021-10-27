import 'package:flutter/widgets.dart';
import 'package:flutter_login_facebook/flutter_login_facebook.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/GetXController/base/basecontroller.dart';
import 'package:metrocoffee/constants/instances.dart';
import 'package:metrocoffee/models/user.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/user_detail.dart';

class ProfileController extends GetxController {
  Client? newClient;

  Future getUserData() async {
    var token = await getToken();
    var user = await profileService.getUserProfileDataWithToken(token);
    newClient = Client.fromJson(user['data']);
    update();
  }

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
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
