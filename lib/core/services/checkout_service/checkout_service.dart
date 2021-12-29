import 'package:dartz/dartz.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/models/checkout_order.dart';
import 'package:metrocoffee/core/models/shipping_address.dart';

abstract class CheckoutService {
  Future<Either<TimeInterval, Failure>> getTimeInterval();
  Future<Either<List<ShippingAddress>, Failure>> getShippingAddresses();
  Future<Either<String, Failure>> addShippingAddress();
  Future<Either<String, Failure>> updateUserAddress({required int id});
}
