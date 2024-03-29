class LocationModel {
  final String id;
  final String shelfNum;

  LocationModel({
    required this.id,
    required this.shelfNum,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      shelfNum: json['shelfNum'],
    );
  }
}
