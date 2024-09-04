import 'package:get_it/get_it.dart';
import 'package:tasks_app/lib.exports.dart';

class CreateTaskScreenDependencies {
  late IValidateFormOnInputUpdate? usecaseValidateFormOnInputUpdate;
  late IOnTapCreateTask? usecaseOnTapCreateTask;
  late final CreateTaskScreenController controller;

  CreateTaskScreenDependencies({
    required this.controller,
    this.usecaseValidateFormOnInputUpdate,
    this.usecaseOnTapCreateTask,
  });

  void bind() {
    usecaseValidateFormOnInputUpdate ??= ValidateFormOnInputUpdate(createTaskScreenPresenter: controller);
    GetIt.I.registerFactory<IValidateFormOnInputUpdate>(() => usecaseValidateFormOnInputUpdate!);

    usecaseOnTapCreateTask ??= OnTapCreateTask(
      createTaskScreenPresenter: controller,
      tasksPresenter: TasksController.I,
      appPresenter: AppController.I,
    );
    GetIt.I.registerFactory<IOnTapCreateTask>(() => usecaseOnTapCreateTask!);
  }

  void dispose() {
    GetIt.I.unregister<IOnTapCreateTask>();
    GetIt.I.unregister<IValidateFormOnInputUpdate>();
  }
}
