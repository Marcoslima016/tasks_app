import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TaskCardButtonsArea extends StatelessWidget {
  const TaskCardButtonsArea({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        _buildButton(Icons.check),
        SizedBox(width: 10.w),
        _buildButton(Icons.delete),
      ],
    );
  }

  Widget _buildButton(IconData icon) {
    return Container(
      width: 22.sp,
      height: 22.sp,
      decoration: BoxDecoration(
        color: Color.fromARGB(255, 247, 247, 247),
        shape: BoxShape.circle,
      ),
      child: Center(
        child: Icon(
          icon,
          color: Color.fromARGB(255, 226, 226, 226),
          size: 14.sp,
        ),
      ),
    );
  }
}
