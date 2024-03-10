import 'dart:convert';

import 'package:edmas/models/product_model.dart';
import 'package:edmas/repositories/products/api_service.dart';
import 'package:edmas/utills/logger.dart';

class ProductsController {
  final Logger _logger = Logger.getLogger((ProductsController).toString());
  // This is the controller for the products
  // It will handle all the business logic

  // This function will fetch all the products from the server
  Future<List<ProductModel>> fetchProductList() async {
    try {
      return ProductApiService().fetchProducts().then((response) {
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          _logger.success(
              'Products fetched successfully: ${jsonResponse['message']}');

          var jsonData = jsonResponse['data'];

          _logger.success('Products: ${jsonData.length}');
          _logger.success('Products: ${jsonData}');

          List<ProductModel> products = (jsonData as List).map(
            (product) {
              return ProductModel.fromJson(product);
            },
          ).toList();

          return products;
        } else {
          _logger.error(
              'Failed to fetch products,status code: ${response.statusCode} ');
          return Future.error('Failed to fetch products');
        }
      });
    } catch (exception) {
      _logger.error('Request failed with error: $exception');
      return Future.error(exception);
    }
  }
}
