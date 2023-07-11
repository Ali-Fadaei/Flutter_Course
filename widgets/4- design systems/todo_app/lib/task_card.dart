import 'package:flutter/material.dart';
import 'package:todo_app/task_data.dart';

class TaskCard extends StatelessWidget {
//
  final TaskData taskData;
  final void Function(TaskData data) onRemovePressed;
  final void Function(TaskData data) onCheckPressed;

  const TaskCard({
    super.key,
    required this.taskData,
    required this.onCheckPressed,
    required this.onRemovePressed,
  });

  //on check -> functional
  //on remove -> functional

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      height: 80,
      decoration: BoxDecoration(
        color: Color(0xFFF4F4F4),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          GestureDetector(
            onTap: () => onCheckPressed(taskData),
            child: taskData.isChecked
                ? Icon(Icons.check_box_rounded)
                : Icon(Icons.check_box_outline_blank_rounded),
          ),
          SizedBox(width: 10),
          Expanded(
            flex: 90,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  taskData.text,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontFamily: 'Roboto',
                    fontSize: 20,
                    color: Colors.black,
                  ),
                ),
                Divider(
                  thickness: 1.5,
                  height: 10,
                  indent: 5,
                ),
                // SizedBox(height: 10),
                Text(taskData.date.toLocal().toString()),
              ],
            ),
          ),
          Spacer(flex: 10),
          GestureDetector(
            onTap: () => onRemovePressed(taskData),
            child: Icon(Icons.remove_circle_outline_rounded),
          )
        ],
      ),
    );
  }
}
