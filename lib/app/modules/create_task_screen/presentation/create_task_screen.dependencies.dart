import 'package:get_it/get_it.dart';
import 'package:tasks_app/lib.exports.dart';

class CreateTaskScreenDependencies {
  late final IValidateFormOnInputUpdate? _usecaseValidateFormOnInputUpdate;
  IValidateFormOnInputUpdate get usecaseValidateFormOnInputUpdate => GetIt.I.get<IValidateFormOnInputUpdate>();

  late final IOnTapCreateTask? _usecaseOnTapCreateTask;
  IOnTapCreateTask get usecaseOnTapCreateTask => GetIt.I.get<IOnTapCreateTask>();

  late final CreateTaskScreenController controller;

  CreateTaskScreenDependencies({
    required this.controller,
    IValidateFormOnInputUpdate? usecaseValidateFormOnInputUpdate,
    IOnTapCreateTask? usecaseOnTapCreateTask,
  }) {
    _usecaseValidateFormOnInputUpdate = usecaseValidateFormOnInputUpdate;
    _usecaseOnTapCreateTask = usecaseOnTapCreateTask;
  }

  bind() {
    GetIt.I.registerFactory<IValidateFormOnInputUpdate>(
      () => _usecaseValidateFormOnInputUpdate ?? ValidateFormOnInputUpdate(createTaskScreenPresenter: controller),
    );

    GetIt.I.registerFactory<IOnTapCreateTask>(
      () =>
          _usecaseOnTapCreateTask ??
          OnTapCreateTask(
            createTaskScreenPresenter: controller,
            tasksPresenter: TasksController.I,
            appPresenter: AppController.I,
          ),
    );
  }
}
