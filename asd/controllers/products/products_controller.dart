import 'dart:convert';
import 'dart:typed_data';

import 'package:edmas/models/location_model.dart';
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

  Future<String> addProduct({
    Uint8List? image,
    required String name,
    required String location,
    required String quantity,
  }) async {
    try {
      return ProductApiService()
          .addProducts(
        productImage: image,
        name: name,
        location: location,
        quantity: quantity,
      )
          .then((response) {
        // var jsonResponse = jsonDecode(response.body);
        // _logger.debug('Response: ${jsonResponse['error']} ');
        if (response.statusCode == 201) {
          //  var jsonResponse = jsonDecode(response.body);
          _logger.success("Products Added Successfully");
          // _logger.success(
          //     'Product added successfully: ${jsonResponse['message']}');
          return 'Product added successfully';
        } else {
          _logger.error(
              'Failed to add product,status code: ${response.statusCode} ');
          return 'Failed to add product';
        }
      });
    } catch (exception) {
      _logger.error('Request failed with error: $exception');
      return 'Failed to add product exception';
    }
  }

  Future<List<LocationModel>> getAllShelf() async {
    try {
      return ProductApiService().getAllShelf().then((response) {
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          _logger.success(
              'Shelf fetched successfully: ${jsonResponse['message']}');

          var jsonData = jsonResponse['data'];

          _logger.success('Shelf: ${jsonData.length}');
          _logger.success('Shelf: ${jsonData}');

          List<LocationModel> shelf = (jsonData as List).map(
            (shelf) {
              return LocationModel.fromJson(shelf);
            },
          ).toList();

          return shelf;
        } else {
          _logger.error(
              'Failed to fetch shelf,status code: ${response.statusCode} ');
          return Future.error('Failed to fetch shelf');
        }
      });
    } catch (exception) {
      _logger.error('Request failed with error: $exception');
      return Future.error(exception);
    }
  }

  Future<ProductModel> getSingleProductDetails({
    required String productId,
  }) async {
    try {
      return ProductApiService()
          .getSingleProductDetails(productId: productId)
          .then((response) {
        if (response.statusCode == 200) {
          var jsonResponse = jsonDecode(response.body);
          _logger.success("Single Product Details fetched successfully");
          var jsonData = jsonResponse['data'];

          return ProductModel.fromJson(jsonData);
        } else {
          _logger.error(
              'Failed to fetch single product details,status code: ${response.statusCode} ');
          return Future.error('Failed to fetch products');
        }
      });
    } catch (exception) {
      _logger.error('Request failed with error: $exception');
      return Future.error(exception);
    }
  }
}

// List<ProductModel> productsList = [];
//
// Future<void> fetchProducts() async {
//   final products = await ProductsController().fetchProductList();
//   setState(() {
//     productsList = products;
//     isProductsLoaded = true;
//   });
// }
