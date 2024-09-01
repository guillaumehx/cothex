import 'dart:async';
import 'dart:developer';
import 'dart:ui';

import 'package:mongo_dart/mongo_dart.dart';
import 'package:test_flutthe/models/expenditure.dart';
import 'package:test_flutthe/models/user.dart';

import 'models/category.dart';

class Mongo {
  // Replace with your actual MongoDB connection string
  //static const String _connectionString = "mongodb+srv://guho:7131FleX##@dev-hackathon.8gins.mongodb.net/account-visualizer-test";

  var us = "guho";
  var pwd = "7131FleX##";
  var host = "dev-hackathon.8gins.mongodb.net";
  var port = "27017";
  late Db _db;

  Future<void> connect() async {
    _db = await Db.create("mongodb+srv://guho:hSTixnesN1Qu2I6w@dev-hackathon.8gins.mongodb.net/account-visualizer-test");
    await _db.open();
    print('Connected to the database');
    log("connected");
  }

  Future<void> insertData(Map<String, dynamic> data) async {
    final collection = _db.collection('expenditure');
    var c = await collection.insert(data);


    print(c);
    print('Data inserted');
    log("inserted");
  }

  Future<List<Expenditure>> fetchExpenditures() async {
    final collection = _db.collection('expenditure');
    return await collection.find().map((e) => Expenditure.fromJson(e)).toList();
  }

  Future<List<Category>> fetchCategories() async {
   final collection = _db.collection("category");
   return await  collection.find().map((c) => Category.fromJson(c)).toList();
  }

  Future<void> close() async {
    await _db.close();
    print('Connection closed');
  }
}