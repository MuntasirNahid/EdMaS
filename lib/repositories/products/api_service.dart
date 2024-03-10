import 'package:edmas/global/global.dart';
import 'package:http/http.dart' as http;
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
}
