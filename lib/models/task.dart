import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

class _Task {
  final String name;
  bool isChecked;

  _Task(this.name, {this.isChecked = false});

  void _toggleDone() {
    this.isChecked = !this.isChecked;
  }
}

const String _tasksKey = 'task_list';

class Tasks extends ChangeNotifier {
  List<_Task> _tasks = [];

  void addTask(String name,
      {bool isChecked = false, bool saveAfterAdd = true}) {
    _tasks.add(_Task(name, isChecked: isChecked));
    notifyListeners();
    if (saveAfterAdd) {
      save();
    }
  }

  int get taskCount {
    return _tasks.length;
  }

  String getTaskName(int index) {
    return _tasks[index].name;
  }

  bool isTaskChecked(int index) {
    return _tasks[index].isChecked;
  }

  void toggle(int index) {
    this._tasks[index]._toggleDone();
    notifyListeners();
    save(task: this._tasks[index]);
  }

  void remove(int index) {
    _tasks.removeAt(index);
    notifyListeners();
    save();
  }

  List<String> get taskNames {
    return _tasks.map((e) => e.name).toList();
  }

  save({_Task task}) async {
    final prefs = await SharedPreferences.getInstance();

    if (task != null) {
      prefs.setBool(task.name, task.isChecked);
      return;
    }
    final List<String> value = this.taskNames;
    prefs.setStringList(_tasksKey, value);

    _tasks.forEach((task) {
      print('Save - ${task.name}: ${task.isChecked}');
      prefs.setBool(task.name, task.isChecked);
    });
  }

  load() async {
    final prefs = await SharedPreferences.getInstance();
    final List<String> tasks = prefs.getStringList(_tasksKey) ?? [];

    tasks.forEach((taskName) {
      addTask(
        taskName,
        isChecked: prefs.getBool(taskName) ?? false,
        saveAfterAdd: false,
      );
    });

    _tasks.forEach((element) {
      print('Load - ${element.name} : ${element.isChecked}');
    });
  }
}
