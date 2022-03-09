// To parse this JSON data, do
//
//     final clientProjcet = clientProjcetFromJson(jsonString);

import 'dart:convert';

ClientProjcet clientProjcetFromJson(String str) =>
    ClientProjcet.fromJson(json.decode(str));

String clientProjcetToJson(ClientProjcet data) => json.encode(data.toJson());

class ClientProjcet {
  ClientProjcet({
    required this.data,
  });

  Data data;

  factory ClientProjcet.fromJson(Map<String, dynamic> json) => ClientProjcet(
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
    // required this.pivot,
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
  // Pivot pivot;

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
        // pivot: json["pivot"] == null ? null : Pivot.fromJson(json["pivot"]),
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
        //"pivot": pivot == null ? null : pivot.toJson(),
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
    required this.project,
    required this.master,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime duration;
  String status;
  String description;
  Project project;
  Manager master;
  DateTime createdAt;
  DateTime updatedAt;

  factory Task.fromJson(Map<String, dynamic> json) => Task(
        id: json["id"],
        name: json["name"],
        duration: DateTime.parse(json["duration"]),
        status: json["status"],
        description: json["description"],
        project: Project.fromJson(json["project"]),
        master: Manager.fromJson(json["master"]),
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
        "project": project.toJson(),
        "master": master.toJson(),
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}

class Project {
  Project({
    required this.id,
    required this.name,
    required this.deadline,
    required this.code,
    required this.clientId,
    required this.rate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
  });

  int id;
  String name;
  DateTime deadline;
  String code;
  int clientId;
  int rate;
  String status;
  DateTime createdAt;
  DateTime updatedAt;

  factory Project.fromJson(Map<String, dynamic> json) => Project(
        id: json["id"],
        name: json["name"],
        deadline: DateTime.parse(json["deadline"]),
        code: json["code"],
        clientId: json["client_id"],
        rate: json["rate"],
        status: json["status"],
        createdAt: DateTime.parse(json["created_at"]),
        updatedAt: DateTime.parse(json["updated_at"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "deadline": deadline.toIso8601String(),
        "code": code,
        "client_id": clientId,
        "rate": rate,
        "status": status,
        "created_at": createdAt.toIso8601String(),
        "updated_at": updatedAt.toIso8601String(),
      };
}
