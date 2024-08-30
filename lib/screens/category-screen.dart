import 'package:flutter/material.dart';

class CategoryState extends StatefulWidget {

  const CategoryState({super.key});

  @override
  State<CategoryState> createState() => CategoryScreen();
}

class CategoryScreen extends State<CategoryState> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("CategoryScreen"),
      ),
      body: Center(
        child: Text("Welcome to the category page")
      ),
    );
  }
}