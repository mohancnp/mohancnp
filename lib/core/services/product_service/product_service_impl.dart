import 'package:get/get.dart';
import 'package:metrocoffee/core/exceptions/server_exceptions.dart';
import 'package:metrocoffee/core/models/product_detail_model.dart';
import 'package:metrocoffee/core/sources/source_impl/remote_source_impl.dart';
import 'package:metrocoffee/modules/home/hometab_controller.dart';
import '../../config.dart';
import 'product_service.dart';

class ProductServiceImpl extends ProductService {
  @override
  Future handleProductsOfType({required String type}) async {
    // '$baseUrl/api/product', queryParameters: {"type": type}
    var remoteSource = RemoteSourceImpl();
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
    var remoteSource = RemoteSourceImpl();
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
    var remoteSource = RemoteSourceImpl();
    try {
      Map<String, dynamic> productDetail =
          await remoteSource.get('$baseUrl/api/product/$id');
      var prodObj = ProductDetail.fromJson(productDetail['data']);
      return prodObj;
    } on ServerException catch (e) {
      throw ServerException(code: e.code, message: e.message);
    }
  }
}
