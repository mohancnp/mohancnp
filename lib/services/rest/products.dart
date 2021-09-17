import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'config.dart';

class ProductService {
  var dio = Dio(options);

  Future getAllProducts() async {
    var token = await getToken();
    if (token == null) {
      print("token cannot be verifed");
      return;
    } else {
      try {
        dio.options.headers["Authorization"] = "Bearer ${token}";
        var products = await dio.get('$baseUrl/api/product');
        return products;
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
        }
      }
    }
    return null;
  }


  Future getSingleProduct({required int id}) async {
    var token = await getToken();
    if (token == null) {
      print("token cannot be verifed");
      return;
    } else {
      try {
        dio.options.headers["Authorization"] = "Bearer ${token}";
        var products = await dio.get('$baseUrl/api/product/$id');
        return products.data;
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
        }
      }
    }
  }
}
