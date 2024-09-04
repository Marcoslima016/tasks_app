import 'dart:convert';

import 'package:flutter/material.dart';

class Task {
  final int id;
  String title;
  String description;
  final DateTime dateTimeCreation;
  bool done;

  String get dateTimeDisplay {
    String day = dateTimeCreation.day.toString();
    String month = dateTimeCreation.month.toString();
    String year = dateTimeCreation.year.toString();
    String date = "${day.length < 2 ? "0" : ""}$day/${month.length < 2 ? "0" : ""}$month/$year";

    String hour = dateTimeCreation.hour.toString();
    String minute = dateTimeCreation.minute.toString();
    String time = "${hour.length < 2 ? "0" : ""}$hour:${minute.length < 2 ? "0" : ""}$minute";

    return "$date às $time";
  }

  Task({
    required this.id,
    required this.title,
    required this.description,
    required this.dateTimeCreation,
    this.done = false,
  });

  Color get doneFlagColor {
    if (done) {
      return const Color.fromARGB(255, 27, 60, 170);
    } else {
      return Colors.red;
    }
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'dateTimeCreation': dateTimeCreation.toIso8601String(),
      'done': done,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      dateTimeCreation: DateTime.parse(map['dateTimeCreation']),
      done: map['done'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
