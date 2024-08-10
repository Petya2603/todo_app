import 'dart:convert';
import 'dart:core';
import 'package:get/get.dart';
import 'package:todo_app/model/task.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/screns/completed_task/completed_task_screen.dart';

class HomeScreenController extends GetxController {
  RxList<Task> todo = <Task>[].obs;
  final RxList<Task> todoList = <Task>[].obs;
  void addNewTask(Task newTask) async {
    todo.add(newTask);
    saveTasks();
  }

  Future<void> saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskJson = jsonEncode(todo.map((task) => task.toJson()).toList());
    await prefs.setString('tasks', taskJson);
  }

  Future<void> loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskJson = prefs.getString('tasks');
    if (taskJson != null) {
      final List<dynamic> tasksList = jsonDecode(taskJson);
      todo.addAll(tasksList.map((task) => Task.fromJson(task)).toList());
    }
  }

  void onChanged(Task task) {
    task.isCompleted = !task.isCompleted;
    final completedTask = todo.where((t) => t.isCompleted).toList();
    if (completedTask.isNotEmpty || completedTask == true) {
      Get.to(CompletedTasksScreen(completed: completedTask));
    }
    saveTasks();
  }

  void deleteTask(Task task) {
    todo.remove(task);
    saveTasks();
  }
}
