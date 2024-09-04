import 'dart:convert';

class Task {
  late final int id;
  String title;
  String description;
  final DateTime dateTimeCreation;
  bool done;

  String get dateTimeDisplay {
    String day = dateTimeCreation.day.toString();
    String month = dateTimeCreation.month.toString();
    String year = dateTimeCreation.year.toString();
    String date = "${day.length < 2 ? "0" : ""}$day/${month.length < 2 ? "0" : ""}$day/$year";

    String hour = dateTimeCreation.hour.toString();
    String minute = dateTimeCreation.minute.toString();
    String time = "${hour.length < 2 ? "0" : ""}$hour:${minute.length < 2 ? "0" : ""}$minute";

    return "$date $time";
  }

  Task({
    int? id,
    required this.title,
    required this.description,
    required this.dateTimeCreation,
    this.done = false,
  }) {
    if (id != null) {
      this.id = id;
    } else {
      this.id = DateTime.now().millisecondsSinceEpoch;
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
