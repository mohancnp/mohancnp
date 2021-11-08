class ProductDetail {
  int? id;
  dynamic price;
  String? name;
  String? imageUri;
  String? cautions;
  String? type;
  String? ingredients;
  bool? isFavorite;
  List<Variant>? allVariants;
  List<ProductOption>? options;
  List<ProductAddOn>? addons;
  ProductDetail.empty();
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
      this.addons,
      this.allVariants});

  factory ProductDetail.fromJson(Map<String, dynamic> prodMap) {
    //for each variants
    List<Variant> variantList = [];
    List<dynamic> list = prodMap['all_variants'];
    list.forEach((element) {
      variantList.add(Variant.fromJson(element));
    });

    //for each options
    List<dynamic> options = prodMap['product_options'];
    List<ProductOption> optionList = [];

    options.forEach((element) {
      optionList.add(ProductOption.fromJson(element));
    });

    //for each add ons
    List<dynamic> addons = prodMap['product_addons'];
    // print(addons);
    List<ProductAddOn> addonList = [];
    addons.forEach((element) {
      addonList.add(ProductAddOn.fromJson(element));
    });

    return ProductDetail(
        id: prodMap['id'],
        price: (prodMap['price'] ?? 0.0).toDouble(),
        name: prodMap['name'],
        imageUri: prodMap['image'],
        ingredients: prodMap['ingredients'],
        cautions: prodMap['cautions'],
        type: prodMap['type'],
        isFavorite: prodMap['is_favourite'],
        allVariants: variantList,
        addons: addonList,
        options: optionList);
  }
}

class Variant {
  int id, productId, stock = 0, position = 0, isDefault = 0;
  dynamic variantType;
  dynamic price;
  String sku, imageUri, name, productName;
  Variant.orderDetail(
    this.id,
    this.productId,
    this.name,
    this.sku,
    this.imageUri,
    this.productName,
  );
  Variant.dummy(
    this.id,
    this.productId,
    this.name,
    this.sku,
    this.imageUri,
    this.productName,
  );

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
        variantType: varMap['variant_type'] ?? 0,
        name: varMap['name'],
        sku: varMap['sku'],
        price: (varMap['price'] ?? 0.0).toDouble(),
        position: varMap['position'] ?? 0,
        isDefault: varMap['is_default'] ?? 0,
        productName: varMap['product_name'],
        stock: varMap['stock'] ?? 0);
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

  factory ProductOption.fromJson(Map<dynamic, dynamic> option) {
    List<dynamic> nestedOption = option['options'];
    List<String> productOption = [];
    nestedOption.forEach((element) {
      productOption.add(element);
    });
    return ProductOption(
      id: option['id'],
      name: option['name'],
      options: productOption,
      defaultValue: option['default'],
    );
  }
  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "options": this.options,
      "default": this.defaultValue
    };
  }
}

class ProductAddOn {
  int? id;
  String? image;
  String? name;
  dynamic cost;
  bool selected = false;

  ProductAddOn();

  factory ProductAddOn.fromJson(Map<dynamic, dynamic> map) {
    var newAddon = ProductAddOn();
    newAddon.id = map['id'];
    newAddon.image = map['image'];
    newAddon.cost = (map['cost'] ?? 0.0).toDouble();
    newAddon.name = map['name'];
    return newAddon;
  }
}
