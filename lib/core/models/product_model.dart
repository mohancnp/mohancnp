class Product {
  int id;
  String name, image;
  dynamic price;
  bool isFavorite;
  dynamic type;
  Product(
      {required this.id,
      required this.name,
      required this.image,
      this.type,
      required this.isFavorite,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> data) {
    var productdetails = Product(
        id: data["id"],
        name: data["name"],
        image: data["image"],
        type: data["type"],
        price: data["price"] as num,
        isFavorite: data["is_favourite"]);
    return productdetails;
  }
}
