class ApplicationModel {
  final String status;
  final String phase;
  final int quantity;
  final String item;

  ApplicationModel({
    required this.status,
    required this.phase,
    required this.quantity,
    required this.item,
  });

  factory ApplicationModel.fromJson(Map<String, dynamic> json) {
    return ApplicationModel(
      status: json["status"],
      phase: json["phase"],
      quantity: json["quantity"],
      item: json["items"][0]["name"],
    );
  }
//
}
