import 'package:dartz/dartz.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/models/cart_instance_model.dart';

abstract class CartService {
  Future<Either<int, Failure>> addProductToCart(Map<String, dynamic> cartItem);
  Future<Either<List<CartInstance>, Failure>> getCartProducts();
  Future<Either<int, Failure>> removeProductWithId(int id);
  Future<Either<int, Failure>> clearCart();
  Future<Either<int, Failure>> getCount();
}
