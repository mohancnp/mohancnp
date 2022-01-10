import 'package:json_annotation/json_annotation.dart';

part 'product_detail.g.dart';

@JsonSerializable()
class ProductDetail {
  Product product;
  @JsonKey(name: "varients")
  List<Variant> variants;
  List<Topping> toppings;

  @JsonKey(name: "product_type")
  List<ProductType> productTypes;

  @JsonKey(name: "addons_extras")
  List<Addon> addons;

  ProductDetail({
    required this.variants,
    required this.toppings,
    required this.addons,
    required this.product,
    required this.productTypes,
  });
  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
}

@JsonSerializable()
class ProductType {
  @JsonKey(name: "product_type_id")
  int id;
  String name;
  double price;
  @JsonKey(ignore: true)
  bool selected;
  ProductType({
    required this.id,
    required this.name,
    required this.price,
    this.selected = false,
  });
  factory ProductType.fromJson(Map<String, dynamic> json) =>
      _$ProductTypeFromJson(json);

  Map<String, dynamic> toJson() => _$ProductTypeToJson(this);
}

@JsonSerializable()
class Product {
  @JsonKey(name: "product_id")
  int id;
  @JsonKey(name: "product_name")
  String name;
  @JsonKey(name: "short_description")
  String description;
  @JsonKey(name: "features_image")
  String image;
  @JsonKey(ignore: true)
  int qty;
  Product({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    this.qty = 1,
  });
  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}

@JsonSerializable()
class Variant {
  @JsonKey(name: "product_id")
  int productId;
  double price;
  @JsonKey(name: "product_attribute_id")
  int productAttributeId;
  @JsonKey(name: "product_size")
  String size;
  @JsonKey(ignore: true)
  bool selected;

  Variant({
    required this.productId,
    required this.price,
    required this.productAttributeId,
    required this.size,
    this.selected = false,
  });
  factory Variant.fromJson(Map<String, dynamic> json) =>
      _$VariantFromJson(json);

  Map<String, dynamic> toJson() => _$VariantToJson(this);
}

@JsonSerializable()
class Topping {
  @JsonKey(name: "topping_id")
  int id;
  String name;
  double price;
  @JsonKey(ignore: true)
  bool selected = false;
  Topping({
    required this.id,
    required this.name,
    required this.price,
    this.selected = false,
  });
  factory Topping.fromJson(Map<String, dynamic> json) =>
      _$ToppingFromJson(json);

  Map<String, dynamic> toJson() => _$ToppingToJson(this);
}

@JsonSerializable()
class Addon {
  @JsonKey(name: "addons_extra_id")
  int id;
  String name;
  String image;
  double price;
  @JsonKey(ignore: true)
  bool selected = false;
  Addon({
    required this.id,
    required this.name,
    required this.image,
    required this.price,
    this.selected = false,
  });
  factory Addon.fromJson(Map<String, dynamic> json) => _$AddonFromJson(json);

  Map<String, dynamic> toJson() => _$AddonToJson(this);

  @override
  String toString() {
    return 'Addon(id: $id, name: $name, image: $image, price: $price, selected: $selected)';
  }
}
