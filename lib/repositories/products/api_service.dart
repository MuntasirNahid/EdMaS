import 'package:edmas/global/global.dart';
import 'package:http/http.dart' as http;

class ProductApiService {
  ProductApiService._internal();
  static final ProductApiService _instance = ProductApiService._internal();

  factory ProductApiService() {
    return _instance;
  }

  Future<http.Response> fetchProducts() async {
    Uri url = Uri.parse(fetch_products_url);
    return await http.get(
      url,
    );
  }
}
