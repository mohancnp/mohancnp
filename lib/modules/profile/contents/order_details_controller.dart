import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/core/services/older/order_service/order_service.dart';
import 'package:metrocoffee/ui/widgets/custom_snackbar_widget.dart';
import 'package:metrocoffee/ui/widgets/progress_dialog.dart';

class OrderDetailsController extends GetxController {
  OrderDetail _orderDetail = OrderDetail();
  final _orderService = locator.get<OrderService>();
  DataState _dataState = DataState.na;

  set dataState(d) {
    _dataState = d;
    update();
  }

  set orderDetail(OrderDetail od) {
    _orderDetail = od;
    update();
  }

  OrderDetail get orderDetail {
    return _orderDetail;
  }

  DataState get dataState {
    return _dataState;
  }

  getOrderDetailWithId(int id) async {
    dataState = DataState.loading;
    try {
      var orderDetailMap = await _orderService.getOrderDetailWithId(id: id);

      OrderDetail od = OrderDetail.fromJson(orderDetailMap["data"]);
      orderDetail = od;
      dataState = DataState.loaded;
    } on AppException {
      dataState = DataState.error;
    } on Exception {
      dataState = DataState.error;
    }
  }

  cancelOrderWithId(int id) async {
    showCustomDialog(message: "Processing");
    try {
      var orderDetailMap = await _orderService.cancelOrderWithId(id: id);
      if (orderDetailMap != null) {
        _orderDetail.status = "cancelled";
        Get.back();
        Get.back();
        Get.snackbar("Order Cancel:", "Sucessfull",
            duration: const Duration(milliseconds: 1500));
        update();
      }
    } on AppException {
      Get.back();
      showCustomSnackBarMessage(title: "Order Cancellation", message: "failed");
    }
  }

  reorderProduct(int orderId, dynamic amount) {
    // Get.find<CartController>().totalAmount.value = amount;
    // Get.find<PaymentPageController>().reordering = true;
    // Get.toNamed(PageName.paymentspage, arguments: orderId);
  }
}
