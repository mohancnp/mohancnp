class ProductDetail {
  int id;
  dynamic price;
  String name;
  String imageUri;
  String? cautions;
  String type;
  String? ingredients;
  List<Variant>? allVariants;

  ProductDetail(
      {required this.id,
      required this.price,
      required this.name,
      required this.imageUri,
      required this.cautions,
      required this.ingredients,
      required this.type,
      required this.allVariants});

  factory ProductDetail.fromJson(Map<String, dynamic> prodMap) {
    List<Variant> variantList = [];
    List<dynamic> list = prodMap['all_variants'];

    list.forEach((element) {
      variantList.add(Variant.fromJson(element));
    });

    return ProductDetail(
      id: prodMap['id'],
      price: prodMap['price'],
      name: prodMap['name'],
      imageUri: prodMap['image'],
      ingredients: prodMap['ingredients'],
      cautions: prodMap['cautions'],
      type: prodMap['type'],
      allVariants: variantList,
    );
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
