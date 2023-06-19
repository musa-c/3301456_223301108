class LocalDbUserModel {
  int? id;
  String? password;
  String? username;
  String? email;

  LocalDbUserModel({
    this.id,
    required this.password,
    required this.username,
    required this.email,
  });

  Map<String, dynamic> toMap() {
    return {
      "password": password,
      "username": username,
      "email": email,
    };
  }

  LocalDbUserModel.fromMap(Map<String, dynamic> map) {
    id = map["id"];
    password = map["password"];
    username = map["username"];
    email = map["email"];
  }
}
