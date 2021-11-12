import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/models/order_model.dart';
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

  Future placeOrder() async {
    List<UserOrder> orderList = [];
    remoteOrder.deliveryTimeEnd = timeEnd;
    remoteOrder.deliveryTimeFrom = timeFrom;
    if (cartController.cartProductList != null) {
      // print(cartController.cartProductList);
      cartController.cartProductList!.forEach((element) {
        List<dynamic> options = jsonDecode(element.options);
        List<dynamic> addons = jsonDecode(element.addons);
        List<String> optionList = [];
        options.forEach((elem) {
          optionList.add(elem);
        });
        List<int> addonList = [];
        addons.forEach((element) {
          addonList.add(element);
        });

        // print(optionList);
        // print(addons);

        var order = UserOrder.local(
          productVariantId: element.variantId,
          qty: element.qty,
          orderProductOptions: optionList,
          orderProductAddons: addonList,
        );
        // print(order.toJson());
        orderList.add(order);
      });
    }
    remoteOrder.orderProducts = orderList;
    print(remoteOrder.toJson());
  }

  List<String> getTimeAccordingTimeFromSelection() {
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
      }
    }
    return [timeFrom, timeEnd];
  }
}
