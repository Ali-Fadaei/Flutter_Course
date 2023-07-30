import 'package:flutter/material.dart';
import 'package:widget_types/counter_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
//
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: CounterPage(
        initCount: 5,
        step: 10,
      ),
    );
  }
}
