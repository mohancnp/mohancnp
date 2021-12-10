import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
// import 'package:metrocoffee/modules/cart/cart_controller.dart';

class CheckoutPageController extends GetxController {
  List<String> timeValues =
      ["As Soon as possible", "1:00-1:10 PM", "1:10-2:10"].obs;
  Rx<int> selectedTimeIndex = (-1).obs;
  Rx<String> selectedTimeFrame = "Enter Time".obs;
  final cartController = Get.find<CartController>();
  RemoteOrder remoteOrder = RemoteOrder.empty();
  TimeOfDay _time = TimeOfDay.now().replacing(minute: 30);
  String timeFrom = "00:00", timeEnd = "00:00";

  void proceedToPayment() {
    Get.toNamed(PageName.paymentspage);
  }

  setTimeAccordingTimeFromSelection() {
    if (selectedTimeIndex.value > -1) {
      switch (selectedTimeIndex.value) {
        case 0:
          // var currentTime = "${_time.hour}:${_time.minute}";
          timeFrom = "${_time.hour}:${_time.minute}";
          timeEnd = timeFrom;
          break;
        case 1:
          timeFrom = "13:00";
          timeEnd = "13:10";
          break;
        case 2:
          timeFrom = "13:10";
          timeEnd = "14:10";
          break;
        default:
          if (selectedTimeFrame.value != "Enter Time") {
            timeFrom = selectedTimeFrame.value;
            timeEnd = selectedTimeFrame.value;
          }
          break;
      }
    }
  }
}
