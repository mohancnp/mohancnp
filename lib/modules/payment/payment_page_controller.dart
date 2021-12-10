import 'dart:convert';

import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/order_state.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/core/routing/names.dart';
import 'package:metrocoffee/core/services/cart_service/cart_service.dart';
import 'package:metrocoffee/core/services/older/order_service/order_service.dart';
import 'package:metrocoffee/modules/cart/cart_controller.dart';
import 'package:metrocoffee/modules/checkout/checkout_page_controller.dart';
import 'package:metrocoffee/modules/home/base_controller.dart';
import 'package:metrocoffee/ui/widgets/custom_snackbar_widget.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

class PaymentPageController extends GetxController {
  RemoteOrder remoteOrder = RemoteOrder.empty();
  OrderState _orderState = OrderState.initial;
  final cartController = Get.find<CartController>();
  final checkoutConroller = Get.find<CheckoutPageController>();
  var _orderService = locator.get<OrderService>();
  bool reordering = false;

  Future confirmPaymentAndPlaceOrder() async {
    if (reordering) {
      var id = Get.arguments;
      if (id != null) {
        if (id is int) {
          showCustomDialog(message: "Processing Your Order");
          reorderWithId(orderId: id);
        }
      }
    } else {
      checkoutConroller.setTimeAccordingTimeFromSelection();
      _orderState = OrderState.processing;
      showCustomDialog(message: "Processing Your Order");
      _orderState = await placeOrder();
      if (_orderState == OrderState.placed) {
        cartController.cartProductList?.clear();
        cartController.cartCount.value = 0;
        Get.back();
        Get.offAllNamed(PageName.ordersucessfullpage);
        await clearCart();
      } else if (_orderState == OrderState.error) {
        showCustomSnackBarMessage(title: "Failure", message: "placing order");
        Get.offAllNamed(PageName.homepage);
      }
    }
  }

  clearCart() async {
    try {
      var count = await locator.get<CartService>().clearCart();
      if (count > 0) {
        print("successfully removed all items from cart");
      }
    } on AppException catch (e) {
      print("${e.message}");
    }
  }

  Future placeOrder() async {
    List<UserOrder> orderList = [];

    remoteOrder.deliveryTimeEnd = checkoutConroller.timeEnd;
    remoteOrder.deliveryTimeFrom = checkoutConroller.timeFrom;
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

    try {
      if (orderList.isNotEmpty) {
        var result = await _orderService.createOrder(remoteOrder.toJson());
        if (result != null) {
          orderState = OrderState.placed;
        } else {
          orderState = OrderState.error;
        }
      }
    } on ServerException catch (e) {
      orderState = OrderState.error;
      print("${e.code} and ${e.message}");
    }
    return _orderState;
    // print(remoteOrder.toJson());
  }

  set orderState(OrderState os) {
    _orderState = os;
    update();
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
