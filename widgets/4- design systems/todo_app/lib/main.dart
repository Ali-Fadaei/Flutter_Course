// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:todo_app/task_card.dart';
import 'package:todo_app/task_data.dart';

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

  final inputCtrl = TextEditingController();

  var inputIsEmpty = true;

  List<TaskData> tasks = [
    TaskData(text: 'test', date: DateTime.now()),
    TaskData(text: 'test', date: DateTime.now()),
    TaskData(text: 'test', date: DateTime.now()),
    TaskData(text: 'test', date: DateTime.now()),
    TaskData(text: 'test', date: DateTime.now()),
    TaskData(text: 'test', date: DateTime.now()),
    TaskData(text: 'test', date: DateTime.now()),
  ];

  void onAddTaskPressed() {
    if (inputCtrl.text.isNotEmpty) {
      setState(() {
        tasks.add(
          TaskData(
            text: inputCtrl.text,
            date: DateTime.now(),
          ),
        );
        inputCtrl.clear();
      });
    }
  }

  void onRemovePressed(TaskData data) {
    // tasks.removeWhere((element) => element.id == id);
    tasks.remove(data);
    setState(() {});
  }

  void onCheckPressed(TaskData data) {
    var temp = tasks.firstWhere((element) => element == data);
    temp.isChecked = !temp.isChecked;
    setState(() {});
    // tasks.
  }

  @override
  void initState() {
    inputCtrl.addListener(() {
      setState(() {
        inputIsEmpty = inputCtrl.text.isEmpty;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    inputCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'todo-app',
      theme: ThemeData.from(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF235D65),
        ),
        useMaterial3: false,
      ),
      home: Scaffold(
        backgroundColor: Color(0xFFE6E6E6),
        appBar: AppBar(
          title: const Text('TODO APP'),
          toolbarHeight: 70,
          centerTitle: true,
        ),
        drawer: const Drawer(
          backgroundColor: Color(0xFF67AFB9),
          child: Column(children: []),
        ),
        body: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              ...tasks.expand((e) {
                return [
                  TaskCard(
                    taskData: e,
                    onCheckPressed: onCheckPressed,
                    onRemovePressed: onRemovePressed,
                  ),
                  if (tasks.last != e) SizedBox(height: 10),
                ];
              }),
              Spacer(),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        padding:
                            EdgeInsets.symmetric(horizontal: 30, vertical: 5),
                        decoration: BoxDecoration(
                          color: Colors.cyan[800],
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: TextField(
                          controller: inputCtrl,
                          decoration: InputDecoration(
                            hintText: 'type you\'re task here!',
                            border: InputBorder.none,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      height: 60,
                      child: ElevatedButton(
                        onPressed: inputIsEmpty ? null : onAddTaskPressed,
                        style: ButtonStyle(
                          shape: MaterialStatePropertyAll(CircleBorder()),
                          backgroundColor:
                              MaterialStatePropertyAll(Colors.cyan[800]),
                        ),
                        child: Icon(Icons.add_task),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
