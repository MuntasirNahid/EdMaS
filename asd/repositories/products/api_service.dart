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
}
