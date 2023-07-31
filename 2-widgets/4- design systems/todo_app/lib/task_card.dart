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

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 2,
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            Checkbox(
              shape: CircleBorder(),
              value: taskData.isChecked,
              onChanged: (_) => onCheckPressed(taskData),
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
                      fontSize: 20,
                      decoration: taskData.isChecked
                          ? TextDecoration.lineThrough
                          : TextDecoration.none,
                    ),
                  ),
                  Divider(
                    thickness: 1.5,
                    height: 10,
                  ),
                  Text(taskData.date.toString().substring(0, 16)),
                ],
              ),
            ),
            Spacer(flex: 10),
            IconButton(
              hoverColor: Theme.of(context).colorScheme.errorContainer,
              icon: Icon(Icons.remove_circle_outline_rounded),
              onPressed: () => onRemovePressed(taskData),
            ),
          ],
        ),
      ),
    );
  }
}
