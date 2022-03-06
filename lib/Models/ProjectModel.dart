// To parse this JSON data, do
//
//     final welcome = welcomeFromJson(jsonString);

import 'dart:convert';

ProjectModel projectFromJson(String str) =>
    ProjectModel.fromJson(json.decode(str));

String projectToJson(ProjectModel data) => json.encode(data.toJson());

class ProjectModel {
  ProjectModel({
    required this.data,
  });

  Data data;

  factory ProjectModel.fromJson(Map<String, dynamic> json) => ProjectModel(
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
    required this.deadline,
    required this.code,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.owner,
    required this.staff,
    required this.manager,
    required this.tasks,
  });

  int id;
  String name;
  DateTime deadline;
  String code;
  String status;
  DateTime createdAt;
  DateTime updatedAt;
  Owner owner;
  List<Manager> staff;
  Manager manager;
  List<Task> tasks;

  factory Data.fromJson(Map<String, dynamic> json) => Data(
        id: json["id"],
        name: json["name"],
        deadline: DateTime.parse(json["deadline"]),
        code: json["code"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
        owner: Owner.fromJson(json["owner"]),
        staff:
            List<Manager>.from(json["staff"].map((x) => Manager.fromJson(x))),
        manager: Manager.fromJson(json["manager"]),
        tasks: List<Task>.from(json["tasks"].map((x) => Task.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deadline": deadline.toIso8601String(),
        "code": code,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
        "owner": owner.toJson(),
        "staff": List<dynamic>.from(staff.map((x) => x.toJson())),
        "manager": manager.toJson(),
        "tasks": List<dynamic>.from(tasks.map((x) => x.toJson())),
      };
}

class Manager {
  Manager({
    required this.id,
    required this.name,
    required this.username,
    required this.password,
    required this.email,
    required this.type,
    required this.projectId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  String username;
  String password;
  String email;
  String type;
  int? projectId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Manager.fromJson(Map<String, dynamic> json) => Manager(
        id: json["id"],
        name: json["name"],
        username: json["username"],
        password: json["password"],
        email: json["email"],
        type: json["type"],
        projectId: json["project_id"] == null ? null : json["project_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "username": username,
        "password": password,
        "email": email,
        "type": type,
        "project_id": projectId == null ? null : projectId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Pivot {
  Pivot({
    required this.projectId,
    required this.teamMemberId,
    required this.role,
    required this.createdAt,
    required this.updatedAt,
  });

  int projectId;
  int teamMemberId;
  String role;
  DateTime createdAt;
  DateTime updatedAt;

  factory Pivot.fromJson(Map<String, dynamic> json) => Pivot(
        projectId: json["project_id"],
        teamMemberId: json["team_member_id"],
        role: json["role"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "project_id": projectId,
        "team_member_id": teamMemberId,
        "role": role,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Owner {
  Owner({
    required this.id,
    required this.username,
    required this.email,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String username;
  String email;
  DateTime createdAt;
  DateTime updatedAt;

  factory Owner.fromJson(Map<String, dynamic> json) => Owner(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Task {
  Task({
    required this.id,
    required this.name,
    required this.duration,
    required this.status,
    required this.description,
    required this.projectId,
    required this.teamMemberId,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime duration;
  String status;
  String description;
  int projectId;
  int teamMemberId;
  DateTime createdAt;
  DateTime updatedAt;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        name: json["name"],
        duration: DateTime.parse(json["duration"]),
        status: json["status"],
        description: json["description"],
        projectId: json["project_id"],
        teamMemberId: json["team_member_id"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "duration":
            "${duration.year.toString().padLeft(4, '0')}-${duration.month.toString().padLeft(2, '0')}-${duration.day.toString().padLeft(2, '0')}",
        "status": status,
        "description": description,
        "project_id": projectId,
        "team_member_id": teamMemberId,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
