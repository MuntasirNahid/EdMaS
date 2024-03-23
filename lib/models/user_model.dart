class UserModel {
  String id;
  final String name;
  final String email;
  final String role;

  String password;
  String dp;

  UserModel({
    this.id = '',
    required this.name,
    required this.email,
    required this.role,
    this.password = '',
    this.dp = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'role': this.role,
      'password': this.password,
      'dp': this.dp,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] as String,
      name: map['name'] as String,
      email: map['email'] as String,
      role: map['role'] as String,
      dp: map['dp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "role": this.role,
      "dp": this.dp,
    };
  }
}
