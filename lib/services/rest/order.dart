import 'dart:io';

import 'package:dio/dio.dart';
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
        switch (e.type) {
          case DioErrorType.connectTimeout:
            print("connection time out for the request");
            break;
          case DioErrorType.sendTimeout:
            print("send time out for the request");
            break;
          case DioErrorType.receiveTimeout:
            print("receive time out for the request");
            break;
          case DioErrorType.cancel:
            print("The request has been cancelled");
            break;
          case DioErrorType.response:
            print(e.error);
            print("Server Responded with incorrect status,4xx and 5xx");
            break;
          case DioErrorType.other:
            print("undefined other type of error");
            break;
        }
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
        switch (e.type) {
          case DioErrorType.connectTimeout:
            print("connection time out for the request");
            break;
          case DioErrorType.sendTimeout:
            print("send time out for the request");
            break;
          case DioErrorType.receiveTimeout:
            print("receive time out for the request");
            break;
          case DioErrorType.cancel:
            print("The request has been cancelled");
            break;
          case DioErrorType.response:
            print("Server Responded with incorrect status,4xx and 5xx");
            break;
          case DioErrorType.other:
            print("undefined other type of error");
            break;
        }
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
        switch (e.type) {
          case DioErrorType.connectTimeout:
            print("connection time out for the request");
            break;
          case DioErrorType.sendTimeout:
            print("send time out for the request");
            break;
          case DioErrorType.receiveTimeout:
            print("receive time out for the request");
            break;
          case DioErrorType.cancel:
            print("The request has been cancelled");
            break;
          case DioErrorType.response:
            print("Server Responded with incorrect status,4xx and 5xx");
            break;
          case DioErrorType.other:
            print("undefined other type of error");
            break;
        }
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
        switch (e.type) {
          case DioErrorType.connectTimeout:
            print("connection time out for the request");
            break;
          case DioErrorType.sendTimeout:
            print("send time out for the request");
            break;
          case DioErrorType.receiveTimeout:
            print("receive time out for the request");
            break;
          case DioErrorType.cancel:
            print("The request has been cancelled");
            break;
          case DioErrorType.response:
            print("Server Responded with incorrect status,4xx and 5xx");
            break;
          case DioErrorType.other:
            print("undefined other type of error");
            break;
        }
      }
    }
    return null;
  }
}
