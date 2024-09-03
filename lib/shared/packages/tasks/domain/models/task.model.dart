import 'dart:convert';

class Task {
  late final int id;
  String title;
  String description;
  final DateTime dateTimeCreation;
  bool done;
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
      'dateTimeCreation': dateTimeCreation.millisecondsSinceEpoch,
      'done': done,
    };
  }

  factory Task.fromMap(Map<String, dynamic> map) {
    return Task(
      id: map['id'],
      title: map['title'] ?? '',
      description: map['description'] ?? '',
      dateTimeCreation: DateTime.fromMillisecondsSinceEpoch(map['dateTimeCreation']),
      done: map['done'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory Task.fromJson(String source) => Task.fromMap(json.decode(source));
}
