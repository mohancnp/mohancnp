abstract class CartService {
  Future<int> addProductToCart(Map<String, dynamic> product);
  Future<List<Map<String, dynamic>>> getCartProducts();
  Future removeProductWithId(int id);
  Future<int> clearCart();
}
