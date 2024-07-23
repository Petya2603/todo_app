import 'dart:convert';
import 'dart:core';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:one_clock/one_clock.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screns/CompletedTasksScreen.dart'; // Yeni ekran için import
import 'package:todo_app/screns/add_new.dart';
import 'package:todo_app/todo_item.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? date;
  String? time;
  String? description;
  bool isChecked = false;
  List<Task> todo = [];

  @override
  void initState() {
    super.initState();
    _loadTasks(); // Uygulama açıldığında görevleri yükle
  }

  void addNewTask(Task newTask) async {
    setState(() {
      todo.add(newTask);
    });
    _saveTasks(); // Yeni görevi kaydet
  }

  Future<void> _loadTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskJson = prefs.getString('tasks');
    if (taskJson != null) {
      final List<dynamic> tasksList = jsonDecode(taskJson);
      setState(() {
        todo = tasksList.map((task) => Task.fromJson(task)).toList();
      });
    }
  }

  Future<void> _saveTasks() async {
    final prefs = await SharedPreferences.getInstance();
    final taskJson = jsonEncode(todo.map((task) => task.toJson()).toList());
    await prefs.setString('tasks', taskJson);
  }

  @override
  Widget build(BuildContext taskJson) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/header2.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.all(85),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (contex) => Add_new(
                              addNewTask: (newTask) => addNewTask(newTask),
                            ),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.add_task_sharp,
                        size: 27,
                        color: Colors.white,
                      ),
                    ),
                    Expanded(
                      child: DigitalClock(
                          showSeconds: true,
                          isLive: true,
                          format: 'MMMEd',
                          textScaleFactor: 1.0,
                          digitalClockTextColor: Colors.white,
                          decoration: const BoxDecoration(
                              shape: BoxShape.rectangle,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(15))),
                          datetime: DateTime.now()),
                    ),
                    IconButton(
                      onPressed: () {
                        // Tamamlanan görevleri filtrele
                        List<Task> completedTasks =
                            todo.where((task) => task.isCompleted).toList();

                        // CompletedTasksScreen'e yönlendir
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CompletedTasksScreen(
                                completedTasks: completedTasks),
                          ),
                        );
                      },
                      icon: const Icon(
                        Icons.security_update_good_outlined,
                        size: 27,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(255, 255, 255, 252),
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(50),
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.only(top: 20),
                          child: Align(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "My Tasks",
                              style: TextStyle(
                                  fontFamily: 'Raleway',
                                  fontWeight: FontWeight.bold,
                                  fontSize: 18),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(20),
                                child: Visibility(
                                  visible: todo.isEmpty,
                                  child: Lottie.asset('assets/1.json'),
                                ),
                              ),
                              todo.isEmpty
                                  ? const Text(
                                      'Your task list is empty',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Colors.black45,
                                      ),
                                    )
                                  : Expanded(
                                      child: SingleChildScrollView(
                                        child: ListView.builder(
                                          primary: false,
                                          shrinkWrap: true,
                                          itemCount: todo.length,
                                          itemBuilder: (context, index) {
                                            return Todoitem(
                                              task: todo[index],
                                              onChanged: (value) {
                                                setState(() {
                                                  todo[index] = value;
                                                  _saveTasks();
                                                });
                                              },
                                              onCheckBoxChanged: (value) {
                                                setState(() {
                                                  todo[index].isCompleted =
                                                      value;
                                                });
                                                _saveTasks();
                                              },
                                              onDeleteItem: () {
                                                setState(() {
                                                  todo.removeAt(index);
                                                });
                                                _saveTasks();
                                              },
                                            );
                                          },
                                        ),
                                      ),
                                      // Mevcut kodunuz
                                    ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
