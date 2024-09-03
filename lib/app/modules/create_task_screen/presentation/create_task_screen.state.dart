import 'package:flutter/foundation.dart';

import 'package:tasks_app/lib.exports.dart';

import 'create_task_screen.controller.dart';

abstract class ICreateTaskScreenState {
  Future onInputUpdate(
    CreateTaskScreenController controller,
  ) async {
    bool formValidated = await controller.dependencies.usecaseValidateFormOnInputUpdate();
    if (formValidated) {
      controller.value = CompleteState();
    } else {
      controller.value = FillState();
    }
  }

  Future onTapCreate(CreateTaskScreenController controller) async {}
}

class FillState extends ICreateTaskScreenState {
  @override
  Future onTapCreate(CreateTaskScreenController controller) async {
    if (kDebugMode) print("Formulario em estado 'Fill'. Não é possível avançar");
  }
}

class CompleteState extends ICreateTaskScreenState {
  @override
  Future onTapCreate(CreateTaskScreenController controller) async {
    try {
      await TasksController.I.addNewTaskToList(
        PayloadNewTask(
          title: controller.inputTitle.text,
          description: controller.inputDescription.text,
        ),
      );
    } catch (e) {
      rethrow;
    }
  }
}
