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
          _logger.success('Products fetched successfully');
          //will do fetching operation here. now going to class
        } else {
          _logger.error('Failed to fetch products');
          return Future.error('Failed to fetch products');
        }
      });
    } catch (exception) {
      _logger.error('Request failed with error: $exception');
      return Future.error(exception);
    }
  }
}
