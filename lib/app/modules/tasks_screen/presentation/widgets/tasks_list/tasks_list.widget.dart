import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/lib.exports.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: TasksController.I,
      builder: (context, state, child) {
        if (state is TasksLoaded) {
          List<Task> tasksList = state.tasksList;

          return Container(
            width: 1.sw,
            padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
            child: ListView.builder(
              itemCount: tasksList.length,
              itemBuilder: (context, index) {
                Task task = tasksList[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 24.sp),
                  child: Text("TITULO: ${task.title}"),
                );
              },
            ),
          );
        } else {
          return Container();
        }
      },
    );
  }
}
