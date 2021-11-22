import 'package:json_annotation/json_annotation.dart';

part 'new_product_model.g.dart';

@JsonSerializable()
class NewProduct {
  List<SingleProduct> products;
  @JsonKey(name: "most_popular", includeIfNull: false)
  List<SingleProduct>? mostPopular;
  @JsonKey(includeIfNull: false)
  List<SingleProduct>? recommendation;
  NewProduct({
    required this.products,
    this.mostPopular,
    this.recommendation,
  });
  NewProduct.all(
      {required this.products, this.mostPopular, this.recommendation});

  factory NewProduct.fromJson(Map<String, dynamic> json) =>
      _$NewProductFromJson(json);

  Map<String, dynamic> toJson() => _$NewProductToJson(this);


  @override
  String toString() =>
      'NewProduct(products: $products, mostPopular: $mostPopular, recommendation: $recommendation)';

}

@JsonSerializable()
class SingleProduct {
  int id;
  String name;
  String? image;
  double price;
  @JsonKey(name: "is_favourite")
  bool isFavorite;
  SingleProduct({
    required this.id,
    required this.name,
    required this.price,
    required this.isFavorite,
    required this.image,
  });
  factory SingleProduct.fromJson(Map<String, dynamic> json) =>
      _$SingleProductFromJson(json);
  Map<String, dynamic> toJson() => _$SingleProductToJson(this);

  SingleProduct copyWith({
    int? id,
    String? name,
    double? price,
    bool? isFavorite,
  }) {
    return SingleProduct(
      id: id ?? this.id,
      name: name ?? this.name,
      price: price ?? this.price,
      image: image?? this.image,
      isFavorite: isFavorite ?? this.isFavorite,
    );
  }

  @override
  String toString() {
    return 'SingleProduct(id: $id, name: $name, price: $price, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is SingleProduct &&
        other.id == id &&
        other.name == name &&
        other.price == price &&
        other.isFavorite == isFavorite;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ price.hashCode ^ isFavorite.hashCode;
  }
}
