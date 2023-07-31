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
    TaskData(
      text: 'join Flutter Course! 🚀',
      date: DateTime.now(),
    ),
    TaskData(
      text: 'pay attention to lecture in class. 👀',
      date: DateTime.now(),
    ),
    TaskData(
      text: 'watch lecture records after class session. 📽️',
      date: DateTime.now(),
    ),
    TaskData(
      text: 'take notes and learn deeply. 🧠',
      date: DateTime.now(),
    ),
    TaskData(
      text: 'Code, Code, Code! 🧑🏻‍💻',
      date: DateTime.now(),
    ),
    TaskData(
      text: 'become a Flutter Developer as soon as possible. 😎',
      date: DateTime.now(),
    ),
  ];

  @override
  void initState() {
    inputCtrl.addListener(() {
      setState(() => inputIsEmpty = inputCtrl.text.isEmpty);
    });
    super.initState();
  }

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

  void onRemoveTaskPressed(TaskData data) {
    setState(() {
      tasks.remove(data);
    });
  }

  void onCheckTaskPressed(TaskData data) {
    setState(() {
      var temp = tasks.firstWhere((element) => element == data);
      temp.isChecked = !temp.isChecked;
    });
  }

  @override
  void dispose() {
    inputCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          // brightness: Brightness.dark,
          brightness: Brightness.light,
          seedColor: Colors.teal,
        ),
      ),
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Text('TODO APP'),
          scrolledUnderElevation: 6,
        ),
        drawer: Drawer(
          child: Column(
            children: [],
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 15),
          child: Column(
            children: [
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      ...tasks.expand((e) {
                        return [
                          TaskCard(
                            taskData: e,
                            onCheckPressed: onCheckTaskPressed,
                            onRemovePressed: onRemoveTaskPressed,
                          ),
                          if (tasks.last != e) SizedBox(height: 10),
                        ];
                      }),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                        controller: inputCtrl,
                        onEditingComplete: onAddTaskPressed,
                        decoration: InputDecoration(
                          filled: true,
                          hintText: 'type you\'re task here!',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(100),
                            // gapPadding: 100,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(width: 10),
                    SizedBox(
                      width: 60,
                      height: 60,
                      child: IconButton.filled(
                        onPressed: inputIsEmpty ? null : onAddTaskPressed,
                        icon: Icon(Icons.add_task),
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
