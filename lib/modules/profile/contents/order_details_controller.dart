import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/order_detail.dart';
import 'package:metrocoffee/core/services/checkout_service/checkout_service.dart';
import 'package:metrocoffee/util/debug_printer.dart';

class OrderDetailsController extends GetxController {
  DataState _dataState = DataState.passive;
  late OrderDetail _orderDetail;
  final _checkoutService = locator<CheckoutService>();
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

  Future<void> getOrderDetail() async {
    final orderId = int.parse(Get.parameters['id']!);
    dataState = DataState.loading;
    final response =
        await _checkoutService.getOrderDetailWithId(orderId: orderId);
    response.fold((l) => setOrderDetail, handleOrderRetreivalError);
  }

  void setOrderDetail(OrderDetail orderDetail) {
    print(orderDetail.toString());
    this.orderDetail = orderDetail;
    dataState = DataState.loaded;
  }

  void handleOrderRetreivalError(Failure f) {
    dPrint("Code: ${f.errorStatusCode} Message: ${f.message}");
    if (f.errorStatusCode == 401) {
      dataState = DataState.authError;
    } else {
      dataState = DataState.error;
    }
  }

  Future<void> reorderProduct(int orderId, dynamic amount) async {}
  @override
  void onInit() {
    getOrderDetail();
    super.onInit();
  }
}
