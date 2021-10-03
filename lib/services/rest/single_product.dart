import 'package:dio/dio.dart';
import 'config.dart';

class SingleProductService {
  SingleProductService._instance();

  static final SingleProductService _productService =
      SingleProductService._instance();

  factory SingleProductService.getInstance() {
    return _productService;
  }

  var dio = Dio(options);

  Future toggleFavoriteStatus({required int id}) async {
    bool toggled = false;

    var response = await dio.post('$baseUrl/api/favourite/$id');
    if (response.statusCode == 200) {
      if (response.data["success"] == true) {
        if (response.data["message"] == "Product favourited.") {
          toggled = true;
        } else {
          toggled = false;
        }
      }
    }
    return toggled;
    // print(toggled);
  }
}
