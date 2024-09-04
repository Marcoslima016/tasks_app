import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
        _buildButton(
          Icons.delete,
          () {},
        ),
        SizedBox(width: 14.w),
        _buildButton(
          Icons.check,
          () {
            TasksController.I.concludeTask(context, task);
          },
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
        width: 22.sp,
        height: 22.sp,
        decoration: const BoxDecoration(
          color: Color.fromARGB(255, 247, 247, 247),
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Icon(
            icon,
            color: const Color.fromARGB(255, 226, 226, 226),
            size: 14.sp,
          ),
        ),
      ),
    );
  }
}
