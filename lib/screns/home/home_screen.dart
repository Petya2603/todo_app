import 'dart:core';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one_clock/one_clock.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screns/completed_task/completed_task_screen.dart'; // Yeni ekran için import
import 'package:todo_app/screns/add_new/add_new_screen.dart';
import 'package:todo_app/screns/home/home_controller.dart';
import 'package:todo_app/todo_item.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  final HomeScreenController homecontroller = Get.put(HomeScreenController());

  @override
  void initState() {
    super.initState();
    homecontroller.loadTasks();
  }

  @override
  // ignore: avoid_renaming_method_parameters
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
                        Get.to(() => Addnew(
                              addNewTask: (Task newTask) {},
                            ));
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
                      onPressed: () {},
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
                              Obx(
                                () => Expanded(
                                  child: ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: homecontroller.todo.length,
                                    itemBuilder: (context, index) {
                                      return Todoitem(
                                        task: homecontroller.todo[index],
                                        
                                      );
                                    },
                                  ),
                                ),
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
