// To parse this JSON data, do
//
//     final user = userFromJson(jsonString);

import 'dart:convert';

import 'package:missa/ui/domain_layer/role.dart';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
    User({
        this.id,
        this.username,
        this.email,
        this.provider,
        this.confirmed,
        this.blocked,
        this.createdAt,
        this.updatedAt,
        this.numeromomo,
        this.confirmedPhone,
        this.role,
        this.password,
        this.paroisse
    });

    int? id;
    String? username;
    String? email;
    String? provider;
     String? password;
     String? paroisse;
    bool? confirmed;
    bool? blocked;
    DateTime? createdAt;
    DateTime? updatedAt;
    String? numeromomo;
    bool? confirmedPhone;
    Role? role;

    factory User.fromJson(Map<String, dynamic> json) => User(
        id: json["id"],
        username: json["username"],
        email: json["email"],
        provider: json["provider"],
        confirmed: json["confirmed"],
        blocked: json["blocked"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        numeromomo: json["numeromomo"],
        confirmedPhone: json["confirmedPhone"],
        role: json.containsKey("role") ? Role.fromJson(json["role"]) : null,
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "username": username,
        "email": email,
        "provider": provider,
        "confirmed": confirmed,
        "blocked": blocked,
         "password": password,
        "createdAt": createdAt ==  null? null:  createdAt!.toIso8601String(),
        "updatedAt": updatedAt ==  null? null: updatedAt!.toIso8601String(),
        "numeromomo": numeromomo,
        "confirmedPhone": false,
        "role":role ==  null ? null: role!.toJson(),
    };
}

