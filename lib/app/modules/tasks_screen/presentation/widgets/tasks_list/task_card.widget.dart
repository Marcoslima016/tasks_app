import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasks_app/lib.exports.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({
    super.key,
    required this.task,
  });

  static final double _borderRadius = 18.sp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(bottom: 22.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(_borderRadius),
        child: Stack(
          children: [
            _buildCardContainer(),
            _buildFlag(),
          ],
        ),
      ),
    );
  }

  Widget _buildCardContainer() {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.only(top: 14.sp, bottom: 14.sp, left: 24.sp, right: 14.sp),
      decoration: BoxDecoration(
        border: Border.all(
          color: const Color.fromARGB(255, 241, 241, 241),
          width: 1.1.sp,
          strokeAlign: BorderSide.strokeAlignCenter,
        ),
        borderRadius: BorderRadius.circular(_borderRadius),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          AText.headingRegular(task.title),
          SizedBox(height: 5.sp),
          AText.bodyRegular(task.description),
          SizedBox(height: 14.sp),
          AText.labelSmall("00/00/00"),
        ],
      ),
    );
  }

  Widget _buildFlag() {
    return Positioned(
      bottom: 0,
      top: 0,
      child: Container(
        width: 5.sp,
        decoration: BoxDecoration(
          color: Colors.red,

          // borderRadius: BorderRadius.only(
          //   topLeft: Radius.circular(_borderRadius),
          //   bottomLeft: Radius.circular(_borderRadius),
          // ),
        ),
      ),
    );
  }
}
