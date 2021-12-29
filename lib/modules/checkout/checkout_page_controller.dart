import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/user_order_preference.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/checkout_order.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/core/models/shipping_address.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/checkout_service/checkout_service.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';
import 'package:metrocoffee/modules/shareables/dialogs/error_dialog.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/debug_printer.dart';
import 'package:metrocoffee/util/time_diff_calculator.dart';

class CheckoutPageController extends GetxController {
  Rx<String> selectedTimeFrame = "Enter Time".obs;
  final cartController = Get.find<CartController>();
  final _checkoutService = locator<CheckoutService>();
  RemoteOrder remoteOrder = RemoteOrder.empty();
  Rx<String> wrongTimeSelectionMessage = "".obs;
  UserOrderPreference userPreference = UserOrderPreference.pickup;
  RxBool addresssisLoading = false.obs;
  TimeInterval timeInterval =
      TimeInterval(id: 1, minDeliveryTime: 30, minTakeawayTime: 15);
  RxList<ShippingAddress> shippingAddresses = <ShippingAddress>[].obs;
  final Rx<int> _selectedAddressIndex = 0.obs;

  var c = Get.find<RedirectionController>();
  void navigateToPaymentOrLogin() {
    if (c.userExists) {
      if (selectedTimeFrame.contains("Enter Time")) {
        showErrorDialog(
          errorTitle: "Incomplete Request",
          errorMessage: "please select valid time before proceeding",
        );
      } else {
        if (userPreference == UserOrderPreference.delivery) {
          if (shippingAddresses.isNotEmpty) {
            dPrint(shippingAddresses[_selectedAddressIndex.value]);
            //TODO implement strip payment here
            Get.toNamed(PageName.paymentspage);
          } else {
            showErrorDialog(
              errorTitle: "Incomplete Request",
              errorMessage: "please select address from map",
            );
          }
        } else if (userPreference == UserOrderPreference.pickup) {
          Get.toNamed(PageName.paymentspage);
        }
      }
    } else {
      c.fromPaymentPage = true;
      Get.toNamed(PageName.loginpage);
    }
  }

  set selectedAddressIndex(int c) {
    _selectedAddressIndex.value = c;
  }

  int get selectedAddressIndex {
    return _selectedAddressIndex.value;
  }

  @override
  void onInit() {
    var userPref = Get.arguments;
    if (userPref != null) {
      userPreference = userPref;
    }
    _setTimeInterval();
    addresssisLoading.value = true;
    setShippingAddresses();
    super.onInit();
  }

  Future<void> setShippingAddresses() async {
    final response = await _checkoutService.getShippingAddresses();
    response.fold((list) {
      addresssisLoading.value = false;
      shippingAddresses.clear();
      shippingAddresses.value = list;
      shippingAddresses.refresh();
    }, (failure) {
      dPrint(failure.message);
    });
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

  Future<void> deleteAddress(int? id, int index) async {
    if (id != null) {
      showCustomDialog(message: "deleting...");
      final response = await _checkoutService.deleteAddressWithId(id: id);
      response.fold((sucesss) {
        shippingAddresses.removeAt(index);
        shippingAddresses.refresh();
        dPrint(sucesss);
        Get.back();
      }, (failure) {
        dPrint(failure.message);
        Get.back();
      });
    }
  }
}
