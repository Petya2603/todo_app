import 'dart:convert';
import 'dart:core';
import 'package:get/get.dart';
import 'package:todo_app/model/task.dart'; // Yeni ekran için import
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreenController extends GetxController {
  HomeScreenController.addTask();
  HomeScreenController.addNew();
  final RxList<Task> todo = <Task>[].obs;
  void addNewTask(Task newTask) async {
    todo.add(newTask);
    saveTasks(); // Yeni görevi kaydet
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

  void updateTask(Task task, int index) {
    todo[index] = task;
    saveTasks();
  }

  void toggle(index, value) {
    todo[index].isCompleted = value;
    todo.refresh();
    saveTasks();
  }

  void deleteTask(int index) {
    todo.removeAt(index);
    saveTasks();
  }
}
