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

          if (tasksList.isNotEmpty) {
            return Container(
              width: 1.sw,
              padding: EdgeInsets.only(left: 24.sp, right: 24.sp),
              child: ListView.builder(
                itemCount: tasksList.length,
                itemBuilder: (context, index) {
                  Task task = tasksList[index];

                  return SizedBox(
                    width: 1.sw,
                    child: Column(
                      children: [
                        index == 0 ? SizedBox(height: 24.sp) : Container(),
                        TaskCard(task: task),
                      ],
                    ),
                  );
                },
              ),
            );
          } else {
            return Center(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 24.sp),
                child: AText.labelRegular("Nenhuma tarefa foi criada."),
              ),
            );
          }
        } else {
          return Container();
        }
      },
    );
  }
}
