import 'package:edmas/models/location_model.dart';

class ProductModel {
  final String id;
  final String name;
  final int quantity;
  final String image;
  final String locationId;
  final LocationModel location;

  ProductModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.image,
    required this.locationId,
    required this.location,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['id'],
      name: json['name'],
      quantity: json['quantity'],
      image: json['image'],
      locationId: json['locationId'],
      location: LocationModel.fromJson(json['location']),
    );
  }
}
