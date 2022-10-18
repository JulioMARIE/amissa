class Role {
    Role({
        this.id,
        this.name,
        this.description,
        this.type,
        this.createdAt,
        this.updatedAt,
    });

    int? id;
    String? name;
    String? description;
    String? type;
    DateTime? createdAt;
    DateTime? updatedAt;

    factory Role.fromJson(Map<String, dynamic> json) => Role(
        id: json["id"],
        name: json["name"],
        description: json["description"],
        type: json["type"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "description": description,
        "type": type,
        "createdAt": createdAt!.toIso8601String(),
        "updatedAt": updatedAt!.toIso8601String(),
    };
}
