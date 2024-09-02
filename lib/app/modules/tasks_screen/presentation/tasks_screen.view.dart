import 'package:flutter/material.dart';
import 'package:tasks_app/lib.exports.dart';

class TasksScreen extends StatefulWidget with AppScreen {
  const TasksScreen({super.key});

  static String tag = "/tasks_screen";

  @override
  String get screenTag => tag;

  @override
  State<TasksScreen> createState() => _TasksScreenState();
}

class _TasksScreenState extends State<TasksScreen> {
  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
