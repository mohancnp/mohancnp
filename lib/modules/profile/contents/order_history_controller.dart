import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';

class OrderHistoryController extends GetxController {
  DataState _dataState = DataState.na;
  final RxList<dynamic> _orderHistoryList = <dynamic>[].obs;

  set dataState(d) {
    _dataState = d;
    update();
  }

  get dataState {
    return _dataState;
  }

  RxList<dynamic> get orderHistoryList {
    return _orderHistoryList;
  }

  set updateOrderList(OrderHistory ohy) {
    _orderHistoryList.add(ohy);
    _orderHistoryList.refresh();
  }

  getAllOrders() async {
    //TODO get all order data and giv to orderlist instance
    orderHistoryList.clear();
  }
}
