import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/older/order_model.dart';
import 'package:metrocoffee/core/services/older/order_service/order_service.dart';

class OrderHistoryController extends GetxController {
  DataState _dataState = DataState.NA;
  RxList<dynamic> _orderHistoryList = <dynamic>[].obs;

  set dataState(d) {
    _dataState = d;
    update();
  }

  var _orderService = locator.get<OrderService>();

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
  //   orderId = Get.arguments;
  // // print("received Id: $orderId");
  // orderService.getOrderWithId(orderId).then((value) {
  //   if (value != null) {
  //     orderDetail = OrderDetail.fromJson(value['data']);
  //     setState(() {
  //       if (orderDetail == null) {
  //         status = UIState.passive;
  //       } else {
  //         status = UIState.completed;
  //       }
  //     });
  //   }
  // });

  getAllOrders() async {
    orderHistoryList.clear();
    dataState = DataState.loading;
    try {
      var orders = await _orderService.getAllOrder();
      List<dynamic> orderList = orders["data"]["data"];
      // print(orderList);
      List<dynamic> todaysOrder = [];
      List<dynamic> thisMonthOrder = [];

      var todaysDate = DateTime.now();
      var thisMonth = "${DateTime.now().year}/${DateTime.now().month}";

      orderList.forEach((element) {
        // print(element);
        var ohs = OrderHistory.fromJson(element);
        var dateTime = DateTime.parse(ohs.createdAt!.substring(0, 16));
        var orderMonth = "${dateTime.year}/${dateTime.month}";

        if ((todaysDate.difference(dateTime)).inDays <= 1) {
          todaysOrder.add(ohs);
        }

        if (thisMonth == orderMonth) {
          thisMonthOrder.add(ohs);
        }
      });
      _orderHistoryList.add(0);
      _orderHistoryList.addAll(todaysOrder);
      _orderHistoryList.add(1);
      _orderHistoryList.addAll(thisMonthOrder);
      if (_orderHistoryList.length > 2) {
        dataState = DataState.loaded;
      } else {
        dataState = DataState.NA;
      }
    } on AppException catch (e) {
      dataState = DataState.error;
      print("${e.message}");
    } on Exception catch (e) {
      dataState = DataState.error;

      print("$e");
    }
    // _orderHistoryList.refresh();
  }
}
