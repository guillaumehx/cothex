import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:key_guardmanager/key_guardmanager.dart';
import 'package:test_flutthe/screens/home-screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(colorScheme: ColorScheme(
        primary: Colors.purple,
        secondary: Colors.blue,
        brightness: Brightness.light,
        onPrimary: Colors.black,
        onSecondary: Colors.white,
        surface: Colors.white,
        error: Colors.red,
        onError: Colors.red,
        onSurface: Colors.white,
        // all fields should have a value
      )),
      home: const MainPageState(title: 'Cothex'),
    );
  }
}

class MainPageState extends StatefulWidget {

  const MainPageState({super.key, required this.title});

  final String title;

  @override
  State<MainPageState> createState() {
    return MainPage();
  }
}

class MainPage extends State<MainPageState> {

  startAuthentication() {
    () async {
      try {
        String platformAuth = await KeyGuardmanager.authStatus;
        if (platformAuth == "true") {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const HomeState()),
          );
        }
      } on PlatformException { }
    } ();
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      startAuthentication();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //appBar: AppBar(
      //    backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      //    title: Text("Cothex"),
      //    automaticallyImplyLeading: false
      //),
      body: Center(
         child: TextButton(
             style: TextButton.styleFrom(
               foregroundColor: Colors.white,
               backgroundColor: Colors.lightGreen,
             ),
             onPressed: () {
               startAuthentication();
             },
             child: Text('Unlock')
         )
      )
    );
  }
}
