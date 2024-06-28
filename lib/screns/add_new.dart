import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';

// ignore: camel_case_types
class Add_new extends StatefulWidget {
  const Add_new({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;
  @override
  State<Add_new> createState() => _Add_newState();
}

// ignore: camel_case_types
class _Add_newState extends State<Add_new> {
  TextEditingController titleController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController timeController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  Tasktype taskType = Tasktype.note;

  @override
  Widget build(BuildContext context) {
    double deviceHeight = MediaQuery.of(context).size.height;
    double deviceWidth = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                width: deviceWidth,
                height: deviceHeight / 9,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/header2.jpg"),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Row(
                  children: [
                    IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.close,
                        size: 40,
                        color: Colors.white,
                      ),
                    ),
                    const Expanded(
                      child: Text(
                        "Add new task",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontFamily: 'Raleway',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                padding: EdgeInsets.only(top: 10),
                child: Text(
                  "Task title",
                  style: TextStyle(
                      fontFamily: 'Raleway', fontWeight: FontWeight.bold),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 40, vertical: 20),
                child: TextField(
                  controller: titleController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Color.fromARGB(135, 230, 230, 230),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    const Text(
                      "Category",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Category Selected",
                              style: TextStyle(
                                fontFamily: 'Raleway',
                              ),
                            ),
                            duration: Duration(milliseconds: 300),
                          ),
                        );
                        setState(() {
                          taskType = Tasktype.note;
                        });
                      },
                      child: const Icon(
                        Icons.emoji_food_beverage_rounded,
                        size: 40,
                        color: Color.fromARGB(255, 125, 80, 248),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              "Category Selected",
                              style: TextStyle(
                                fontFamily: 'Raleway',
                              ),
                            ),
                            duration: Duration(milliseconds: 300),
                          ),
                        );
                        setState(() {
                          taskType = Tasktype.calendar;
                        });
                      },
                      child: const Icon(
                        Icons.library_music_sharp,
                        size: 40,
                        color: Color.fromARGB(255, 125, 80, 248),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Category Selected"),
                            duration: Duration(milliseconds: 300),
                          ),
                        );
                        setState(() {
                          taskType = Tasktype.contest;
                        });
                      },
                      child: const Icon(
                        Icons.directions_run_rounded,
                        size: 40,
                        color: Color.fromARGB(255, 125, 80, 248),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 30),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Date",
                            style: TextStyle(
                              fontFamily: 'Raleway',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: dateController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(135, 230, 230, 230),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          const Text(
                            "Time",
                            style: TextStyle(
                              fontFamily: 'Raleway',
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: TextField(
                              controller: timeController,
                              decoration: const InputDecoration(
                                filled: true,
                                fillColor: Color.fromARGB(135, 230, 230, 230),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const Padding(
                  padding: EdgeInsets.only(top: 5),
                  child: Text(
                    "Notes",
                    style: TextStyle(
                      fontFamily: 'Raleway',
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.all(15.15),
                child: SizedBox(
                  height: 200,
                  child: TextField(
                    controller: descriptionController,
                    expands: true,
                    maxLines: null,
                    decoration: const InputDecoration(
                      filled: true,
                      fillColor: Color.fromARGB(135, 230, 230, 230),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(100.0),
                    ),
                    foregroundColor: Colors.white,
                    backgroundColor: const Color.fromARGB(255, 73, 41, 136),
                  ),
                  onPressed: () async {
                    Task newTask = Task(
                      title: titleController.text,
                      description: descriptionController.text,
                      isCompleted: false,
                      date: dateController.text,
                      time: timeController.text,
                    );
                    widget.addNewTask(newTask);
                    Navigator.pop(context);
                  },
                  child: const Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 24.0, vertical: 10.0),
                    child: Text(
                      "Save",
                      style: TextStyle(
                        fontFamily: 'Raleway',
                        fontWeight: FontWeight.bold,
                      ),
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
