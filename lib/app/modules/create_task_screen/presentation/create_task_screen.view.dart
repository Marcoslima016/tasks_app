import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_app/lib.exports.dart';

import 'create_task_screen.controller.dart';

class CreateTaskScreen extends StatefulWidget with AppScreen {
  const CreateTaskScreen({super.key});

  static String tag = "/create_task_screen";

  @override
  String get screenTag => tag;

  @override
  State<CreateTaskScreen> createState() => _CreateTaskScreenState();
}

class _CreateTaskScreenState extends State<CreateTaskScreen> {
  CreateTaskScreenController controller = CreateTaskScreenController();

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
        "Criar nova tarefa",
        style: TextStyle(
          fontFamily: "Figtree",
          fontWeight: FontWeight.w600,
          color: const Color.fromARGB(255, 25, 25, 25),
          fontSize: 23.sp,
        ),
      ),
      elevation: 0,
      leadingWidth: 0,
      backgroundColor: AppTheme.colors.surface,
    );
  }

  Widget _buildBody() {
    return Container(
      width: 1.sw,
      padding: EdgeInsets.symmetric(horizontal: 24.sp),
      child: Form(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              children: [
                SizedBox(height: 0.11.sh),
                MTextInput(
                  hintText: "Titulo",
                  controller: controller.inputTitle,
                ),
                SizedBox(height: 45.sp),
                MTextInput(
                  hintText: "Descrição",
                  controller: controller.inputDescription,
                ),
              ],
            ),

            //

            ValueListenableBuilder(
              valueListenable: controller,
              builder: (context, state, child) {
                return Padding(
                  padding: EdgeInsets.only(bottom: 24.sp),
                  child: ABoxButton.primary(
                    onClick: () async {
                      controller.onTapCreate(context);
                    },
                    text: "Criar tarefa",
                    active: state is CompleteState ? true : false,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
