import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'package:tasks_app/lib.exports.dart';

import 'create_task_screen.controller.dart';

abstract class ICreateTaskScreenState {
  Future onInputUpdate(
    CreateTaskScreenController controller,
  ) async {
    bool formValidated = await controller.dependencies!.usecaseValidateFormOnInputUpdate!();
    if (formValidated) {
      controller.value = CompleteState();
    } else {
      controller.value = FillState();
    }
  }

  Future onTapCreate(
    CreateTaskScreenController controller,
    BuildContext context,
  ) async {}
}

class FillState extends ICreateTaskScreenState {
  @override
  Future onTapCreate(
    CreateTaskScreenController controller,
    BuildContext context,
  ) async {
    if (kDebugMode) print("Formulario em estado 'Fill'. Não é possível avançar");
  }
}

class CompleteState extends ICreateTaskScreenState {
  @override
  Future onTapCreate(
    CreateTaskScreenController controller,
    BuildContext context,
  ) async {
    try {
      await controller.dependencies!.usecaseOnTapCreateTask!(
        context,
      );
    } catch (e) {
      rethrow;
    }
  }
}
