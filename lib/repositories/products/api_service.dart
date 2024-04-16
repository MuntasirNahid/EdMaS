import 'dart:convert';
import 'dart:typed_data';

import 'package:edmas/global/global.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductApiService {
  ProductApiService._internal();
  static final ProductApiService _instance = ProductApiService._internal();

  factory ProductApiService() {
    return _instance;
  }

  Future<http.Response> fetchProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Uri url = Uri.parse(fetch_products_url);
    return await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<http.Response> addProducts({
    Uint8List? productImage,
    required String name,
    required String location,
    required String quantity,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Uri url = Uri.parse(add_products_url);

    var request = http.MultipartRequest('POST', url);

    request.fields['name'] = name;
    request.fields['quantity'] = quantity;
    request.fields['location'] = location;

    var file = productImage != null
        ? http.MultipartFile.fromBytes(
            'image',
            productImage,
            filename: '$productImage.jpg',
            contentType: MediaType('image', 'jpg'),
          )
        : http.MultipartFile.fromString('image', '');

    request.files.add(file);
    request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    request.headers['Authorization'] = 'Bearer $token';

    //request.files.add(file);

    var response = await request.send();

    return http.Response(response.statusCode.toString(), response.statusCode);

    // final responseData = await response.stream.bytesToString();
    //
    // final decodeResponse = jsonDecode(responseData);
    // print('printing decode response');
    //
    // print(decodeResponse['data'].toString());
    //
    // final user = UserModel.fromMap(decodeResponse['data']);
    //
    // print(user.name);
    // print(user.id);

    // print('{Hello we got status code: ${response.statusCode}}');
    //
    // if (response.statusCode == 201) {
    //   final responseData = await response.stream.bytesToString();
    //   final decodeResponse = jsonDecode(responseData);
    //   final user = UserModel.fromMap(decodeResponse['data']);
    //
    //   print(user.name);
    //   print(user.id);
    //   return 'success';
    // } else {
    //   var errorData = await response.stream.bytesToString();
    //   print('Error Response: $errorData');
    //   return 'An Error Occurred while registering user';
    // }

    // return await http.post(
    //   url,
    //   headers: {
    //     'Content-Type': 'application/json; charset=UTF-8',
    //     'Authorization': 'Bearer $token',
    //   },
    //   body: jsonEncode(
    //     <String, String>{
    //       'name': name,
    //       'location': location,
    //       'quantity': quantity,
    //     },
    //   ),
    // );
  }

  Future<http.Response> getAllShelf() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');
    Uri url = Uri.parse(all_shelf_url);
    return await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<http.Response> getSingleProductDetails({
    required String productId,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Uri url = Uri.parse('$single_product_details_url/$productId');

    return await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<http.Response> getCurrentBalance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Uri url = Uri.parse(get_curr_balance);

    return await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<http.Response> addIncomeOrExpense({
    required String type,
    required String amount,
    required String details,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Uri url = Uri.parse(add_income_expense_url);

    return await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
      },
      body: {
        'amount': amount,
        'type': type,
        'details': details,
      },
    );
  }

  Future<http.Response> getAllTransactions() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Uri url = Uri.parse(get_all_transaction_url);

    return await http.get(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<http.Response> updateProductDetails({
    required String productId,
    String? productName,
    String? productQuantity,
    String? productShelfId,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Uri url = Uri.parse('$update_product_details_url/$productId');

    var request = http.MultipartRequest('PATCH', url);

    if (productName != null) {
      request.fields['name'] = productName;
    }

    if (productQuantity != null) {
      request.fields['quantity'] = productQuantity;
    }

    if (productShelfId != null) {
      request.fields['location'] = productShelfId;
    }

    request.headers['Content-Type'] = 'application/json; charset=UTF-8';
    request.headers['Authorization'] = 'Bearer $token';

    //request.files.add(file);

    var response = await request.send();

    return http.Response(response.statusCode.toString(), response.statusCode);
  }

  Future<http.Response> deleteProduct({
    required String productId,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Uri url = Uri.parse('$delete_product_url/$productId');

    return await http.delete(
      url,
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $token',
      },
    );
  }

  Future<http.Response> sendApplication({
    required String type,
    required List<Map<String, dynamic>> items,
    required String body,
  }) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('token');

    Uri url = Uri.parse(send_application_url);

    return await http.post(
      url,
      headers: {
        'Authorization': 'Bearer $token',
        'Content-Type': 'application/json; charset=utf-8',
      },
      body: jsonEncode({
        "applicantId": "fc3d7f1d-1990-4543-a363-fd2ce7f3afbd",
        "applicationToId": "35269238-726d-4cf8-966c-71b0d2b28fa2",
        "type": type,
        "subject": "Request",
        "body": body,
        "items": items,
        "phase": "sent_to_store_manager"
      }),
    );
  }
}
