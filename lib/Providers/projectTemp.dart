import 'dart:convert';

ProjectData projectDataFromJson(String str) =>
    ProjectData.fromJson(json.decode(str));

String projectDataToJson(ProjectData data) => json.encode(data.toJson());

class ProjectData {
  ProjectData({
    required this.data,
  });

  Data data;

  factory ProjectData.fromJson(Map<String, dynamic> json) => ProjectData(
        data: Data.fromJson(json["data"]),
      );

  Map<String, dynamic> toJson() => {
        "data": data.toJson(),
      };
}

class Data {
  Data({
    required this.name,
    required this.createdAt,
    required this.owner,
  });

  String name;
  DateTime createdAt;
  Owner owner;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        name: json["name"] as String,
        createdAt: DateTime.parse(json["created_at"]),
        owner: Owner.fromJson(json["owner"]),
      );

  Map<String, dynamic> toJson() => {
        "name": name,
        "created_at": createdAt.toIso8601String(),
        "owner": owner.toJson(),
      };
}

class Owner {
  Owner({
    required this.username,
  });

  String username;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        username: json["username"],
      );

  Map<String, dynamic> toJson() => {
        "username": username,
      };
}
