import 'package:dio/dio.dart';
import 'package:metrocoffee/services/dioerror_catcher.dart';
import 'package:metrocoffee/services/localstorage/sharedpref/membership.dart';
import 'package:metrocoffee/services/rest/config.dart';

class AddressService {
  AddressService._instance();

  static final AddressService _productService = AddressService._instance();

  factory AddressService.getInstance() {
    return _productService;
  }

  var dio = Dio(options);

  Future addOrder(data) async {
    var token = await getToken();
    dio.options.headers["Authorization"] = "Bearer $token";
    dio.options.headers["Accept"] = "application/json";
    if (token == null) {
      print("token cannot be verifed");
      return null;
    } else {
      try {
        var afterOrder = await dio.post(
          '$baseUrl/api/order',
          data: data,
        );
        if (afterOrder.statusCode == 200)
          return afterOrder.data;
        else
          return null;
      } on DioError catch (e) {
        catchAndPrintDioError(e);
      }
      return null;
    }
  }

  Future getAddresses() async {
    var token = await getToken();
    if (token == null) {
      print("token cannot be verifed");
      return;
    } else {
      try {
        dio.options.headers["Authorization"] = "Bearer $token";
        var addresses = await dio.get('$baseUrl/api/address');
        if (addresses.statusCode == 200) {
          return addresses.data;
        }
        return null;
      } on DioError catch (e) {
        catchAndPrintDioError(e);
      }
    }
    return null;
  }

  Future addAddress(dynamic addressToAdd) async {
    print("data received for send: $addressToAdd");
    var token = await getToken();
    if (token == null) {
      print("token cannot be verifed");
      return false;
    } else {
      try {
        dio.options.headers["Authorization"] = "Bearer $token";
        dio.options.headers["Content-Type"] =
            "application/x-www-form-urlencoded";
        var response =
            await dio.post('$baseUrl/api/address', data: addressToAdd);
        if (response.statusCode == 200) {
          return true;
        } else
          return false;
      } on DioError catch (e) {
        catchAndPrintDioError(e);
      }
    }
    return false;
  }

  Future removeAddress(int id) async {
    var token = await getToken();
    if (token == null) {
      print("token cannot be verifed");
      return false;
    } else {
      try {
        dio.options.headers["Authorization"] = "Bearer $token";
        var response = await dio.delete('$baseUrl/api/address/$id');
        if (response.statusCode == 200) {
          return true;
        } else
          return false;
      } on DioError catch (e) {
        catchAndPrintDioError(e);
      }
    }
    return false;
  }

  Future updateAdderss(int id, Map<String, dynamic> data) async {
    var token = await getToken();
    if (token == null) {
      print("token cannot be verifed");
      return false;
    } else {
      try {
        dio.options.headers["Authorization"] = "Bearer $token";
        var response = await dio.put('$baseUrl/api/address/$id', data: data);
        if (response.statusCode == 200) {
          return true;
        } else
          return false;
      } on DioError catch (e) {
        catchAndPrintDioError(e);
      }
    }
    return false;
  }

}
