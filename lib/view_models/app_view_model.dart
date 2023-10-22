import 'package:flutter/material.dart';

import '../models/task_model.dart';
import '../models/user_model.dart';

class AppViewModel extends ChangeNotifier{
  List<Task> tasks = <Task>[];
  User user = User("Maha Ahmed");

  Color clrlvl1 = Colors.blue.shade200;
  Color clrlvl2 = Colors.blue.shade500;
  Color clrlvl3 = Colors.blue.shade800;
  Color clrlvl4 = Colors.blue.shade900;

  int get numTasks => tasks.length;

  int get numTasksRemaining => tasks.where((task) => !task.complete).length;

  String get username => user.username;

  void addTask(Task newTask){
    tasks.add(newTask);
    notifyListeners();
  }
  bool getTaskValue (int taskIndex){
    return tasks[taskIndex].complete;
  }
  String getTaskTitle(int taskIndex){
    return tasks[taskIndex].title;
  }
  void deleteTask(int taskIndex){
    tasks.removeAt(taskIndex);
    notifyListeners();
  }

  void seTaskValue (int taskIndex, bool taskValue){
    tasks [taskIndex].complete = taskValue;
    notifyListeners();
  }
  void updateUsername(String newUsername){
    user.username = newUsername;
    notifyListeners();
  }
  void deleteAllTasks(){
    tasks.clear();
    notifyListeners();
  }
  void deleteCompletedTasks(){
    tasks = tasks.where((task) => !task.complete).toList();
    notifyListeners();
  }

  void bottomSheetBuilder(Widget bottomSheetView, BuildContext context){
    showModalBottomSheet(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(40)),
        clipBehavior: Clip.antiAliasWithSaveLayer,
        context: context, builder: (context){
      return bottomSheetView;
    });
  }
}