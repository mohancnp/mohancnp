class CartModel {
  int productId, variantId, qty;
  double price;
  dynamic options, addons;
  String imageUri, name;
  double? updatedPrice;
  CartModel({
    required this.productId,
    required this.variantId,
    required this.qty,
    required this.price,
    required this.addons,
    required this.imageUri,
    required this.options,
    required this.name,
  });
  factory CartModel.fromJson(Map<String, dynamic> data) {
    return CartModel(
      productId: data["productId"],
      variantId: data["variantId"],
      qty: data["qty"],
      price: data["price"],
      name: data["name"],
      addons: data["addons"],
      options: data["options"],
      imageUri: data["imageUri"],
    );
  }
  Map<String, dynamic> toJson() {
    // if (this.addons.isNotEmpty) {
    //   maddons = this.addons.join();
    // }
    // if (this.options.isNotEmpty) {
    //   moptions = this.options.join();
    // }
    var orderData = {
      'variantId': this.variantId,
      'productId': this.productId,
      'qty': this.qty,
      'name': this.name,
      'imageUri': this.imageUri,
      'options': options.toString(),
      'addons': addons.toString(),
      'price': this.price,
    };
    return orderData;
  }
}
