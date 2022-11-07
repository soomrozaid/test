import 'package:uuid/uuid.dart';

class User {
  final String id;
  final String name;
  final String email;
  final String username;
  final String password;

  User({
    required this.id,
    required this.email,
    required this.name,
    required this.username,
    required this.password,
  });

  factory User.fromJson(Map<String, dynamic> user) => User(
        id: user['id'],
        email: user['email'],
        name: user['name'],
        username: user['username'],
        password: user['password'],
      );

  Map<String, dynamic> toJson({
    required String id,
    required String email,
    required String name,
    required String username,
    required String password,
  }) =>
      {
        'id': id,
        'email': email,
        'name': name,
        'username': username,
        'password': password,
      };
}
