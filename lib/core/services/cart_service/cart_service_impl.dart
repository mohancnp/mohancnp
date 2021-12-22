import 'dart:convert';
import 'package:dartz/dartz.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/models/cart_instance.dart';
import 'package:metrocoffee/core/services/cart_service/cart_service.dart';
import 'package:metrocoffee/core/services/storage/db/core.dart';
import 'package:metrocoffee/core/services/storage/db/dbconst.dart';
import 'package:sqflite/sqflite.dart';
import '../../locator.dart';

class CartServiceImpl extends CartService {
  var db = locator<DbStorage>().db;

  @override
  Future<Either<int, Failure>> addProductToCart(
      Map<String, dynamic> cartItem) async {
    //
    cartItem[ProductCartField.selectedProductType] =
        jsonEncode(cartItem[ProductCartField.selectedProductType]);
    cartItem[ProductCartField.selectedVariants] =
        jsonEncode(cartItem[ProductCartField.selectedVariants]);
    cartItem[ProductCartField.toppingsList] =
        jsonEncode(cartItem[ProductCartField.toppingsList]);
    cartItem[ProductCartField.addons] =
        jsonEncode(cartItem[ProductCartField.addons]);
    //
    try {
      var data = await db.query(Table.cart,
          columns: [
            ProductCartField.id,
            ProductCartField.productId,
          ],
          where: '${ProductCartField.productId} = ?',
          whereArgs: [cartItem[ProductCartField.productId]]);
      var count = 0;
      if (data.isNotEmpty) {
        count = await db.update(Table.cart, cartItem,
            where: "${ProductCartField.productId} = ?",
            whereArgs: [cartItem[ProductCartField.productId]]);
      } else {
        //insert
        count = await db.insert(Table.cart, cartItem);
      }
      return Left(count);
    } on Exception {
      return Right(
          Failure(tag: "Add Cart:", message: "failure adding to cart"));
    }
  }

  @override
  Future<Either<List<CartInstance>, Failure>> getCartProducts() async {
    List<CartInstance> itemList = [];
    try {
      var list = await db.rawQuery("SELECT * from ${Table.cart}");
      late Map<String, dynamic> newMap = {};
      for (var element in list) {
        newMap[ProductCartField.selectedProductType] =
            jsonDecode(element[ProductCartField.selectedProductType] as String);
        newMap[ProductCartField.selectedVariants] =
            jsonDecode(element[ProductCartField.selectedVariants] as String);
        newMap[ProductCartField.toppingsList] =
            jsonDecode(element[ProductCartField.toppingsList] as String);
        newMap[ProductCartField.addons] =
            jsonDecode(element[ProductCartField.addons] as String);
        newMap[ProductCartField.productId] =
            element[ProductCartField.productId];
        newMap[ProductCartField.totalPrice] =
            element[ProductCartField.totalPrice];
        newMap[ProductCartField.imageUri] = element[ProductCartField.imageUri];
        newMap[ProductCartField.qty] = element[ProductCartField.qty];
        newMap[ProductCartField.name] = element[ProductCartField.name];

        var data = CartInstance.fromJson(newMap);
        itemList.add(data);
        newMap.clear();
      }
      return Left(itemList);
    } catch (e) {
      return Right(
          Failure(tag: "Get Cart Item:", message: "error fetching cart Item"));
    }
  }

  @override
  Future<Either<int, Failure>> removeProductWithId(int id) async {
    try {
      var count = await db.delete(Table.cart,
          where: '${ProductCartField.productId} = ?', whereArgs: [id]);

      return Left(count);
    } catch (e) {
      return Right(
          Failure(tag: "Removing Cart Item", message: "error removing"));
    }
  }

  @override
  Future<Either<int, Failure>> clearCart() async {
    try {
      var count = await db.delete(Table.cart);
      return Left(count);
    } on Exception {
      return Right(Failure(
          tag: "Clear Cart:", message: "Error clearing item from Cart"));
    }
  }

  @override
  Future<Either<int, Failure>> getCount() async {
    try {
      var count = await db.rawQuery(SqlQuery.countRows);
      return Left(Sqflite.firstIntValue(count) ?? 0);
    } catch (e) {
      return Right(Failure(tag: "", message: "Error couting rows"));
    }
  }
}
