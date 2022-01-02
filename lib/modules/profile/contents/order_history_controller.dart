import 'package:get/get.dart';
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
      dPrint(" error retreiving order list:${r.message}");
      dataState = DataState.error;
    });
  }

  void setOrderList(List<OrderInstance> odl) {
    dPrint(odl);
    orderHistoryList.clear();
    orderHistoryList = odl;
    dataState = DataState.loaded;
  }

  @override
  void onInit() {
    dataState = DataState.loading;
    getAllOrders();
    super.onInit();
  }
}
