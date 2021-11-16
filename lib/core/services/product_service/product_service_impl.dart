import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/app_exceptions.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/models/product_detail_model.dart';
import 'package:metrocoffee/core/sources/source_impl/remote_source_impl.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import '../../config.dart';
import 'product_service.dart';

class ProductServiceImpl extends ProductService {
  var remoteSource = RemoteSourceImpl();

  @override
  Future handleProductsOfType({required String type}) async {
    // '$baseUrl/api/product', queryParameters: {"type": type}
    try {
      Map<String, dynamic> products = await remoteSource
          .get('$baseUrl/api/product', queryParams: {"type": type});
      Get.find<HomeTabController>().differentiateProductsType(type, products);
    } on ServerException catch (e) {
      throw ServerException(code: e.code, message: e.message);
    }
  }

  @override
  Future handleAllProducts() async {
    try {
      Map<String, dynamic> products =
          await remoteSource.get('$baseUrl/api/product');
      Get.find<HomeTabController>().differentiateProductsType("All", products);
    } on ServerException catch (e) {
      throw ServerException(code: e.code, message: e.message);
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
}
