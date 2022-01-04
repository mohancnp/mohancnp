import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/company_detail.dart';
import 'package:metrocoffee/core/enums/user_order_preference.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/checkout_order.dart';
import 'package:metrocoffee/core/models/order_history.dart';
import 'package:metrocoffee/core/models/shipping_address.dart';
import 'package:metrocoffee/core/models/user_profile.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/auth_service/auth_service.dart';
import 'package:metrocoffee/core/services/cart_service/cart_service.dart';
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
  String? formattedTimeStamp;
  final cartController = Get.find<CartController>();
  final _checkoutService = locator<CheckoutService>();
  final _cartService = locator<CartService>();
  final _authService = locator<AuthService>();
  Rx<String> wrongTimeSelectionMessage = "".obs;
  UserOrderPreference userPreference = UserOrderPreference.pickup;
  RxBool addresssisLoading = false.obs;
  TimeInterval timeInterval =
      TimeInterval(id: 1, minDeliveryTime: 30, minTakeawayTime: 15);
  RxList<ShippingAddress> shippingAddresses = <ShippingAddress>[].obs;
  final Rx<int> _selectedAddressIndex = 0.obs;
  String? secretKey;
  var c = Get.find<RedirectionController>();

  Future<void> navigateToPaymentOrLogin() async {
    handleTimePickerResponse(selectedTime: userSelectedTimeOfDay);
    final connection = await InternetConnectionHelper.isConnectionReady();

    if (connection) {
      if (secretKey != null) {
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
        showErrorDialog(
          errorTitle: "Sorry!!!",
          errorMessage:
              "Couldn't proceed to payment, please contact the owner!!!",
        );
      }
    } else {
      showErrorDialog(
        errorTitle: "Connection Problem",
        errorMessage: "Please connect and try again",
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
          subtitle: CompanyDetail.subAddress,
        ),
      );
      await initPaymentSheet();
    }
  }

  Future<void> getClientSecretKey() async {
    final response = await _authService.getSecretKey();
    response.fold(handleSecretKey, (r) => dPrint(r.tag + r.message));
  }

  void handleSecretKey(String base64Key) {
    final bytesInLatin1Decoded = base64.decode(base64Key);
    final decryptedKey = latin1.decode(bytesInLatin1Decoded);
    secretKey = decryptedKey;
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
    getClientSecretKey();
    super.onInit();
  }

  Future<void> initPaymentSheet() async {
    final user = Get.find<ProfilePageController>().newUser;
    final Map<String, dynamic> data = {
      //amount in penny (smallest unit of pound sterling 1 pound=100 penny)
      "amount": (cartController.totalAmount.value.toPrecision(2) * 100).toInt(),
      "currency": "GBP",
      "payment_method_types[]": "card",
      "receipt_email": user.email,
    };
    // 1. create payment intent
    final response =
        await _checkoutService.getPaymentInstance(data, secretKey: secretKey);
    response.fold((l) {
      Get.back();
      response.leftMap((l) => handlePaymentIntent(l, user));
    }, (r) {
      Get.back();
      dPrint("Failure Making Payment");
      showCustomSnackBarMessage(title: r.tag, message: r.message);
    });
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
    );

    try {
      showCustomDialog(message: "initializing payment gateway...");
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
      await confirmPayment(transId: response["id"]);
    } on StripeError catch (error) {
      dPrint(error.message);
      showCustomSnackBarMessage(
          title: "Error", message: "Error Initiating Payment");
    } catch (e) {
      showCustomSnackBarMessage(
          title: "Error", message: "Error Initiating Payment");
    }
  }

  Future<Either<OrderInstance, Failure>> processOrder(
      {required String transactionId}) async {
    shippingAddresses.add(
      ShippingAddress(
        lattitude: CompanyDetail.lat,
        longitude: CompanyDetail.long,
        title: CompanyDetail.address,
        subtitle: CompanyDetail.subAddress,
      ),
    );

    final _selectedAddress = shippingAddresses[selectedAddressIndex];
    List<OrderItem> _orderItems = <OrderItem>[];
    for (var item in cartController.cartProductList) {
      final orderItem = OrderItem(
        subTotalPrice: item.totalPrice,
        productId: item.productId,
        name: item.name,
        qty: item.qty,
        imageUri: item.imageUri,
        productVariants: item.selectedVariants,
        productType: item.selectedProductType,
        toppingList: item.toppingsList,
        addons: item.addons,
      );
      _orderItems.add(orderItem);
    }
    final _finalTotal = cartController.totalAmount.value;
    final _finalCartCount = cartController.cartCount.value;
    final _dataToSend = OrderData(
      orderItems: _orderItems,
      shippingAddress: _selectedAddress,
      totalAmount: _finalTotal,
      shipppingTime: formattedTimeStamp ?? "0000:00:00",
      txnId: transactionId,
      itemsCount: _finalCartCount,
    ).toJson();
    final response = await _checkoutService.processOrder(_dataToSend);
    return response;
  }

  Future<void> confirmPayment({required String transId}) async {
    try {
      // 3. display the payment sheet.
      await Stripe.instance.presentPaymentSheet();
      //4. Now process the order0

      //remove dialog related to payment and initializing order processing dialog
      removeDailog();
      showCustomDialog(message: "confirming your order");
      final response = await processOrder(transactionId: transId);
      _cartService.clearCart();
      response.fold((result) {
        Get.offAllNamed(
          PageName.orderReceiptPage,
          arguments: result,
        );
        // dPrint(result);
      }, (r) {
        Get.offAllNamed(PageName.homepage);
        dPrint(r.tag + r.message);
      });
    } on StripeError catch (e) {
      Get.back();
      showCustomSnackBarMessage(
        title: "Message",
        message: e.message,
      );
    } catch (error, stacktrace) {
      Get.back();
      dPrint(stacktrace);
      showCustomSnackBarMessage(
          title: "Couldn't Proceed", message: "Generic Payment Error");
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
      int _minute = _timeDiff.truncate();
      // print(_minute);
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

  void removeDailog() {
    Get.back();
  }
}
