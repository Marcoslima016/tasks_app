import 'package:get_it/get_it.dart';
import 'package:tasks_app/lib.exports.dart';

class CreateTaskScreenDependencies {
  late final IValidateFormOnInputUpdate? _usecaseValidateFormOnInputUpdate;
  IValidateFormOnInputUpdate get usecaseValidateFormOnInputUpdate => GetIt.I.get<IValidateFormOnInputUpdate>();

  late final CreateTaskScreenController controller;

  CreateTaskScreenDependencies({
    required this.controller,
    IValidateFormOnInputUpdate? usecaseValidateFormOnInputUpdate,
  }) {
    _usecaseValidateFormOnInputUpdate = usecaseValidateFormOnInputUpdate;
  }

  bind() {
    GetIt.I.registerFactory<IValidateFormOnInputUpdate>(
      () => _usecaseValidateFormOnInputUpdate ?? ValidateFormOnInputUpdate(createTaskScreenPresenter: controller),
    );
  }
}
