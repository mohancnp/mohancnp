class Table {
  static const String user = "User";
  static const String cart = "product_cart";
}

class UserField {
  static const String userId = "id";
  static const String name = "name";
  static const String email = "email";
  static const String profilePic = "profile_pic";
  static const String phone = "phone";
  static const String gender = "gender";
  static const String status = "draft";
  static const String job = "job";
  static const String membershipNo = "membership_no";
  static const String points = "points";
}

class ProductCartField {
  static const String id = "id";
  static const String name = "name";
  static const String productId = "product_id";
  static const String totalPrice = "total_price";
  static const String selectedVariants = "selected_variants";
  static const String selectedProductType = "selected_product_type";
  static const String qty = "qty";
  static const String addons = "addons";
  static const String toppingsList = "toppings_list";
  static const String imageUri = "image_uri";
}

class SqlQuery {
  static const String cartTable = '''CREATE TABLE ${Table.cart} (
             ${ProductCartField.id} INTEGER PRIMARY KEY AUTOINCREMENT,
             ${ProductCartField.productId} INTEGER,
             ${ProductCartField.selectedProductType} TEXT,
             ${ProductCartField.selectedVariants} TEXT,
             ${ProductCartField.totalPrice} REAL,
             ${ProductCartField.addons} TEXT,
             ${ProductCartField.toppingsList} TEXT,
             ${ProductCartField.imageUri} TEXT,
             ${ProductCartField.qty} INTEGER,
             ${ProductCartField.name} TEXT)''';
  static const String countRows = '''SELECT COUNT(*) FROM ${Table.cart}''';
}
