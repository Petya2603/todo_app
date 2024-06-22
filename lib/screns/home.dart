import 'dart:core';
import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screns/add_compl.dart';
import 'package:todo_app/screns/add_new.dart';
import 'package:todo_app/todo_item.dart';
import 'dart:convert';

void _displayTask(String jsonString) {
  json.decode(jsonString);
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String? title;
  String? date;
  String? time;
  String? description;
  bool isChecked = false;

  List<Task> todo = [
    Task(
      time: "12:00-13:00",
      title: "Study Lessons",
      description: "Study COMP117",
      isCompleted: false,
    ),
    Task(
      time: "11:00-13:40",
      title: "Go to party",
      description: "Attend to part",
      isCompleted: false,
    ),
  ];
  void _barlag() async {
    final prefs = await SharedPreferences.getInstance();
    String? taskJson = prefs.getString("task");
    setState(() {});
  }

  @override
  void initState() {
    _barlag();
    super.initState();
  }

  void _saveTask(Task newTask) async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      todo.add(newTask);
    });
    String taskJson = newTask.toJson();
    await prefs.setString("task", taskJson);
    setState(() {
      todo.add(newTask);
    });
  }

  void addNewTask(Task newTask) {
    setState(() {
      todo.add(newTask);
    });
  }

  @override
  Widget build(BuildContext taskJson) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("lib/images/header2.jpg"),
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
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (contex) => add_comp(
                              addNewTask: (newTask) => addNewTask(newTask),
                            ),
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
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 135, 95, 245),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              width: 50,
                              height: 50,
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Mon",
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 135, 95, 245),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              width: 50,
                              height: 50,
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Sun",
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 135, 95, 245),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              width: 50,
                              height: 50,
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Tue",
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 135, 95, 245),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              width: 50,
                              height: 50,
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Wed",
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: const BoxDecoration(
                                color: Color.fromARGB(255, 135, 95, 245),
                                borderRadius: BorderRadius.all(
                                  Radius.circular(10),
                                ),
                              ),
                              width: 50,
                              height: 50,
                              child: const Align(
                                alignment: Alignment.center,
                                child: Text(
                                  "Fre",
                                  style: TextStyle(
                                    fontFamily: 'Raleway',
                                    color: Colors.white,
                                    fontSize: 15,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
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
                        Padding(
                          padding: const EdgeInsets.only(top: 20),
                          child: SingleChildScrollView(
                            child: ListView.builder(
                              primary: false,
                              shrinkWrap: true,
                              itemCount: todo.length,
                              itemBuilder: (context, index) {
                                return (Todoitem(task: todo[index]));
                              },
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ), // Expanded(
            ],
          ),
        ),
      ),
    );
  }
}
