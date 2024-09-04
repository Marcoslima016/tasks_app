import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/lib.exports.dart';

class ASpinner extends StatelessWidget {
  const ASpinner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(18.sp),
      decoration: BoxDecoration(
        color: AppTheme.colors.background,
        borderRadius: BorderRadius.circular(16.sp),
      ),
      child: CircularProgressIndicator(
        backgroundColor: AppTheme.colors.primary,
        strokeWidth: 6.sp,
        valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[500]!),
      ),
    );
  }
}
