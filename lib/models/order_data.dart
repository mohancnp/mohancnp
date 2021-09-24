class OrderData {
  int orderCount;
  String orderImage;
  String createdAt;
  int id;
  dynamic cost;
  int userId;

  OrderData.create(
      {required this.orderCount,
      required this.orderImage,
      required this.cost,
      required this.createdAt,
      required this.id,
      required this.userId});

  factory OrderData.fromJson(Map<dynamic, dynamic> data) {
    return OrderData.create(
        orderCount: data['order_products_count'],
        orderImage: data["order_image"],
        cost: data['cost'],
        createdAt: data['created_at'],
        id: data['id'],
        userId: data['user_id']);
  }
}
