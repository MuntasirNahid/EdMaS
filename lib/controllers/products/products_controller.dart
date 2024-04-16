import 'dart:convert';
import 'dart:typed_data';

import 'package:edmas/models/location_model.dart';
import 'package:edmas/models/product_model.dart';
import 'package:edmas/models/transaction_model.dart';
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

  Future<double> getCurrentBalance() {
    return ProductApiService().getCurrentBalance().then((response) {
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        _logger.success("Current Balance fetched successfully");
        var jsonData = jsonResponse['data'];
        return jsonData['balance'];
      } else {
        _logger.error(
            'Failed to fetch current balance,status code: ${response.statusCode} ');
        return Future.error('Failed to fetch current balance');
      }
    });
  }

  Future<String> addIncomeOrExpense({
    required String amount,
    required String type,
    required String details,
  }) {
    return ProductApiService()
        .addIncomeOrExpense(amount: amount, type: type, details: details)
        .then((response) {
      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        _logger.success("Income/Expense added successfully");
        return jsonResponse['message'];
      } else {
        _logger.error(
            'Failed to add income/expense,status code: ${response.statusCode} ');
        return Future.error('Failed to add income/expense');
      }
    });
  }

  Future<List<TransactionModel>> getAllTransaction() {
    return ProductApiService().getAllTransactions().then((response) {
      if (response.statusCode == 200) {
        var jsonResponse = jsonDecode(response.body);
        _logger.success("All Transaction fetched successfully");
        var jsonData = jsonResponse['data'];

        List<TransactionModel> transactions = (jsonData as List).map(
          (transaction) {
            return TransactionModel.fromJson(transaction);
          },
        ).toList();

        return transactions;
      } else {
        _logger.error(
            'Failed to fetch all transaction,status code: ${response.statusCode} ');
        return Future.error('Failed to fetch all transaction');
      }
    });
  }

  Future<String> updateProductDetails({
    required String productId,
    String? productName,
    String? location,
    String? quantity,
  }) {
    return ProductApiService()
        .updateProductDetails(
      productId: productId,
      productName: productName,
      productShelfId: location,
      productQuantity: quantity,
    )
        .then((response) {
      if (response.statusCode == 202) {
        var jsonResponse = jsonDecode(response.body);
        _logger.success("Product Details Updated successfully");
        return "Product Details Updated successfully";
      } else {
        _logger.error(
            'Failed to update product details,status code: ${response.statusCode} ');
        return Future.error('Failed to update product details');
      }
    });
  }

  Future<String> deleteProduct({
    required String productId,
  }) {
    return ProductApiService()
        .deleteProduct(productId: productId)
        .then((response) {
      if (response.statusCode == 202) {
        var jsonResponse = jsonDecode(response.body);
        _logger.success("Product Deleted successfully");
        return "Product Deleted successfully";
      } else {
        _logger.error(
            'Failed to delete product,status code: ${response.statusCode} ');
        return Future.error('Failed to delete product');
      }
    });
  }

  Future<String> sendApplication({
    required String type,
    required List<Map<String, dynamic>> items,
    required String body,
  }) async {
    return ProductApiService()
        .sendApplication(
      type: type,
      items: items,
      body: body,
    )
        .then((response) {
      if (response.statusCode == 201) {
        var jsonResponse = jsonDecode(response.body);
        _logger.success("Application created successfully.");
        return "Application created successfully.";
      } else {
        _logger.error(
            'Failed to create application,status code: ${response.statusCode} ');
        return Future.error('Failed to create application');
      }
    });
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
