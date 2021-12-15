import 'package:dartz/dartz.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/models/category.dart';
import 'package:metrocoffee/core/models/filter.dart';
import 'package:metrocoffee/core/models/product.dart';
import 'package:metrocoffee/core/models/product_detail.dart';
import 'package:metrocoffee/core/sources/remote_source.dart';

import 'product_service.dart';

class ProductServiceImpl extends ProductService {
  final RemoteSource _remoteSource;
  ProductServiceImpl(this._remoteSource);
  @override
  Future<Either<List<Category>, Failure>> getCatoriesList() async {
    var failureData =
        Failure(tag: "cateogory", message: "error retrieving category");

    try {
      List<Category> _actualList = [];
      var response = await _remoteSource.get("/api/category_list");
      if (response["data"] is List<dynamic>) {
        response["data"].forEach((element) {
          _actualList.add(Category.fromJson(element));
        });
      }
      return Left(_actualList);
    } on ServerException catch (e) {
      print("code: ${e.code} msg: ${e.message}");
      return Right(failureData);
    } catch (e) {
      print(e);
      return Right(failureData);
    }
  }

  @override
  Future<Either<CategoryProduct, Failure>> getProductForCategory({
    required int id,
  }) async {
    var failureData =
        Failure(tag: "menus: ", message: "error retrieving menus");
    try {
      var response = await _remoteSource.get("/api/cat_prod_list/$id");
      var results = CategoryProduct.fromJson(response);
      return Left(results);
    } on ServerException catch (e) {
      failureData.message = e.message;
      return Right(failureData);
    } catch (e) {
      print(e);
      return Right(failureData);
    }
  }

  @override
  Future<Either<ProductDetail, Failure>> getProductDetailWithId(int id) async {
    var failureData =
        Failure(tag: "product detail: ", message: "error retrieving details");
    try {
      var data = await _remoteSource.get(
        "/api/product_detail/$id",
      );
      var results = ProductDetail.fromJson(data);
      results.variants[0].selected = true;
      results.addons[0].selected = true;
      return Left(results);
    } on ServerException catch (e) {
      print("code: ${e.code} msg: ${e.message}");
      failureData.message = e.message;
      return Right(failureData);
    } catch (e) {
      print(e);
      return Right(failureData);
    }
  }

  @override
  Future<Either<FilterProduct, Failure>> getFilteredList(String filter) async {
    var failureData =
        Failure(tag: "product detail: ", message: "no product found");
    try {
      var data = await _remoteSource
          .get("/api/product_list_filter", queryParams: {"prod": filter});
      var results = FilterProduct.fromJson(data);
      return Left(results);
    } on ServerException catch (e) {
      print("code: ${e.code} msg: ${e.message}");
      failureData.message = e.message;
      return Right(failureData);
    } catch (e) {
      print(e);
      return Right(failureData);
    }
  }
}
