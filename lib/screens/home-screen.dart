import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';

import 'category-screen.dart';
import 'expense-screen.dart';

class HomeState extends StatefulWidget {

  const HomeState({super.key});

  @override
  State<HomeState> createState() => HomeScreen();
}

class HomeScreen extends State<HomeState> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("HomeScreen"),
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
                title: Text("Expenses",
                    style: TextStyle(
                      color: Colors.black
                  )
                ),
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
                title: Text("Categories",
                    style: TextStyle(
                        color: Colors.black
                    )
                ),
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
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, result) {
          if (didPop) { }
        },
        child: Center(
          child: Text(
              "Welcome to the main page",
            style: TextStyle(
              color: Colors.black
            )),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {

          var connectivityResult = await (Connectivity().checkConnectivity());
          print(connectivityResult);
          print("okkkk");
          var status = await Permission.contacts.request();
          print(status);
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}