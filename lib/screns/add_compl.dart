import 'package:flutter/material.dart';
import 'package:one_clock/one_clock.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/todo_item.dart';

// ignore: camel_case_types
class add_comp extends StatefulWidget {
  const add_comp({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;

  @override
  State<add_comp> createState() => _nameState();
}

// ignore: camel_case_types
class _nameState extends State<add_comp> {
  List<Task> completed = [
    Task(
      time: "12:00 13:00",
      title: "Go to party",
      description: "Attend to part",
      isCompleted: false,
    ),
    Task(
      time: "12:00 13:00",
      title: "Go to party",
      description: "Attend to part",
      isCompleted: false,
    ),
    Task(
      time: "12:00 13:00",
      title: "Run 5k",
      description: "Run 5 kilometers",
      isCompleted: false,
    ),
    Task(
      time: "12:00 13:00",
      title: "Run 5k",
      description: "Run 5 kilometers",
      isCompleted: false,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/header1.jpg"),
                fit: BoxFit.cover,
              ),
            ),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 40),
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
                      Expanded(
                        child: DigitalClock(
                            showSeconds: true,
                            isLive: true,
                            textScaleFactor: 1.0,
                            digitalClockTextColor: Colors.white,
                            decoration: const BoxDecoration(
                                shape: BoxShape.rectangle,
                                borderRadius:
                                    BorderRadius.all(Radius.circular(15))),
                            datetime: DateTime.now()),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(50),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          const Padding(
                            padding: EdgeInsets.only(left: 20),
                            child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                "My completed tasks",
                                style: TextStyle(
                                    fontFamily: 'Raleway',
                                    fontWeight: FontWeight.bold,
                                    fontSize: 18),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.all(20),
                              child: SingleChildScrollView(
                                child: ListView.builder(
                                  primary: false,
                                  shrinkWrap: true,
                                  itemCount: completed.length,
                                  itemBuilder: (context, index) {
                                    return Todoitem(task: completed[index]);
                                  },
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            )),
      ),
    );
  }
}
