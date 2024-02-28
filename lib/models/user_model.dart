class UserModel {
  String id;
  final String name;
  final String email;
  final String role;
  final String about;
  String password;
  String dp;

  UserModel({
    this.id = '',
    required this.name,
    required this.email,
    required this.role,
    required this.about,
    this.password = '',
    this.dp = '',
  });

  Map<String, dynamic> toMap() {
    return {
      'name': this.name,
      'email': this.email,
      'role': this.role,
      'about': this.about,
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
      about: map['about'] as String,
      dp: map['dp'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "id": this.id,
      "name": this.name,
      "email": this.email,
      "role": this.role,
      "about": this.about,
      "dp": this.dp,
    };
  }
}
