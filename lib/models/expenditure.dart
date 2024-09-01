import 'package:mongo_dart/mongo_dart.dart';

class Expenditure {

  final ObjectId id;
  final int? amount;
  final DateTime? date;

  Expenditure({
    required this.id,
    this.amount,
    this.date
  });

  factory Expenditure.fromJson(Map<String, dynamic> json) {
    return Expenditure(
      id: json['_id'],
      amount: json['amount'],
      date: DateTime.parse(json['date']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'amount': amount,
      'date': date,
    };
  }

  @override
  String toString() {
    return 'User{id: $id, amount: $amount, date: $date}';
  }
}