import 'package:json_annotation/json_annotation.dart';
part 'product_model.g.dart';

@JsonSerializable()
class Product {
  int id;
  @JsonKey(name: "product_name")
  String productName;
  @JsonKey(name: "product_price")
  double productPrice;
  @JsonKey(name: "features_image")
  String productImage;
  Product(this.id, this.productName, this.productPrice, this.productImage);
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
