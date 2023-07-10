import 'package:flutter/material.dart';

void main() {
  //runApp is where the "BigBang" of your app's world happen.
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
//
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        body: Center(
          child: Text('Hello World!'),
        ),
      ),
    );
  }
}
