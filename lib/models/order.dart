class Order {
  dynamic addressId;
  String? deliveryTimeFrom, deliveryTimeEnd;

  List<OrderProducts>? orderProductList = [];

  Order();

  Order.make(
      {this.addressId,
      required this.deliveryTimeFrom,
      required this.deliveryTimeEnd,
      required this.orderProductList});

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = new Map<dynamic, dynamic>();
    List<Map<dynamic, dynamic>> orderlist = [];

    orderProductList?.forEach((OrderProducts element) {
      OrderProducts orderProducts = OrderProducts();
      orderProducts.qty = element.qty;
      orderProducts.productVariantId = element.productVariantId;
      orderProducts.orderProductOptions = element.orderProductOptions;
      orderProducts.orderProductAddons = element.orderProductAddons;
      var map = orderProducts.toJson();
      orderlist.add(map);
    });

    data['address_id'] = this.addressId;
    data['delivery_time_from'] = this.deliveryTimeFrom;
    data['delivery_time_end'] = this.deliveryTimeEnd;
    data['order_products'] = orderlist;
    return data;
  }
}

class OrderProducts {
  dynamic productVariantId;
  int qty = 1;
  bool? addedToCart=false;
  List<dynamic>? orderProductOptions = [];
  List<dynamic>? orderProductAddons = [];

  Map<dynamic, dynamic> toJson() {
    return {
      'product_variant_id': this.productVariantId,
      'qty': this.qty,
      'order_product_options': this.orderProductOptions,
      'order_product_addons': this.orderProductAddons,
    };
  }
}
