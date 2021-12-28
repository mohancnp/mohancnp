import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/user_order_preference.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/checkout_order.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/core/services/checkout_service/checkout_service.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';
import 'package:metrocoffee/modules/shareables/dialogs/error_dialog.dart';
import 'package:metrocoffee/util/debug_printer.dart';
import 'package:metrocoffee/util/time_diff_calculator.dart';

class CheckoutPageController extends GetxController {
  Rx<String> selectedTimeFrame = "Enter Time".obs;
  final cartController = Get.find<CartController>();
  final _checkoutService = locator<CheckoutService>();
  RemoteOrder remoteOrder = RemoteOrder.empty();
  Rx<String> wrongTimeSelectionMessage = "".obs;

  UserOrderPreference userPreference = UserOrderPreference.pickup;
  TimeInterval timeInterval =
      TimeInterval(id: 1, minDeliveryTime: 30, minTakeawayTime: 15);
  var c = Get.find<RedirectionController>();
  void navigateToPageName({required String pageName, String? defaultPageName}) {
    if (c.userExists) {
      if (selectedTimeFrame.contains("Enter Time")) {
        showErrorDialog(
          errorTitle: "Incomplete Order Request",
          errorMessage: "please select valid time before procceeding",
        );
      } else {
        Get.toNamed(pageName);
      }
    } else {
      if (defaultPageName != null) {
        c.fromPaymentPage = true;
        Get.toNamed(defaultPageName);
      }
    }
  }

  @override
  void onInit() {
    var userPref = Get.arguments;
    if (userPref != null) {
      userPreference = userPref;
    }
    _setTimeInterval();
    super.onInit();
  }

  bool handleServerTimeLogic(TimeOfDay? time) {
    var status = false;
    if (time != null) {
      final TimeOfDay _currentTime = TimeOfDay.now();
      if (time.hour >= _currentTime.hour) {
        status = true;
      }
    }
    return status;
  }

  Future<void> _setTimeInterval() async {
    final response = await _checkoutService.getTimeInterval();
    response.fold((timeInterval) => this.timeInterval = timeInterval,
        (failure) => dPrint("Error Getting time data"));
    dPrint(timeInterval.minDeliveryTime);
  }

  void handleTimePickerResponse({required TimeOfDay? selectedTime}) {
    final minTime = ((userPreference == UserOrderPreference.pickup)
        ? (timeInterval.minTakeawayTime)
        : timeInterval.minDeliveryTime);
    final TimeOfDay _currentTime = TimeOfDay.now();
    if (selectedTime != null) {
      double _timeDiff = getSelectedTimeDifference(
          time: selectedTime, currentTime: _currentTime);
      double _minute = (_timeDiff - _timeDiff.truncate()) * 60;
      if (_minute >= minTime) {
        selectedTimeFrame.value = "${selectedTime.hour}:${selectedTime.minute}";
        wrongTimeSelectionMessage.value = "";
      } else {
        selectedTimeFrame.value = "Enter Time";
        wrongTimeSelectionMessage.value =
            "Selected Time must be above $minTime min from current time";
      }
    } else {
      selectedTimeFrame.value = "Enter Time";
      wrongTimeSelectionMessage.value =
          "Selected Time must be above $minTime min from current time";
    }
  }
}
