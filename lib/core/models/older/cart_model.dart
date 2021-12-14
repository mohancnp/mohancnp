
// class CartModel {
//   int productId, variantId, qty;
//   double price;
//   String options, addons;
//   String imageUri, name;
//   double? updatedPrice;
//   String size;
//   String extras;
//   CartModel(
//       {required this.productId,
//       required this.variantId,
//       required this.qty,
//       required this.price,
//       required this.addons,
//       required this.imageUri,
//       required this.options,
//       required this.name,
//       required this.extras,
//       required this.size});
//   factory CartModel.fromJson(Map<String, dynamic> data) {
//     return CartModel(
//       productId: data[CartFeild.productId],
//       variantId: data[CartFeild.variantId],
//       qty: data[CartFeild.qty],
//       price: data[CartFeild.price],
//       name: data[CartFeild.name],
//       addons: data[CartFeild.addons],
//       size: data[CartFeild.size],
//       options: data[CartFeild.options],
//       imageUri: data[CartFeild.imageUri],
//       extras: data[CartFeild.extras],
//     );
//   }
//   Map<String, dynamic> toJson() {
//     var orderData = {
//       CartFeild.variantId: this.variantId,
//       CartFeild.productId: this.productId,
//       CartFeild.qty: this.qty,
//       CartFeild.name: this.name,
//       CartFeild.imageUri: this.imageUri,
//       CartFeild.options: this.options,
//       CartFeild.addons: this.addons,
//       CartFeild.price: this.price,
//       CartFeild.extras: this.extras,
//       CartFeild.size: this.size,
//     };
//     return orderData;
//   }
// }
