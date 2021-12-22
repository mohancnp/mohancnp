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
      Map<String, dynamic> product) async {
    // print(product);
    product[ProductCartFeild.selectedProductType] =
        jsonEncode(product[ProductCartFeild.selectedProductType]);
    product[ProductCartFeild.selectedVariants] =
        jsonEncode(product[ProductCartFeild.selectedVariants]);
    product[ProductCartFeild.toppingsList] =
        jsonEncode(product[ProductCartFeild.toppingsList]);
    product[ProductCartFeild.addons] =
        jsonEncode(product[ProductCartFeild.addons]);
    // print(product);
    try {
      var data = await db.query(Table.cart,
          columns: [
            ProductCartFeild.id,
            ProductCartFeild.productId,
          ],
          where: '${ProductCartFeild.productId} = ?',
          whereArgs: [product[ProductCartFeild.productId]]);
      var count = 0;
      if (data.length > 0) {
        count = await db.update(Table.cart, product,
            where: "${ProductCartFeild.productId} = ?",
            whereArgs: [product[ProductCartFeild.productId]]);
      } else {
        //insert
        print(product);
        count = await db.insert(Table.cart, product);
      }
      return Left(count);
    } on Exception catch (e) {
      print("add update cart error $e");
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
      list.forEach((element) {
        newMap[ProductCartFeild.selectedProductType] =
            jsonDecode(element[ProductCartFeild.selectedProductType] as String);
        newMap[ProductCartFeild.selectedVariants] =
            jsonDecode(element[ProductCartFeild.selectedVariants] as String);
        newMap[ProductCartFeild.toppingsList] =
            jsonDecode(element[ProductCartFeild.toppingsList] as String);
        newMap[ProductCartFeild.addons] =
            jsonDecode(element[ProductCartFeild.addons] as String);
        newMap[ProductCartFeild.productId] =
            element[ProductCartFeild.productId];
        newMap[ProductCartFeild.totalPrice] =
            element[ProductCartFeild.totalPrice];
        newMap[ProductCartFeild.imageUri] = element[ProductCartFeild.imageUri];
        newMap[ProductCartFeild.qty] = element[ProductCartFeild.qty];
        newMap[ProductCartFeild.name] = element[ProductCartFeild.name];

        var data = CartInstance.fromJson(newMap);
        itemList.add(data);
        newMap.clear();
      });
      return Left(itemList);
    } catch (e) {
      print("Error loading the cart products from the database $e");
      return Right(
          Failure(tag: "Get Cart Item:", message: "error fetching cart Item"));
    }
  }

  @override
  Future<Either<int, Failure>> removeProductWithId(int id) async {
    try {
      var count = await db.delete(Table.cart,
          where: '${ProductCartFeild.productId} = ?', whereArgs: [id]);
      print(count);
      return Left(count);
    } catch (e) {
      print("Error $e");
      return Right(
          Failure(tag: "Removing Cart Item", message: "error removing"));
    }
  }

  @override
  Future<Either<int, Failure>> clearCart() async {
    try {
      var count = await db.delete(Table.cart);
      return Left(count);
    } on Exception catch (e) {
      print("Error $e");
      return Right(Failure(
          tag: "Clear Cart:", message: "Error clearing item from Cart"));
    }
  }

  @override
  Future<Either<int, Failure>> getCount() async {
    try {
      var count = await db.rawQuery(sqlQuery.countRows);
      return Left(Sqflite.firstIntValue(count) ?? 0);
    } catch (e) {
      print("$e");
      return Right(Failure(tag: "", message: "Error couting rows"));
    }
  }
}
