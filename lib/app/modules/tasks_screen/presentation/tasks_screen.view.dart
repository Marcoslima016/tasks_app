import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: false,
      title: Text(
        "Minhas tarefas",
        style: TextStyle(
          fontFamily: "Figtree",
          fontWeight: FontWeight.w800,
          color: const Color.fromARGB(255, 46, 46, 46),
          fontSize: 20.sp,
        ),
      ),
      elevation: 0,
      leading: Container(),
      actions: [
        Padding(
          padding: EdgeInsets.only(right: 16.sp, top: 15.sp, bottom: 15.sp),
          child: InkWell(
            onTap: () {
              TasksController.I.onTapGoToCreateTask();
            },
            child: const Icon(
              Icons.add,
              color: Color.fromARGB(255, 130, 130, 130),
            ),
          ),
        ),
      ],
      leadingWidth: 0,
      backgroundColor: AppTheme.colors.surface,
    );
  }

  Widget _buildBody() {
    return const TasksList();
  }
}
