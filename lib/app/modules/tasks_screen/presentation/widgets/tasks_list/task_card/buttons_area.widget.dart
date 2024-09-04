import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_app/lib.exports.dart';

class TaskCardButtonsArea extends StatelessWidget {
  final Task task;

  const TaskCardButtonsArea({
    super.key,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        task.done
            ? Container()
            : Row(
                children: [
                  _buildButton(
                    Icons.check,
                    () {
                      TasksController.I.concludeTask(
                        GetIt.I.get<BuildContext>(instanceName: TasksScreen.tag),
                        task,
                      );
                    },
                  ),
                  SizedBox(width: 14.w),
                ],
              ),
        _buildButton(
          Icons.delete_outlined,
          () {},
        ),
      ],
    );
  }

  Widget _buildButton(
    IconData icon,
    Function() onTap,
  ) {
    return GestureDetector(
      onTap: () {
        onTap();
      },
      child: Container(
        width: 24.sp,
        height: 24.sp,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 249, 249, 249),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 218, 218, 218),
            size: 15.5.sp,
          ),
        ),
      ),
    );
  }
}
