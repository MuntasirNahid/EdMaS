class TransactionModel {
  final String id;
  final String type;
  final String details;
  final int amount;

  TransactionModel({
    required this.id,
    required this.type,
    required this.details,
    required this.amount,
  });

  factory TransactionModel.fromJson(Map<String, dynamic> json) {
    return TransactionModel(
      id: json["id"],
      type: json["type"],
      details: json["details"],
      amount: json["amount"],
    );
  }
}
