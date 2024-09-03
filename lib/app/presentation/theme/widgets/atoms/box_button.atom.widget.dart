import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:tasks_app/app/app.exports.dart';

class ABoxButton extends StatelessWidget {
  final Future Function() onClick;

  final String text;

  final bool active;

  late final Color corPrincipal;

  late final Color corTexto;

  ABoxButton.primary({
    super.key,
    required this.onClick,
    required this.text,
    required this.active,
  }) {
    corPrincipal = AppTheme.colors.primary;
    corTexto = Colors.grey[800]!;
  }

  ABoxButton.cancel({
    super.key,
    required this.onClick,
    required this.text,
    required this.active,
  }) {
    corPrincipal = Colors.red[600]!;
    corTexto = Colors.grey[50]!;
  }

  @override
  Widget build(BuildContext context) {
    Color backgroundColor;
    Color textColor;

    if (active) {
      backgroundColor = AppTheme.colors.primary;
      textColor = const Color.fromARGB(255, 241, 241, 241);
    } else {
      backgroundColor = Colors.grey[300]!;
      textColor = const Color.fromARGB(255, 241, 241, 241);
    }

    return SizedBox(
      width: 1.sw,
      child: ElevatedButton(
        style: ButtonStyle(
            padding: MaterialStateProperty.all(
              EdgeInsets.only(top: 24.h, bottom: 24.h),
            ),
            backgroundColor: MaterialStateProperty.all(backgroundColor),
            shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)))),
        onPressed: active ? onClick : () {},
        child: Text(
          text,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
