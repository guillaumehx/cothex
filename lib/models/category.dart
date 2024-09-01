import 'package:mongo_dart/mongo_dart.dart';

class Category {

  final ObjectId id;
  final String name;
  final String alias;

  Category({
    required this.id,
    required this.name,
    required this.alias,
  });

  factory Category.fromJson(Map<String, dynamic> json) {
    return Category(
      id: json['_id'],
      name: json['name'],
      alias: json['alias'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'name': name,
      'alias': alias,
    };
  }

  @override
  String toString() {
    return 'Category{id: $id, name: $name, alias: $alias}';
  }
}