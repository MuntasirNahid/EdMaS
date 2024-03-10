class ProductModel {
  final String id;
  final String name;
  final int quantity;
  final String image;
  final String locationId;

  ProductModel({
    required this.id,
    required this.name,
    required this.quantity,
    required this.image,
    required this.locationId,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json["id"],
      name: json["name"],
      quantity: int.parse(json["quantity"]),
      image: json["image"],
      locationId: json["locationId"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "quantity": this.quantity,
      "image": this.image,
      "locationId": this.locationId,
    };
  }

//
}
