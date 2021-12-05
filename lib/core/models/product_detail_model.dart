import 'package:json_annotation/json_annotation.dart';
part 'product_detail_model.g.dart';

@JsonSerializable()
class ProductDetail {
  @JsonKey(name: "product_id")
  int id;
  @JsonKey(name: "product_name")
  String name;
  @JsonKey(name: "short_description")
  String description;
  @JsonKey(name: "features_image")
  String image;
  List<Variant> variants;
  List<Topping> toppings;
  List<Addon> addons;
  @JsonKey(ignore: true)
  int qty;

  ProductDetail({
    required this.id,
    required this.name,
    required this.description,
    required this.image,
    required this.variants,
    required this.toppings,
    required this.addons,
    this.qty = 1,
  });
  factory ProductDetail.fromJson(Map<String, dynamic> json) =>
      _$ProductDetailFromJson(json);

  Map<String, dynamic> toJson() => _$ProductDetailToJson(this);
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
  String price;
  @JsonKey(ignore: true)
  bool selected = false;
  Topping(
      {required this.id,
      required this.name,
      required this.price,
      this.selected = false});
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
  Addon(
      {required this.id,
      required this.name,
      required this.image,
      required this.price,
      this.selected = false});
  factory Addon.fromJson(Map<String, dynamic> json) => _$AddonFromJson(json);

  Map<String, dynamic> toJson() => _$AddonToJson(this);
}
