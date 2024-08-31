import 'package:mongo_dart/mongo_dart.dart';

class Expenditure {
  final ObjectId id;
  final int? amount;
  final DateTime? date;

  // Constructor
  Expenditure({
    required this.id,
    this.amount,
    this.date
  });

  // Factory method to create a User object from a JSON object
  factory Expenditure.fromJson(Map<String, dynamic> json) {
    return Expenditure(
      id: json['_id'],
      amount: json['amount'],
      date: json['date'],
    );
  }

  // Method to convert the User object to a JSON object
  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'amount': amount,
      'date': date,
    };
  }

  // Override toString for better logging/debugging
  @override
  String toString() {
    return 'User{id: $id, amount: $amount, date: $date}';
  }
}