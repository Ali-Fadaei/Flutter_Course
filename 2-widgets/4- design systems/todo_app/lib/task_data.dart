class TaskData {
//
  String text;

  final DateTime date;

  bool isChecked;

  TaskData({
    this.isChecked = false,
    required this.text,
    required this.date,
  });
}
