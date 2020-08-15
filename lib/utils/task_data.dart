import 'package:flutter/foundation.dart';
import 'package:to_do_list/utils/TaskList.dart';

class TaskData extends ChangeNotifier {
  List<TaskList> entries = [TaskList(name: "Task1")];

  void addTaskToScreen(String nameOfTask) {
    final task = TaskList(name: nameOfTask);
    entries.add(task);
    notifyListeners();
  }

  void updateCheckBox(int index) {
    entries[index].isChecked = !entries[index].isChecked;
    notifyListeners();
  }

  int get taskCount {
    return entries.length;
  }

  String getTaskName(int index) {
    return entries[index].name;
  }

  bool isChecked(int index) {
    return entries[index].isChecked;
  }
  void deleteFromList(TaskList nameOfTask){
    entries.remove(nameOfTask);
    notifyListeners();
  }
}
