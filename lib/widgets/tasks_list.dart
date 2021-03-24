import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';
import 'task_tile.dart';

class TasksList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<Tasks>(
      builder: (context, tasks, child) {
        return ListView.builder(
          itemBuilder: (context, index) {
            return TaskTile(
              text: tasks.getTaskName(index),
              isChecked: tasks.isTaskChecked(index),
              toggleCheckbox: (checkboxState) {
                tasks.toggle(index);
              },
              onLongPress: () {
                tasks.remove(index);
              },
            );
          },
          itemCount: tasks?.taskCount == null ? 0 : tasks.taskCount,
        );
      },
    );
  }
}
