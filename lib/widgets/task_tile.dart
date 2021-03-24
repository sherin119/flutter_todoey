import 'package:flutter/material.dart';

class TaskTile extends StatelessWidget {
  const TaskTile(
      {this.text, this.isChecked, this.toggleCheckbox, this.onLongPress});

  final String text;
  final bool isChecked;
  final Function toggleCheckbox;
  final Function onLongPress;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onLongPress: onLongPress,
      title: Text(
        text,
        style: TextStyle(
            decoration: isChecked ? TextDecoration.lineThrough : null),
      ),
      trailing: Checkbox(
        value: isChecked,
        onChanged: toggleCheckbox,
      ),
    );
  }
}
