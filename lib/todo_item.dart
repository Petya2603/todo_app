import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_app/model/task.dart';
import 'package:todo_app/screns/add_compl.dart';

class Todoitem extends StatefulWidget {
  const Todoitem({super.key, required this.task});
  final Task task;

  @override
  State<Todoitem> createState() => _TodoitemState();
}

class _TodoitemState extends State<Todoitem> {
  String? title;
  String? date;
  String? time;
  String? description;
  bool isChecked = false;
  @override
  Widget build(BuildContext taskJson) {
    return Card(
      color: widget.task.isCompleted
          ? const Color.fromARGB(255, 135, 95, 245)
          : const Color.fromARGB(255, 184, 180, 238),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(7)),
      child: Padding(
        padding: const EdgeInsets.all(5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Padding(
              padding: const EdgeInsets.all(2),
              child: Text(
                widget.task.time,
                style: const TextStyle(
                  fontSize: 15,
                  fontFamily: 'Raleway',
                ),
              ),
            ),
            Expanded(
              child: Column(
                children: [
                  Text(
                    widget.task.title,
                    style: TextStyle(
                      decoration: widget.task.isCompleted
                          ? TextDecoration.none
                          : TextDecoration.none,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Raleway',
                      fontSize: 20,
                    ),
                  ),
                  Text(
                    widget.task.description,
                    style: TextStyle(
                        fontFamily: 'Raleway',
                        decoration: widget.task.isCompleted
                            ? TextDecoration.none
                            : TextDecoration.none),
                  ),
                ],
              ),
            ),
            Checkbox(
              value: isChecked,
              onChanged: (val) => {
                setState(() {
                  widget.task.isCompleted = !widget.task.isCompleted;
                  isChecked = val!;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => add_comp(
                        addNewTask: (Task newTask) {},
                      ),
                    ),
                  );
                })
              },
            ),
          ],
        ),
      ),
    );
  }
}
