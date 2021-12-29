import 'package:dartz/dartz.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/locator.dart';
import 'package:metrocoffee/core/models/checkout_order.dart';
import 'package:metrocoffee/core/models/shipping_address.dart';
import 'package:metrocoffee/core/sources/remote_source.dart';
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
  Future<Either<String, Failure>> addShippingAddress() async {
    try {
      await _remoteSource.post("/api/auth/customer/shipping/add");
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
  Future<Either<String, Failure>> updateUserAddress({required int id}) async {
    try {
      await _remoteSource.post("/api/auth/customer/shipping/edit/$id");
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
}
