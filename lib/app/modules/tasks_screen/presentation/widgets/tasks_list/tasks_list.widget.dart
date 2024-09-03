import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class TasksList extends StatelessWidget {
  const TasksList({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ListView.builder(
        itemCount: 23,
        itemBuilder: (context, index) {
          return Container(
            margin: EdgeInsets.symmetric(vertical: 24.sp),
            child: const Text(""),
          );
        },
      ),
    );
  }
}
