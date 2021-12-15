import 'package:json_annotation/json_annotation.dart';
part 'product.g.dart';

@JsonSerializable()
class CategoryProduct {
  List<Product> products;
  @JsonKey(name: "most_popular_products", includeIfNull: false)
  List<Product> mostPopularProducts;
  CategoryProduct({required this.products, required this.mostPopularProducts});

  factory CategoryProduct.fromJson(Map<String, dynamic> json) =>
      _$CategoryProductFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryProductToJson(this);
}

@JsonSerializable()
class Product {
  int id;
  @JsonKey(name: "product_name")
  String productName;
  @JsonKey(name: "product_price")
  double productPrice;
  @JsonKey(name: "features_image")
  String featuresImage;
  Product({
    required this.id,
    required this.productName,
    required this.productPrice,
    required this.featuresImage,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
