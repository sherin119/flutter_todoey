import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todoey_flutter/models/task.dart';

class AddTaskScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    String newTaskTitle;

    return Consumer<Tasks>(
      builder: (context, tasks, child) {
        return Container(
          color: Color(0xff757575),
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
              ),
            ),
            padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Text(
                  'Add Task',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.lightBlueAccent,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 20, top: 5),
                  child: TextField(
                    style: TextStyle(fontSize: 22),
                    textAlign: TextAlign.center,
                    autofocus: true,
                    onChanged: (newTitle) {
                      newTaskTitle = newTitle;
                    },
                  ),
                ),
                TextButton(
                  style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent),backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlueAccent)),
                  child: Text(
                    'Add',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  onPressed: () {
                    if (newTaskTitle != null) {
                      tasks.addTask(newTaskTitle);
                      Navigator.pop(context);
                    }
                  },
                  // color: Colors.lightBlueAccent,
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
