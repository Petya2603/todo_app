// ignore: unused_import
import 'dart:convert';

class Task {
  Task({
    required this.time,
    required this.title,
    required this.description,
    this.isCompleted = false, // Default değer olarak false
    required this.date,
  });

  final String time;
  final String title;
  final String description;
  bool isCompleted; // `isCompleted` değeri değiştirilebilir
  final String date;



  get assignee => null;

  // `toJson` fonksiyonunu `Map<String, dynamic>` türünde döndürerek, JSON kodunu daha kolay çalıştırır hale getiriyoruz.
  Map<String, dynamic> toJson() {
    return {
      'time': time,
      'title': title,
      'description': description,
      'isCompleted': isCompleted,
      'date': date,
    };
  }

  // `fromJson` fonksiyonunu `Map<String, dynamic>` türünde veri alması için ayarlıyoruz.
  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      time: json['time'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      isCompleted: json['isCompleted'] as bool,
      date: json['date'] as String,
    );
  }

  // `fromMap` fonksiyonu gereksiz, `fromJson` fonksiyonu ile aynı görevi görüyor.
}
