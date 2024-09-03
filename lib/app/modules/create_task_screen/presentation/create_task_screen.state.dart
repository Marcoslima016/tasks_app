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
}

class FillState extends ICreateTaskScreenState {
  //
}

class CompleteState extends ICreateTaskScreenState {
  //
}
