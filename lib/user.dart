import 'package:mongo_dart/mongo_dart.dart';

class User {
  final ObjectId id;
  final String? firstname;
  final String? lastname;
  final String? email;
  final String? password;
  final String? role;

  // Constructor
  User({
    required this.id,
    this.firstname,
    this.lastname,
    this.email,
    this.password,
    this.role,
  });

  // Factory method to create a User object from a JSON object
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

  // Method to convert the User object to a JSON object
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

  // Override toString for better logging/debugging
  @override
  String toString() {
    return 'User{id: $id, firstname: $firstname, lastname: $lastname, email: $email, password: $password, role: $role}';
  }
}