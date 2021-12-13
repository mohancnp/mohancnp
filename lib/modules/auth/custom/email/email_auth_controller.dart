import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';

class EmailAuthController extends GetxController {
  final emailEditingController = TextEditingController();
  final firstNameEditingController = TextEditingController();
  final lastNameEditingController = TextEditingController();
  final passwordEditingController = TextEditingController();
  final rePasswordEditingController = TextEditingController();
  final redirectionController = Get.find<RedirectionController>();
  final loginEmailEditingController = TextEditingController();
  final loginPasswordEditingController = TextEditingController();
  bool _eye = false;
  bool _showpassword = false;
  String _errorMessage = "";

  get eye => this._eye;

  set eye(value) {
    this._eye = value;
    update();
  }

  get showpassword => this._showpassword;

  set showpassword(value) => this._showpassword = value;
  get errorMessage => this._errorMessage;

  set errorMessage(value) {
    this._errorMessage = value;
    update();
  }

  void navigateToRoute({required String routeName}) {
    if (redirectionController.userExists) {
      Get.toNamed(routeName);
    }
  }

  Future performEmailLogin() async {}

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
  }
}
