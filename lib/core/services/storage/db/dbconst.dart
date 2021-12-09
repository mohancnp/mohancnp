class Table {
  static const String user = "User";
  static const String cart = "product_cart";
}

class UserFeild {
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

class ProductCartFeild {
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

class sqlQuery {
  static const String userTable = '''CREATE TABLE ${Table.user} (
             ${UserFeild.userId} INTEGER PRIMARY KEY AUTOINCREMENT,
             ${UserFeild.name} TEXT,${UserFeild.points} REAL,${UserFeild.email} TEXT,${UserFeild.membershipNo} TEXT, ${UserFeild.job} TEXT,
             ${UserFeild.gender} TEXT, ${UserFeild.status} TEXT, ${UserFeild.phone} TEXT, ${UserFeild.profilePic} TEXT)''';
  static const String cartTable = '''CREATE TABLE ${Table.cart} (
             ${ProductCartFeild.id} INTEGER PRIMARY KEY AUTOINCREMENT,
             ${ProductCartFeild.productId} INTEGER,
             ${ProductCartFeild.selectedProductType} TEXT,
             ${ProductCartFeild.selectedVariants} TEXT,
             ${ProductCartFeild.totalPrice} REAL,
             ${ProductCartFeild.addons} TEXT,
             ${ProductCartFeild.toppingsList} TEXT,
             ${ProductCartFeild.imageUri} TEXT,
             ${ProductCartFeild.qty} INTEGER,
             ${ProductCartFeild.name} TEXT)''';
  static const String countRows = '''SELECT COUNT(*) FROM ${Table.cart}''';
}
