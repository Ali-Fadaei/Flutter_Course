import 'package:flutter/material.dart';

class TaskData {
//
  final UniqueKey id;
  bool isChecked;
  String text;
  final DateTime date;

  TaskData({
    this.isChecked = false,
    required this.text,
    required this.date,
  }) : id = UniqueKey();
}
