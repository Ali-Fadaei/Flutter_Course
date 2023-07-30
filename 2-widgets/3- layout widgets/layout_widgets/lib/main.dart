// ignore_for_file: unused_import

import 'package:flutter/material.dart';
import 'package:layout_widgets/pages/layout_page.dart';
import 'package:layout_widgets/pages/column_page.dart';
import 'package:layout_widgets/pages/expanded_column_page.dart';
import 'package:layout_widgets/pages/expanded_row_page.dart';
import 'package:layout_widgets/pages/row_page.dart';
import 'package:layout_widgets/pages/stack_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
//
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
//
  int selectedPageIndex = 0;

  List<Widget> pages = const [
    ColumnPage(),
    ExpandedColumnPage(),
    RowPage(),
    ExpandedRowPage(),
    StackPage(),
    LayoutPage(),
  ];

  void onPageChangeButtonPressed() {
    setState(() {
      if (selectedPageIndex == 5) {
        selectedPageIndex = 0;
      } else {
        selectedPageIndex++;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        floatingActionButton: FloatingActionButton(
          onPressed: onPageChangeButtonPressed,
          child: const Icon(Icons.change_circle_outlined),
        ),
        backgroundColor: Colors.white,
        body: pages[selectedPageIndex],
      ),
    );
  }
}
