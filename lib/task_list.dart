import 'package:flutter/material.dart';
import 'task_tile.dart';
import 'package:todoey/models/task.dart';
import 'package:provider/provider.dart';
import 'models/task_data.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<TaskData>(
      builder: (context, taskData, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            final task = taskData.tasks[index];
            return TaskTile(
              isChecked: taskData.tasks[index].isDone,
              title: taskData.tasks[index].name,
              checkboxCallback: (checkBoxState) {
                taskData.updateTask(taskData.tasks[index]);
              },
              longPressCallback: () {
                taskData.deleteTask(task);
              },
            );
          },
          itemCount: taskData.taskCount,
        );
      },
    );
  }
}
