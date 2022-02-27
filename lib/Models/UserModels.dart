import 'dart:convert';

user userFromJson(String str) => user.fromJson(json.decode(str));

String userToJson(user data) => json.encode(data.toJson());

class user {
  user({
    required this.data,
  });

  Data data;

  factory user.fromJson(Map<String, dynamic> json) => user(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.id,
    required this.name,
    required this.username,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String username;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
