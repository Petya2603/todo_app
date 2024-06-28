import 'dart:convert';

class Task {
  Task({
    required this.time,
    required this.title,
    required this.description,
    required this.isCompleted, required String date,
  });
  final String time;
  final String title;
  final String description;
  bool isCompleted;

  String toJson() {
    return jsonEncode({
      'time': time,
      'title': title,
      'description': description,
    });
  }

  static fromJson(String task) {}
}
