import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/uistate.dart';

class RegisterController extends GetxController {
  String selectedGender = "Male";
  UIState state = UIState.passive;
  setUIState(UIState state) {
    this.state = state;
    update();
  }

  setGender(String gender) {
    selectedGender = gender;
    update();
  }
}
