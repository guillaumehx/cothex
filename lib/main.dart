import 'package:flutter/material.dart';
import 'package:test_flutthe/expenditure.dart';
import 'package:test_flutthe/screens/category-screen.dart';
import 'package:test_flutthe/screens/expense-screen.dart';
import 'mongo.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: false,
        appBarTheme: AppBarTheme(
          foregroundColor: Colors.black,
        ),
      ),
      home: const MainPageState(title: 'Cothex'),
    );
  }
}

class MainPageState extends StatefulWidget {

  const MainPageState({super.key, required this.title});

  final String title;

  @override
  State<MainPageState> createState() => MainPage();
}

class MainPage extends State<MainPageState> {

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      drawer: Drawer(
          child: ListView(
            padding: EdgeInsets.zero,
            children: [
              const DrawerHeader(
                decoration: BoxDecoration(
                  color: Colors.lightGreen,
                ),
                child: Text('Drawer Header'),
              ),
              ListTile(
                title: const Text("Expenses"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ExpenseState()),
                  );
                  // Update the state of the app.
                  // ...
                },
              ),
              ListTile(
                title: const Text("Categories"),
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const CategoryState()),
                  );
                },
              ),
            ],
          ),
      ),
      body: Center(
        child: Text("Welcome to the main page"),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: ()  { },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
