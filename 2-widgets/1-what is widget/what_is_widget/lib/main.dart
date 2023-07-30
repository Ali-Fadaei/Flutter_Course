// ignore_for_file: avoid_print

import 'package:flutter/material.dart';

void main() {
  //runApp is where the "BigBang" of flutter world happen.
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
//
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Center(
          child: Container(
            height: 400,
            width: 600,
            color: Colors.cyan.shade100,
            alignment: Alignment.center,
            child: const Text('Hello World!'),
          ),
        ),
      ),
    );
  }
}
