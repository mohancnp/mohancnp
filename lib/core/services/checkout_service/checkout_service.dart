import 'package:dartz/dartz.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/models/checkout_order.dart';
import 'package:metrocoffee/core/models/shipping_address.dart';

abstract class CheckoutService {
  Future<Either<TimeInterval, Failure>> getTimeInterval();
  Future<Either<List<ShippingAddress>, Failure>> getShippingAddresses();
  Future<Either<String, Failure>> addShippingAddress(Map<String, dynamic> data);
  Future<Either<String, Failure>> updateUserAddress(
      {required int id, required Map<String, dynamic> data});

  Future<Either<String, Failure>> deleteAddressWithId({required int id});
}
