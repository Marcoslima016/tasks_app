import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/lib.exports.dart';

class CreateTaskScreen extends StatefulWidget with AppScreen {
  const CreateTaskScreen({super.key});

  static String tag = "/create_task_screen";

  @override
  String get screenTag => tag;

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: _buildBody(),
    );
  }

  PreferredSizeWidget _buildAppBar() {
    return AppBar(
      centerTitle: false,
      title: Text(
        "Criar nova tareffa",
        style: TextStyle(
          fontFamily: "Figtree",
          fontWeight: FontWeight.w600,
          color: const Color.fromARGB(255, 25, 25, 25),
          fontSize: 23.sp,
        ),
      ),
      elevation: 0,
      leading: Container(),
      leadingWidth: 0,
      backgroundColor: AppTheme.colors.surface,
    );
  }

  Widget _buildBody() {
    return Container();
  }
}
