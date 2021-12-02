import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:metrocoffee/core/constants/placeholder_json.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/exceptions/dio_exceptions.dart';
import 'package:metrocoffee/core/exceptions/failure.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/models/category.dart';
import 'package:metrocoffee/core/models/product_detail_model.dart';
import 'package:metrocoffee/core/models/product_model.dart';
import 'package:metrocoffee/core/sources/source_impl/remote_source_impl.dart';

import '../../config.dart';
import 'product_service.dart';

class ProductServiceImpl extends ProductService {
  var remoteSource = RemoteSourceImpl();

  @override
  Future handleProductsOfType({required String type}) async {
    try {
      Map<String, dynamic> products = await remoteSource
          .get('$baseUrl/api/product', queryParams: {"type": type});
      return products;
    } on ServerException catch (e) {
      throw AppException(message: e.message);
    }
  }

  @override
  Future handleAllProducts() async {
    try {
      Map<String, dynamic> products =
          await remoteSource.get('$baseUrl/api/product');
      return products;
    } on ServerException catch (e) {
      throw AppException(message: e.message);
    }
  }

  @override
  Future handleProductDetail({required int id}) async {
    try {
      Map<String, dynamic> productDetail =
          await remoteSource.get('$baseUrl/api/product/$id');
      var prodObj = ProductDetail.fromJson(productDetail['data']);
      return prodObj;
    } on ServerException catch (e) {
      throw ServerException(code: e.code, message: e.message);
    }
  }

  @override
  Future getFavoriteProducts() async {
    try {
      var products = await remoteSource.get('$baseUrl/api/favourite');
      return products;
    } on ServerException catch (e) {
      throw (AppException(message: e.message));
    }
  }

  @override
  Future toggleFavoriteProduct({required int id}) async {
    try {
      var products = await remoteSource.post('$baseUrl/api/favourite/$id');
      return products;
    } on ServerException catch (e) {
      throw (AppException(message: e.message));
    }
  }

  @override
  Future getPublicProducts() async {
    try {
      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZGZkODgxMDc0MmVjMWQ0YzU1YWJkNGQ4MDYxM2E5YjYxYWNjZDc3OTNiNTBmNzA1NzgyN2ZhNTg2NWQxZjA5MWJmNmY4NTgxMjM4MWUyNzIiLCJpYXQiOjE2MzUyNjgyNzMuODgyNzcyLCJuYmYiOjE2MzUyNjgyNzMuODgyODIxLCJleHAiOjE2NjY4MDQyNzMuODc5NTk2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.mHPXsWSDaFiqNFYZLAtEhiFxdldBDE0W4IXYCg-n4HcG9sr9yZud9PoOKvXnV4qFl-eWECReojYeIOTle_r-5C0D9q93c5sqvv7b3lyzWQUNvP4NuP8EqpjbZm9b3nChZpR_VFSqwPBFYjz8S8cHwAQaGlgI78-k3O3SN7iUUVsn2rZBlE109GfG4B0hai5NsSj0RJtHoR79Pic7DXLWt1aLCYybVo3Bm7l70dLLJF5qlmDZwKB6H8rOHMsyJaZzsDMovECaYkowfndeW8p5vguBXgwwIG81rxTPUXVThkTcsYmglkaRZI1HF9MWSvblyeOiQr26-KMOHznejAauNzfY0c0k3cpMqoS89fQ024mVxeZHYm9loN_YSrYVjXKcFzqEBaHz8-_5XTcwZJKU-LVLjUMa_jq0cLvey4GDZoH6Z36exDGD3eqsYvXE6Buih4vfzPalyP-UxAZp_7woGVlgH-d0SViT9Zpw0OZuaCbhkQvABCK-izpm32ndJnRCUwmA5tBELwFE7saOrUHhY08C6XXnmtDDRUMy2-tezPjj4B32vvzJPn9iJgW1oXuFRD19xL9yvoA2aA4rHAcb4QNke7wXadeASFhA0U6-mbyO2vqxJoBTinzZgJonBllhbottq7sev6jFQoM3IzQU9kwQ_NHkn7g8COP7DjKzq9E";
      dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      var products = await dio.get('$baseUrl/api/product');
      if (products.data is Map<String, dynamic>) {
        return products.data;
      } else {
        return {"data": products.data};
      }
    } on DioError catch (e) {
      throw getServerException(e);
    }
  }

  @override
  Future getPublicProductsOfType({required String type}) async {
    try {
      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZGZkODgxMDc0MmVjMWQ0YzU1YWJkNGQ4MDYxM2E5YjYxYWNjZDc3OTNiNTBmNzA1NzgyN2ZhNTg2NWQxZjA5MWJmNmY4NTgxMjM4MWUyNzIiLCJpYXQiOjE2MzUyNjgyNzMuODgyNzcyLCJuYmYiOjE2MzUyNjgyNzMuODgyODIxLCJleHAiOjE2NjY4MDQyNzMuODc5NTk2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.mHPXsWSDaFiqNFYZLAtEhiFxdldBDE0W4IXYCg-n4HcG9sr9yZud9PoOKvXnV4qFl-eWECReojYeIOTle_r-5C0D9q93c5sqvv7b3lyzWQUNvP4NuP8EqpjbZm9b3nChZpR_VFSqwPBFYjz8S8cHwAQaGlgI78-k3O3SN7iUUVsn2rZBlE109GfG4B0hai5NsSj0RJtHoR79Pic7DXLWt1aLCYybVo3Bm7l70dLLJF5qlmDZwKB6H8rOHMsyJaZzsDMovECaYkowfndeW8p5vguBXgwwIG81rxTPUXVThkTcsYmglkaRZI1HF9MWSvblyeOiQr26-KMOHznejAauNzfY0c0k3cpMqoS89fQ024mVxeZHYm9loN_YSrYVjXKcFzqEBaHz8-_5XTcwZJKU-LVLjUMa_jq0cLvey4GDZoH6Z36exDGD3eqsYvXE6Buih4vfzPalyP-UxAZp_7woGVlgH-d0SViT9Zpw0OZuaCbhkQvABCK-izpm32ndJnRCUwmA5tBELwFE7saOrUHhY08C6XXnmtDDRUMy2-tezPjj4B32vvzJPn9iJgW1oXuFRD19xL9yvoA2aA4rHAcb4QNke7wXadeASFhA0U6-mbyO2vqxJoBTinzZgJonBllhbottq7sev6jFQoM3IzQU9kwQ_NHkn7g8COP7DjKzq9E";
      dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      var products = await dio
          .get('$baseUrl/api/product', queryParameters: {"type": type});
      if (products.data is Map<String, dynamic>) {
        return products.data;
      } else {
        return {"data": products.data};
      }
    } on DioError catch (e) {
      throw getServerException(e);
    }
  }

  @override
  Future getPublicProductDetail({required int id}) async {
    try {
      var token =
          "eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIzIiwianRpIjoiZGZkODgxMDc0MmVjMWQ0YzU1YWJkNGQ4MDYxM2E5YjYxYWNjZDc3OTNiNTBmNzA1NzgyN2ZhNTg2NWQxZjA5MWJmNmY4NTgxMjM4MWUyNzIiLCJpYXQiOjE2MzUyNjgyNzMuODgyNzcyLCJuYmYiOjE2MzUyNjgyNzMuODgyODIxLCJleHAiOjE2NjY4MDQyNzMuODc5NTk2LCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.mHPXsWSDaFiqNFYZLAtEhiFxdldBDE0W4IXYCg-n4HcG9sr9yZud9PoOKvXnV4qFl-eWECReojYeIOTle_r-5C0D9q93c5sqvv7b3lyzWQUNvP4NuP8EqpjbZm9b3nChZpR_VFSqwPBFYjz8S8cHwAQaGlgI78-k3O3SN7iUUVsn2rZBlE109GfG4B0hai5NsSj0RJtHoR79Pic7DXLWt1aLCYybVo3Bm7l70dLLJF5qlmDZwKB6H8rOHMsyJaZzsDMovECaYkowfndeW8p5vguBXgwwIG81rxTPUXVThkTcsYmglkaRZI1HF9MWSvblyeOiQr26-KMOHznejAauNzfY0c0k3cpMqoS89fQ024mVxeZHYm9loN_YSrYVjXKcFzqEBaHz8-_5XTcwZJKU-LVLjUMa_jq0cLvey4GDZoH6Z36exDGD3eqsYvXE6Buih4vfzPalyP-UxAZp_7woGVlgH-d0SViT9Zpw0OZuaCbhkQvABCK-izpm32ndJnRCUwmA5tBELwFE7saOrUHhY08C6XXnmtDDRUMy2-tezPjj4B32vvzJPn9iJgW1oXuFRD19xL9yvoA2aA4rHAcb4QNke7wXadeASFhA0U6-mbyO2vqxJoBTinzZgJonBllhbottq7sev6jFQoM3IzQU9kwQ_NHkn7g8COP7DjKzq9E";
      dio.options.headers[HttpHeaders.authorizationHeader] = 'Bearer $token';
      var productDetail = await dio.get('$baseUrl/api/product/$id');
      if (productDetail.data is Map<String, dynamic>) {
        var prodObj = ProductDetail.fromJson(productDetail.data['data']);
        return prodObj;
      }
      return null;
    } on ServerException catch (e) {
      throw ServerException(code: e.code, message: e.message);
    }
  }

  @override
  Future<Either<List<Category>, Failure>> getCatoriesList() async {
    var failureData =
        Failure(tag: "cateogory", message: "error retrieving category");

    try {
      List<Category> _actualList = [];

      var results = await Future.delayed(Duration(seconds: 2)).then((value) {
        if (categoryListDummy is List<Map<String, dynamic>>) {
          categoryListDummy.forEach((element) {
            _actualList.add(Category.fromJson(element));
          });
          return _actualList;
        } else {
          return <Category>[];
        }
      });
      return Left(results);
    } on ServerException catch (e) {
      print(e.message);
      return Right(failureData);
    } catch (e) {
      print(e);
      return Right(failureData);
    }
  }

  @override
  Future<Either<List<Product>, Failure>> getProductForCategory({
    required int id,
  }) async {
    var failureData =
        Failure(tag: "menus: ", message: "error retrieving menus");
    try {
      List<Product> _actualList = [];

      var results = await Future.delayed(Duration(seconds: 2)).then((value) {
        if (productListDummy is List<Map<String, dynamic>>) {
          productListDummy.forEach((element) {
            _actualList.add(Product.fromJson(element));
          });
          return _actualList;
        } else {
          return <Product>[];
        }
      });
      return Left(results);
    } on ServerException catch (e) {
      // print(e.message);
      failureData.message = e.message;
      return Right(failureData);
    } catch (e) {
      print(e);
      return Right(failureData);
    }
  }
}
