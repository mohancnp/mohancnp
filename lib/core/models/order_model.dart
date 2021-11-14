import 'package:metrocoffee/core/models/product_detail_model.dart';

import 'address_model.dart';

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

class OrderHistory {
  int? id;
  int? userId;
  String? createdAt;
  int? orderProductsCount;
  String? orderImage;
  dynamic cost;
  OrderHistory();
  OrderHistory.create({
    this.id,
    this.userId,
    this.createdAt,
    this.orderProductsCount,
    this.orderImage,
    this.cost,
  });
  factory OrderHistory.fromJson(Map<String, dynamic> data) {
    var orderObj = OrderHistory.create(
      id: data['id'],
      userId: data["user_id"],
      createdAt: data["created_at"],
      orderProductsCount: data["order_products_count"],
      orderImage: data["order_image"],
      cost: data["cost"],
    );
    return orderObj;
  }
}

class OrderProduct {
  int? id, productVariantId, orderId, qty;
  dynamic cost;
  Variant? variant;
  OrderProduct();
  OrderProduct.create({
    this.id,
    this.productVariantId,
    this.orderId,
    this.qty,
    this.cost,
    this.variant,
  });
  factory OrderProduct.fromJson(Map<String, dynamic> data) {
    // print(data["product_variant"]);
    Variant v = Variant.fromJson(data["product_variant"]);
    var obj = OrderProduct.create(
      id: data["id"],
      productVariantId: data["product_variant_id"],
      orderId: data["order_id"],
      cost: data["cost"],
      qty: data["qty"],
      variant: v,
    );
    return obj;
  }
}

class OrderDetail {
  int? id;
  int? addressId;
  String? deliveryTimeFrom;
  String? deliveryTimeEnd;
  dynamic cost;
  String? createdAt;
  String? status;
  Address? address;
  List<OrderProduct>? orderProductList;
  OrderDetail({
    this.id,
    this.addressId,
    this.deliveryTimeFrom,
    this.deliveryTimeEnd,
    this.cost,
    this.createdAt,
    this.status,
    this.orderProductList,
    this.address,
  });

  factory OrderDetail.fromJson(Map<dynamic, dynamic> map) {
    Address? newAddress;
    if (map['address'] != null) {
      newAddress = Address.fromJson(map['address']);
    }
    List<dynamic> opds = map['order_products'];
    List<OrderProduct> usl = [];
    opds.forEach((element) {
      usl.add(OrderProduct.fromJson(element));
    });

    return OrderDetail(
      id: map['id'],
      addressId: map['address_id'],
      deliveryTimeEnd: map['delivery_time_end'],
      deliveryTimeFrom: map['delivery_time_from'],
      cost: map['cost'],
      createdAt: map['created_at'],
      status: map['status'],
      address: newAddress,
      orderProductList: usl,
    );
  }
}
