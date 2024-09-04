import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/lib.exports.dart';

import 'buttons_area.widget.dart';

class TaskCard extends StatelessWidget {
  final Task task;

  const TaskCard({
    super.key,
    required this.task,
  });

  static final double _borderRadius = 8.sp;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 1.sw,
      margin: EdgeInsets.only(bottom: 18.sp),
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
      padding: EdgeInsets.only(top: 14.sp, bottom: 14.sp, left: 20.sp, right: 14.sp),
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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AText.headingRegular(task.title),
              const TaskCardButtonsArea(),
            ],
          ),
          SizedBox(height: 4.sp),
          AText.bodyRegular(task.description),
          SizedBox(height: 16.sp),
          AText.labelSmall(task.dateTimeDisplay),
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
        decoration: const BoxDecoration(
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
