import 'dart:convert';

import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/company_detail.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/map_location.dart';
import 'package:metrocoffee/core/models/order.dart';
import 'package:metrocoffee/core/routing/routes.dart';
import 'package:metrocoffee/core/services/older/order_service/order_service.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/checkout/checkout_page_controller.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/modules/maps/new/google_map_controller.dart';
import 'package:metrocoffee/ui/widgets/custom_snackbar_widget.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

class PaymentPageController extends GetxController {
  final cartController = Get.find<CartController>();
  final checkoutConroller = Get.find<CheckoutPageController>();
  final mapConroller = Get.find<CustomGoogleMapController>();

  var _orderService = locator.get<OrderService>();

  bool reordering = false;

  Future confirmPaymentAndPlaceOrder() async {
    String time = checkoutConroller.selectedTimeFrame.value;
    Address selectedLocation;
    if (mapConroller.userAddresses.isNotEmpty) {
      var location =
          mapConroller.userAddresses[mapConroller.selectedAddressIndex];
      selectedLocation = Address(
          title: location.title,
          subtitle: location.subtitle,
          mapLocation: location.mapLocation);
    } else {
      selectedLocation = Address(
        title: CompanyDetail.address,
        subtitle: CompanyDetail.subAddress,
        mapLocation: MapLocation(
          lat: CompanyDetail.lat,
          long: CompanyDetail.long,
        ),
      );
    }

    var newOrder = Order(
      orderItems: cartController.cartProductList,
      selectedAddress: selectedLocation,
      totalAmount: cartController.totalAmount.value,
      selectedTime: time,
    );
    var orderSample = newOrder.toJson();
    print(jsonEncode(orderSample));
  }

  reorderWithId({required int orderId, int? addressId}) async {
    showCustomDialog(message: "Processing");
    try {
      var reorderStatus = await _orderService.reorderWithOrderId(id: orderId);
      if (reorderStatus == null) {
        Get.back();
        showCustomSnackBarMessage(
            title: "Re Ordering", message: "failed try again!!");
      } else {
        showCustomSnackBarMessage(
            title: "Re Ordering", message: "sucessfully done!!");
        reordering = false;
        Future.delayed(Duration(seconds: 1)).then((value) {
          Get.find<BaseController>().setindex(0);
          Get.offAllNamed(PageName.homepage);
        });
      }
      // print(reorderStatus);
    } on AppException catch (e) {
      reordering = false;
      Get.back();
      showCustomSnackBarMessage(
          title: "Re Ordering", message: "failed try again!!");
      // print(e.message);
    }
  }
}
