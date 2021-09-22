class Product {
  int id;
  String name, image;
  dynamic price;


  Product(
      {required this.id,
      required this.name,
      required this.image,
      required this.price});

  factory Product.fromJson(Map<String, dynamic> data) {
    var productdetails = Product(
      id: data["id"],
      name: data["name"],
      image: data["image"],
      price: data["price"],
    );
    return productdetails;
  }
}
