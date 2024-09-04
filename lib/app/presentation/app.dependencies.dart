import 'package:get_it/get_it.dart';
import 'package:tasks_app/lib.exports.dart';

class AppDependencies {
  late TasksController? tasksController;

  AppDependencies({
    this.tasksController,
  });

  bind() {
    tasksController ??= TasksController(appController: GetIt.I.get());
    GetIt.I.registerFactory<TasksController>(() => tasksController!);
  }
}
