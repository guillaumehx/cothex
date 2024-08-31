import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:key_guardmanager/key_guardmanager.dart';
import 'package:test_flutthe/main.dart';

class UnlockState extends StatefulWidget {

  const UnlockState({super.key});

  @override
  State<UnlockState> createState() => UnlockScreen();
}

class UnlockScreen extends State<UnlockState> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Cothex"),
        automaticallyImplyLeading: false
      ),
      body: PopScope(
          canPop: false,
          onPopInvokedWithResult: (didPop, result) {
            if (didPop) { }
          },
          child: Center(
            child: TextButton(
                style: TextButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: Colors.lightGreen,
                ),
                onPressed: () {
                  () async {
                    try {
                      String platformAuth = await KeyGuardmanager.authStatus;
                      if (platformAuth == "true") {
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => const MainPageState(title: "Cothex")),
                        );
                      }
                    } on PlatformException {
                      //Navigator.push(
                      //  context,
                      //  MaterialPageRoute(builder: (context) => const UnlockState()),
                      //);
                    }
                  } ();
                },
                child: Text('Unlock')
            ),
          )
      ),
    );
  }
}