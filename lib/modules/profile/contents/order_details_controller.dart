import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:metrocoffee/core/enums/data_state.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/order_model.dart';
import 'package:metrocoffee/core/services/order_service/order_service.dart';
import 'package:metrocoffee/ui/src/palette.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrderDetailsController extends GetxController {
  OrderDetail _orderDetail = OrderDetail();
  var _orderService = locator.get<OrderService>();
  DataState _dataState = DataState.NA;

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
      // print(orderDetailMap["data"]);
      OrderDetail od = OrderDetail.fromJson(orderDetailMap["data"]);
      orderDetail = od;
      dataState = DataState.loaded;
    } on AppException catch (e) {
      dataState = DataState.error;
      print(e.message);
    } on Exception catch (e) {
      dataState = DataState.error;
      print(e);
    }
  }

  cancelOrderWithId(int id) async {
    Get.defaultDialog(
        content: SizedBox(
          width: 20.w,
          height: 20.h,
          child: CircularProgressIndicator(
            color: Palette.coffeeColor,
          ),
        ),
        title: "Requesting");
    try {
      var orderDetailMap = await _orderService.cancelOrderWithId(id: id);
      if (orderDetailMap != null) {
        Get.back();
        Get.snackbar("Order Cance:", "Sucessfull",
            duration: Duration(milliseconds: 1500));
      }
    } on AppException catch (e) {
      Get.back();
      Get.snackbar("Order Cancel:", "Error",
          colorText: Colors.red, duration: Duration(milliseconds: 1500));
      print(e.message);
    }
  }
}
