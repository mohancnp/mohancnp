class ProductDetail {
  int id;
  dynamic price;
  String name;
  String? imageUri;
  String? cautions;
  String type;
  String? ingredients;
  bool isFavorite;
  List<Variant>? allVariants;
  List<ProductOption>? options;

  ProductDetail(
      {required this.id,
      required this.price,
      required this.name,
      this.imageUri,
      this.cautions,
      this.ingredients,
      required this.isFavorite,
      this.options,
      required this.type,
      this.allVariants});

  factory ProductDetail.fromJson(Map<String, dynamic> prodMap) {
    List<Variant> variantList = [];
    List<ProductOption> optionList = [];
    List<dynamic> list = prodMap['all_variants'];
    List<dynamic> options = prodMap['product_options'];
    list.forEach((element) {
      variantList.add(Variant.fromJson(element));
    });
    options.forEach((element) {
      optionList.add(ProductOption.fromJson(element));
    });
    return ProductDetail(
        id: prodMap['id'],
        price: prodMap['price'],
        name: prodMap['name'],
        imageUri: prodMap['image'],
        ingredients: prodMap['ingredients'],
        cautions: prodMap['cautions'],
        type: prodMap['type'],
        isFavorite: prodMap['is_favourite'],
        allVariants: variantList,
        options: optionList);
  }
}

class Variant {
  int id, productId, variantType, stock, position, isDefault;
  dynamic price;
  String sku, imageUri, name, productName;

  Variant(
      {required this.id,
      required this.productId,
      required this.variantType,
      required this.stock,
      required this.position,
      required this.isDefault,
      required this.sku,
      required this.imageUri,
      required this.name,
      required this.productName,
      required this.price});

  factory Variant.fromJson(Map<String, dynamic> varMap) {
    return Variant(
        id: varMap['id'],
        imageUri: varMap['image'],
        productId: varMap['product_id'],
        variantType: varMap['variant_type'],
        name: varMap['name'],
        sku: varMap['sku'],
        price: varMap['price'],
        position: varMap['position'],
        isDefault: varMap['is_default'],
        productName: varMap['product_name'],
        stock: varMap['stock']);
  }
}

class ProductOption {
  int id;
  String name;
  List<String> options;
  String? defaultValue;

  ProductOption(
      {required this.id,
      required this.name,
      required this.options,
      this.defaultValue});

  factory ProductOption.fromJson(Map<String, dynamic> option) {
    List<dynamic> nestedOption = option['options'];
    List<String> stringOption = [];
    nestedOption.forEach((element) {
      stringOption.add(element);
    });
    return ProductOption(
      id: option['id'],
      name: option['name'],
      options: stringOption,
      defaultValue: option['default'],
    );
  }
}

class ProductAddOn {}
