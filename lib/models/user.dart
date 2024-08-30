import 'package:mongo_dart/mongo_dart.dart';

class User {

  final ObjectId id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? password;
  final String? role;

  User({
    required this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.role,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['_id'],
      firstname: json['firstname'],
      lastname: json['lastname'],
      email: json['email'],
      password: json['password'],
      role: json['role'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'firstname': firstname,
      'lastname': lastname,
      'email': email,
      'password': password,
      'role': role,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, firstname: $firstname, lastname: $lastname, email: $email, password: $password, role: $role}';
  }
}