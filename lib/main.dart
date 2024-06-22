import 'package:flutter/material.dart';
import 'package:todo_app/screns/home.dart';

void main() {
  runApp(const Todo_List());
}

// ignore: camel_case_types
class Todo_List extends StatefulWidget {
  const Todo_List({super.key});

  @override
  State<Todo_List> createState() => _Todo_ListState();
}

// ignore: camel_case_types
class _Todo_ListState extends State<Todo_List> {
  bool isChecked = false;
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
