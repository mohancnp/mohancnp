import 'package:dartz/dartz.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/models/checkout_order.dart';
import 'package:metrocoffee/core/models/order_history.dart';
import 'package:metrocoffee/core/models/shipping_address.dart';

abstract class CheckoutService {
  Future<Either<TimeInterval, Failure>> getTimeInterval();
  Future<Either<List<ShippingAddress>, Failure>> getShippingAddresses();
  Future<Either<String, Failure>> addShippingAddress(Map<String, dynamic> data);
  Future<Either<String, Failure>> updateUserAddress(
      {required int id, required Map<String, dynamic> data});

  Future<Either<String, Failure>> deleteAddressWithId({required int id});
  Future<Either<Map<String, dynamic>, Failure>> getPaymentInstance(
      Map<String, dynamic> data,
      {String? secretKey});
  Future<Either<String, Failure>> processOrder(Map<String, dynamic> data);
  Future<Either<List<OrderInstance>, Failure>> getOrderHistory();
  Future<Either<List<OrderInstance>, Failure>> getOrderDetailWithId(
      {required int orderId});
}
