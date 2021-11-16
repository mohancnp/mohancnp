abstract class ProductService {
  Future handleProductsOfType({required String type});
  Future handleAllProducts();
  Future handleProductDetail({required int id});
  Future getFavoriteProducts();
  Future toggleFavoriteProduct({required int id});
}
