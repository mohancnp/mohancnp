import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/company_detail.dart';
import 'package:metrocoffee/core/enums/user_order_preference.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/checkout_order.dart';
import 'package:metrocoffee/core/models/shipping_address.dart';
import 'package:metrocoffee/core/models/user_profile.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/checkout_service/checkout_service.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/profile/profile_page_controller.dart';
import 'package:metrocoffee/modules/public/redirection_controller.dart';
import 'package:metrocoffee/modules/shareables/dialogs/error_dialog.dart';
import 'package:metrocoffee/ui/widgets/custom_snackbar_widget.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';
import 'package:metrocoffee/util/debug_printer.dart';
import 'package:metrocoffee/util/internet.dart';
import 'package:metrocoffee/util/time_diff_calculator.dart';

class CheckoutPageController extends GetxController {
  Rx<String> selectedTimeFrame = "Enter Time".obs;
  TimeOfDay? userSelectedTimeOfDay;
  final cartController = Get.find<CartController>();
  final _checkoutService = locator<CheckoutService>();
  Rx<String> wrongTimeSelectionMessage = "".obs;
  UserOrderPreference userPreference = UserOrderPreference.pickup;
  RxBool addresssisLoading = false.obs;
  TimeInterval timeInterval =
      TimeInterval(id: 1, minDeliveryTime: 30, minTakeawayTime: 15);
  RxList<ShippingAddress> shippingAddresses = <ShippingAddress>[].obs;
  final Rx<int> _selectedAddressIndex = 0.obs;

  var c = Get.find<RedirectionController>();
  Future<void> navigateToPaymentOrLogin() async {
    handleTimePickerResponse(selectedTime: userSelectedTimeOfDay);
    final connection = await InternetConnectionHelper.isConnectionReady();
    if (connection) {
      if (c.userExists) {
        if (selectedTimeFrame.contains("Enter Time")) {
          showErrorDialog(
            errorTitle: "Incomplete Request",
            errorMessage: "please select valid time before proceeding",
          );
        } else {
          showCustomDialog();
          await handlePaymentTask();
        }
      } else {
        c.fromPaymentPage = true;
        Get.toNamed(PageName.loginpage);
      }
    } else {
      showErrorDialog(
        errorTitle: "Internet Problem!!!",
        errorMessage: "connect internet and try again",
      );
    }
  }

  set selectedAddressIndex(int c) {
    _selectedAddressIndex.value = c;
  }

  int get selectedAddressIndex {
    return _selectedAddressIndex.value;
  }

  Future<void> handlePaymentTask() async {
    if (userPreference == UserOrderPreference.delivery) {
      if (shippingAddresses.isNotEmpty) {
        dPrint(shippingAddresses[_selectedAddressIndex.value]);
        await initPaymentSheet();
      } else {
        showErrorDialog(
          errorTitle: "Incomplete Request",
          errorMessage: "please select address from map",
        );
      }
    } else if (userPreference == UserOrderPreference.pickup) {
      shippingAddresses.add(
        ShippingAddress(
            lattitude: CompanyDetail.lat,
            longitude: CompanyDetail.long,
            title: CompanyDetail.address,
            subtitle: CompanyDetail.subAddress),
      );
      await initPaymentSheet();
    }
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

  Future<void> initPaymentSheet() async {
    final user = Get.find<ProfilePageController>().newUser;
    final Map<String, dynamic> data = {
      "amount": (cartController.totalAmount.value.toPrecision(2) * 100).toInt(),
      "currency": "GBP",
      "payment_method_types[]": "card",
      "receipt_email": user.email,
    };
    // 1. create payment intent
    final response = await _checkoutService.getPaymentInstance(data);
    if (response.isLeft()) {
      //remove the loading dialog
      Get.back();
      response.leftMap((l) => handlePaymentIntent(l, user));
    } else {
      dPrint("Failure Making Payment");
      showCustomSnackBarMessage(
          title: "Error", message: "Error Initiating Payment");
    }
  }

  Future<void> handlePaymentIntent(
      Map<String, dynamic> response, UserProfile user) async {
    final billingDetails = BillingDetails(
      email: user.email,
      address: Address(
        city: shippingAddresses[selectedAddressIndex].title,
        country: 'UK',
        line1: shippingAddresses[selectedAddressIndex].subtitle,
        line2: '',
        state: null,
        postalCode: null,
      ),
    ); // mocked data for tests

    try {
      await Stripe.instance.initPaymentSheet(
        paymentSheetParameters: SetupPaymentSheetParameters(
          // Main params
          paymentIntentClientSecret: response['client_secret'],
          merchantDisplayName: 'Metro Coffee Inc. UK',
          // Customer params
          customerId: response['customer'],
          // Extra params
          applePay: true,
          googlePay: true,
          style: ThemeMode.dark,
          primaryButtonColor: Colors.redAccent,
          billingDetails: billingDetails,
          testEnv: true,
          merchantCountryCode: 'GBP',
        ),
      );
      await confirmPayment();
    } on StripeError catch (error) {
      dPrint(error.message);
      showCustomSnackBarMessage(
          title: "Error", message: "Error Initiating Payment");
    } catch (e) {
      showCustomSnackBarMessage(
          title: "Error", message: "Error Initiating Payment");
    }
  }

  Future<void> confirmPayment() async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();
      Get.offAllNamed(PageName.orderReceiptPage);
      // showCustomSnackBarMessage(
      //     title: "Message", message: "Payment succesfully completed");

    } on StripeError catch (e) {
      showCustomSnackBarMessage(
        title: "Message",
        message: e.message,
      );
    } catch (error, stacktrace) {
      dPrint(stacktrace);
      showCustomSnackBarMessage(
          title: "Couldn't Proceed", message: "Generic Payment Error:");
    }
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
