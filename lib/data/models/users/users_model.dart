class UsersModel {
  final int id;
  final String username;
  final String name;
  final String state;
  final String avatar_url;

  UsersModel({
    this.id = 0,
    required this.username,
    required this.state,
    required this.avatar_url,
    required this.name,
  });

  factory UsersModel.fromJson(Map<String, dynamic> json) {
    return UsersModel(
      id: json["id"] as int? ?? 0,
      username: json["username"] as String? ?? "",
      state: json["state"] as String? ?? "",
      avatar_url: json["avatar_url"] as String? ?? "",
      name: json["name"] as String? ?? "",
    );
  }

  UsersModel copyWith({
    int? id,
    String? username,
    String? state,
    String? avatar_url,
    String? name,
  }) =>
      UsersModel(
        id: id ?? this.id,
        username: username ?? this.username,
        state: state ?? this.state,
        avatar_url: avatar_url ?? this.avatar_url,
        name: name ?? this.name,
      );

  Map<String, dynamic> toJson() {
    return {
      "username": username,
      "contact": name,
      "email": state,
      "avatar": avatar_url,
    };
  }
}

class Data {
  final int userId;
  final int id;
  final String title;

  Data({required this.userId, required this.id, required this.title});

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      userId: json['userId'],
      id: json['id'],
      title: json['title'],
    );
  }
}
