import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/lib.exports.dart';

class MTextInput extends StatelessWidget {
  const MTextInput({
    required this.controller,
    required this.hintText,
    this.inputFormatters,
    this.obscure = false,
    this.keyboardType,
    super.key,
  });
  static BorderRadius borderRadius = BorderRadius.circular(5.w);

  final TextEditingController controller;

  final bool obscure;

  /// Texto exibido quando não tem valor inserido no input.
  ///
  /// Serve para indicar ao usuário qual informação deve ser inserida no input,
  /// além de poder exibir um exemplo.
  final String hintText;

  final List<TextInputFormatter>? inputFormatters;

  final TextInputType? keyboardType;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscure,
      inputFormatters: inputFormatters,
      keyboardType: keyboardType,
      style: const TextStyle(
        color: Color.fromARGB(255, 58, 58, 58),
        fontWeight: FontWeight.w300,
      ),
      decoration: InputDecoration(
        fillColor: AppTheme.colors.surface,
        filled: true,
        hintText: "",
        label: Container(
          color: Colors.transparent,
          child: Padding(
            padding: const EdgeInsets.only(top: 0),
            child: Text(
              hintText,
              style: TextStyle(
                fontSize: 20.h,
                color: Color.fromARGB(255, 186, 186, 186),
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
        ),
        alignLabelWithHint: true,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintStyle: TextStyle(
          fontSize: 13.sp,
          color: const Color.fromARGB(255, 191, 191, 191),
          fontWeight: FontWeight.w400,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            color: const Color.fromARGB(255, 234, 234, 234),
            width: 1.4.sp,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: borderRadius,
          borderSide: BorderSide(
            width: 1.8.sp,
            color: AppTheme.colors.primary,
          ),
        ),
      ),
    );
  }
}
