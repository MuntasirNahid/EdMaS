class LocationModel {
  final String id;
  final String shelfNum;
  final String row;
  final String column;

  LocationModel({
    required this.id,
    required this.shelfNum,
    required this.row,
    required this.column,
  });

  factory LocationModel.fromJson(Map<String, dynamic> json) {
    return LocationModel(
      id: json['id'],
      shelfNum: json['shelfNum'],
      row: json['row'],
      column: json['column'],
    );
  }
}
