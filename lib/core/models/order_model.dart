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
}
