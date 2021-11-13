import 'package:dio/dio.dart';
import 'package:metrocoffee/services/dioerror_catcher.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';

import 'config.dart';

class OrderService {
  OrderService._instance();

  static final OrderService _productService = OrderService._instance();

  factory OrderService.getInstance() {
    return _productService;
  }

  var dio = Dio(options);

  Future addOrder(data) async {
    var token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Content-Type"] = "application/json";
    if (token == null) {
      print("token cannot be verifed");
      return null;
    } else {
      try {
        var afterOrder = await dio.post(
          '$baseUrl/api/order',
          data: data,
        );
        if (afterOrder.statusCode == 200)
          return afterOrder.data;
        else
          return null;
      } on DioError catch (e) {
        catchAndPrintDioError(e);
      }
      return null;
    }
  }

  Future reorder(data) async {
    var token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";
    dio.options.headers["Content-Type"] = "application/json";
    if (token == null) {
      print("token cannot be verifed");
      return null;
    } else {
      try {
        var afterOrder = await dio.post(
          '$baseUrl/api/order/reorder',
          data: data,
        );
        if (afterOrder.statusCode == 200)
          return afterOrder.data;
        else
          return null;
      } on DioError catch (e) {
        print(e.message);
        catchAndPrintDioError(e);
      }
      return null;
    }
  }

  Future getOrders() async {
    var token = await getToken();
    if (token == null) {
      print("token cannot be verifed");
      return;
    } else {
      try {
        dio.options.headers["Authorization"] = "Bearer ${token}";
        var orders = await dio.get('$baseUrl/api/order');
        return orders;
      } on DioError catch (e) {
        catchAndPrintDioError(e);
      }
    }
    return null;
  }

  Future getOrderWithId(int id) async {
    var token = await getToken();
    if (token == null) {
      print("token cannot be verifed");
      return;
    } else {
      try {
        dio.options.headers["Authorization"] = "Bearer $token";
        var order = await dio.get('$baseUrl/api/order/$id');
        return order.data;
      } on DioError catch (e) {
        catchAndPrintDioError(e);
      }
    }
    return null;
  }

  Future cancelOrder(int orderId) async {
    var token = await getToken();
    if (token == null) {
      print("token cannot be verifed");
      return;
    } else {
      try {
        dio.options.headers["Authorization"] = "Bearer $token";
        var order = await dio.post('$baseUrl/api/order/$orderId/cancel');
        return order.data;
      } on DioError catch (e) {
        catchAndPrintDioError(e);
      }
    }
    return null;
  }
}
