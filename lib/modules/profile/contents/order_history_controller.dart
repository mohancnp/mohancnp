import 'package:get/get.dart';
import 'package:metrocoffee/core/constants/order_status.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/order_history.dart';
import 'package:metrocoffee/core/services/checkout_service/checkout_service.dart';
import 'package:metrocoffee/util/debug_printer.dart';

class OrderHistoryController extends GetxController {
  DataState _dataState = DataState.na;
  List<OrderInstance> orderHistoryList = <OrderInstance>[];
  final _checkoutService = locator<CheckoutService>();
  set dataState(d) {
    _dataState = d;
    update();
  }

  get dataState {
    return _dataState;
  }

  Future<void> getAllOrders() async {
    final response = await _checkoutService.getOrderHistory();
    response.fold(setOrderList, (r) {
      dPrint(" error retreiving order list:${r.errorStatusCode} ${r.message}");
      if (r.errorStatusCode == 401 || r.errorStatusCode == 403) {
        dataState = DataState.authError;
      }
      dataState = DataState.error;
    });
  }

  void setOrderList(List<OrderInstance> odl) {
    dPrint(odl);
    orderHistoryList.clear();
    orderHistoryList = List.from(odl.reversed);
    dataState = DataState.loaded;
  }

  String getStatusStringForId(int id) {
    switch (id) {
      case 1:
        return OrderStatus.received;
      case 2:
        return OrderStatus.processing;
      case 3:
        return OrderStatus.onHold;
      case 4:
        return OrderStatus.cancelled;
      case 5:
        return OrderStatus.delivered;
      default:
        return OrderStatus.failed;
    }
  }

  void goToOrderDetail(int id) {}
}
