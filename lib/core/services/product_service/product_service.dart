abstract class ProductService {
  Future handleProductsOfType({required String type});
  Future handleAllProducts();
  Future handleProductDetail({required int id});
}
