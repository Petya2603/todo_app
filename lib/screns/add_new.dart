import 'package:flutter/material.dart';
import 'package:todo_app/constants/tasktype.dart';
import 'package:todo_app/model/task.dart';
// ignore: depend_on_referenced_packages
import 'package:intl/intl.dart';

// ignore: camel_case_types
class Add_new extends StatefulWidget {
  const Add_new({super.key, required this.addNewTask});
  final void Function(Task newTask) addNewTask;
  @override
  State<Add_new> createState() => _Add_newState();
}

// ignore: camel_case_types
class _Add_newState extends State<Add_new> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController titleController = TextEditingController();
  DateFormat formatter = DateFormat('dd.MM');
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
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
                          fontFamily: 'Gilroy',
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Form(
                key: _formKey, // Formu geçerli hale getirmek için
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: titleController,
                                decoration: InputDecoration(
                                    labelText: "Task Title",
                                    labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 47, 47, 47),
                                      fontFamily: 'Raleway',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 106, 29, 206),
                                        width: 2.0,
                                      ),
                                    ),
                                    fillColor: Colors.grey[100]),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Task title cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: IconButton(
                                    onPressed: () async {
                                      // Use showDatePicker instead of showTimePicker
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: DateTime.now(),
                                        firstDate: DateTime(2000),
                                        lastDate: DateTime(2100),
                                      );

                                      if (pickedDate != null) {
                                        // Update the text field with the selected date in a formatted string
                                        dateController.text = pickedDate
                                            .toString()
                                            .split(' ')
                                            .first; // Get only the date part
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.calendar_today,
                                      size: 40,
                                      color: Color.fromARGB(255, 106, 29, 206),
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
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Raleway',
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: IconButton(
                                    onPressed: () async {
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );

                                      if (pickedTime != null) {
                                        // Format the TimeOfDay object to a String in HH:mm format
                                        final formattedTime =
                                            // ignore: use_build_context_synchronously
                                            pickedTime.format(context);
                                        timeController.text = formattedTime;
                                      }
                                    },
                                    icon: const Icon(
                                      Icons.timelapse,
                                      size: 40,
                                      color: Color.fromARGB(255, 106, 29, 206),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 60),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 30),
                        child: Row(
                          children: [
                            Expanded(
                              child: TextFormField(
                                controller: descriptionController,
                                maxLines: 5,
                                decoration: InputDecoration(
                                    labelText: " Description ",
                                    labelStyle: const TextStyle(
                                      color: Color.fromARGB(255, 47, 47, 47),
                                      fontFamily: 'Raleway',
                                    ),
                                    border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      borderSide: const BorderSide(
                                        color:
                                            Color.fromARGB(255, 106, 29, 206),
                                        width: 2.0,
                                      ),
                                    ),
                                    fillColor: Colors.grey[100]),
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Task title cannot be empty';
                                  }
                                  return null;
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 30),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            // Form geçerliyse yeni bir görev oluşturun ve addNewTask'a geçirin
                            Task newTask = Task(
                              title: titleController.text,
                              date: dateController.text,
                              time: timeController.text,
                              description: descriptionController.text,
                            );
                            widget.addNewTask(newTask);
                            Navigator.of(context).pop();
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor:
                              const Color.fromARGB(255, 106, 29, 206),
                          minimumSize: const Size(200, 50),
                        ),
                        child: const Text(
                          "Save",
                          style: TextStyle(
                              fontFamily: 'Gilroy',
                              fontWeight: FontWeight.normal,
                              fontSize: 18,
                              color: Colors.white),
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
    );
  }
}
