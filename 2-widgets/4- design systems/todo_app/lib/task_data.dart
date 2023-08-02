class TaskData {
//
  final String text;

  final DateTime date;

  bool isChecked;

  TaskData({
    required this.text,
    required this.date,
    this.isChecked = false,
  });
}
