import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:metrocoffee/core/config.dart';
import 'package:metrocoffee/core/constants/app_message.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/checkout_order.dart';
import 'package:metrocoffee/core/models/order_history.dart';
import 'package:metrocoffee/core/models/shipping_address.dart';
import 'package:metrocoffee/core/sources/remote_source.dart';
import 'package:metrocoffee/util/debug_printer.dart';
import 'checkout_service.dart';

class CheckoutServiceImpl extends CheckoutService {
  final _remoteSource = locator<RemoteSource>();
  @override
  Future<Either<TimeInterval, Failure>> getTimeInterval() async {
    try {
      var response = await _remoteSource.get("/api/delivery_time");
      return Left(TimeInterval.fromJson(response));
    } on ServerException catch (error) {
      return Right(
        Failure(
          tag: "Profile Retreival Error",
          message: "${error.code} ${error.message}",
        ),
      );
    } catch (error) {
      return Right(Failure(tag: "Failure!!", message: "Generic Error"));
    }
  }

  @override
  Future<Either<String, Failure>> addShippingAddress(data) async {
    try {
      await _remoteSource.post("/api/auth/customer/shipping/add", body: data);
      return const Left("successfully Added");
    } on ServerException catch (error) {
      return Right(
        Failure(
          tag: "Address adding Error",
          message: "${error.code} ${error.message}",
        ),
      );
    } catch (error) {
      return Right(Failure(tag: "Failure!!", message: "Generic Error"));
    }
  }

  @override
  Future<Either<List<ShippingAddress>, Failure>> getShippingAddresses() async {
    try {
      var response =
          await _remoteSource.get("/api/auth/customer/shipping/list");
      List<ShippingAddress> shippingAddrList = <ShippingAddress>[];
      List<dynamic> addressList = response["data"];
      for (var element in addressList) {
        shippingAddrList.add(ShippingAddress.fromJson(element));
      }
      return Left(shippingAddrList);
    } on ServerException catch (error) {
      return Right(
        Failure(
          tag: "Address Listing Error",
          message: "${error.code} ${error.message}",
        ),
      );
    } catch (error) {
      return Right(Failure(tag: "Failure!!", message: "Generic Error"));
    }
  }

  @override
  Future<Either<String, Failure>> updateUserAddress(
      {required int id, required Map<String, dynamic> data}) async {
    try {
      await _remoteSource.post("/api/auth/customer/shipping/edit/$id",
          body: data);
      return const Left("Address Edited SucessFully");
    } on ServerException catch (error) {
      return Right(
        Failure(
          tag: "Address Update Error",
          message: "${error.code} ${error.message}",
        ),
      );
    } catch (error) {
      return Right(Failure(tag: "Failure!!", message: "Generic Error"));
    }
  }

  @override
  Future<Either<String, Failure>> deleteAddressWithId({required int id}) async {
    try {
      await _remoteSource
          .post("/api/auth/customer/shipping/delete", body: {"id": id});
      return const Left("Address Deleted SucessFully");
    } on ServerException catch (error) {
      return Right(
        Failure(
          tag: "Address Delete Error",
          message: "${error.code} ${error.message}",
        ),
      );
    } catch (error) {
      return Right(
        Failure(tag: "Failure!!", message: "Generic Error"),
      );
    }
  }

  @override
  Future<Either<Map<String, dynamic>, Failure>> getPaymentInstance(
      Map<String, dynamic> data,
      {String? secretKey}) async {
    if (secretKey != null) {
      try {
        final _dio = Dio(
          BaseOptions(
            baseUrl: AppConfig.stripeBaseUrl,
            headers: {
              HttpHeaders.authorizationHeader: "Bearer $secretKey",
              HttpHeaders.contentTypeHeader: "application/x-www-form-urlencoded"
            },
          ),
        );
        final response = await _dio.post("/v1/payment_intents", data: data);
        if (response.data is Map<String, dynamic>) {
          final body = response.data;
          if (body['error'] != null) {
            if (body['error'] is String) {
              return Right(
                  Failure(tag: "Payment Error!!", message: body['error']));
            }
            return Right(
                Failure(tag: "Payment", message: "Error making payment"));
          }
          return Left(body);
        } else {
          return Right(
              Failure(tag: "Payment", message: "Error making payment"));
        }
      } on DioError catch (error) {
        if (error.response?.statusCode == 400) {
          return Right(Failure(
              tag: "Payment Error!!", message: "Account not authorized"));
        } else if (error.response?.statusCode == 500) {
          return Right(Failure(
              tag: "Payment Error!!", message: " Server Error occured"));
        } else {
          return Right(Failure(
              tag: "Payment Error!!",
              message: " Generic Server Error occured"));
        }
      } catch (error, stacktrace) {
        dPrint(stacktrace);
        return Right(
            Failure(tag: "Payment Error!!", message: " Generic Error occured"));
      }
    }
    return Right(
        Failure(tag: "Failure!!", message: "Couldn't Procced, Please Retry!!"));
  }

  @override
  Future<Either<OrderInstance, Failure>> processOrder(
      Map<String, dynamic> data) async {
    // dPrint(jsonEncode(data));
    try {
      final response = await _remoteSource
          .post("/api/auth/customer/order/checkout", body: data);
      // print("API SAMPLE RESPONSE: $response");
      final _currentInstance = OrderInstance.fromJson(response);
      return Left(_currentInstance);
    } on ServerException catch (error) {
      return Right(
        Failure(
          tag: "Couldn't place order!!",
          message: "${error.code} ${error.message}",
          errorStatusCode: error.code,
        ),
      );
    } catch (error, stacktrace) {
      dPrint(stacktrace);
      return Right(Failure(tag: "Failure!!", message: "Generic Error"));
    }
  }

  @override
  Future<Either<List<OrderInstance>, Failure>> getOrderHistory() async {
    try {
      final response = await _remoteSource.get("/api/auth/customer/order");
      final _orderList = <OrderInstance>[];
      if (response.containsKey("data")) {
        for (var item in response['data']) {
          _orderList.add(OrderInstance.fromJson(item));
        }
      }
      return Left(_orderList);
    } on ServerException catch (error) {
      return Right(
        Failure(
          tag: "Couldn't get order!!",
          message: "${error.code} ${error.message}",
          errorStatusCode: error.code,
        ),
      );
    } catch (error, stacktrace) {
      dPrint(stacktrace);
      return Right(
        Failure(
          tag: "Failure!!",
          message: "Generic Error",
          errorStatusCode: AppMessage.localError,
        ),
      );
    }
  }

  @override
  Future<Either<List<OrderInstance>, Failure>> getOrderDetailWithId(
      {required int orderId}) async {
    throw UnimplementedError();
    //   try {
    //     final response = await _remoteSource.get(
    //       "/api/auth/customer/order/checkout",
    //     );
    //     // print("API SAMPLE RESPONSE: $response");
    //     final _currentInstance = OrderInstance.fromJson(response);
    //     return Left(_currentInstance);
    //   } on ServerException catch (error) {
    //     return Right(
    //       Failure(
    //         tag: "Couldn't place order!!",
    //         message: "${error.code} ${error.message}",
    //         errorStatusCode: error.code,
    //       ),
    //     );
    //   } catch (error, stacktrace) {
    //     dPrint(stacktrace);
    //     return Right(Failure(tag: "Failure!!", message: "Generic Error"));
    //   }
  }
}
