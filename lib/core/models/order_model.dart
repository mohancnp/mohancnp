class UserOrder {
  int productVariantId;
  int qty;
  List<String>? orderProductOptions = [];
  List<int>? orderProductAddons = [];
  double? amount;
  UserOrder(this.productVariantId, this.qty,
      [this.orderProductOptions, this.orderProductAddons]);
  UserOrder.local(
      {required this.productVariantId,
      required this.qty,
      this.orderProductAddons,
      this.orderProductOptions,
      this.amount});

  Map<String, dynamic> toJson() {
    // Map<String, dynamic> options;
    // Map<String, dynamic> addons;

    var a = {
      "product_variant_id": this.productVariantId,
      "qty": this.qty,
      "order_product_options": this.orderProductOptions,
      "order_product_addons": this.orderProductAddons,
    };
    return a;
  }
}

class RemoteOrder {
  int? adressId;
  String? deliveryTimeFrom;
  String? deliveryTimeEnd;
  List<UserOrder>? orderProducts;
  RemoteOrder.empty();
  RemoteOrder({
    this.adressId,
    required this.deliveryTimeFrom,
    required this.deliveryTimeEnd,
    required this.orderProducts,
  });

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> listOfOrderProduct = [];
    this.orderProducts?.forEach((element) {
      listOfOrderProduct.add(element.toJson());
    });
    var remoteOrder = {
      "address_id": this.adressId,
      "delivery_time_from": this.deliveryTimeFrom,
      "delivery_time_end": this.deliveryTimeEnd,
      "order_products": listOfOrderProduct,
    };
    return remoteOrder;
  }
}
