
class Product{
  int? id;
  String? name, image;
  int? price;

  Product(
      {this.id, this.name, this.image, this.price});

  factory Product.fromJson(Map<String, dynamic> data) {
    var productdetails=Product(
      id: data["id"],
      name: data["name"],
      image: data["image"],
      price: data["price"],
    );
    return productdetails;
  }

  }
