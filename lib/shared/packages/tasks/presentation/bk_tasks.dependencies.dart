import 'package:auto_injector/auto_injector.dart';
import 'package:tasks_app/lib.exports.dart';

class TasksDependencies {
  ITasksDatasource? Function()? tasksDatasource;

  ITasksRepository? Function()? tasksRepository;

  IInitTasks? Function()? usecaseInitTasks;

  IOnTapGoToCreateTask? Function()? usecaseOnTapGoToCreateTask;

  IAddNewTask? Function()? usecaseAddNewTask;

  late final AppController appController;

  late final TasksController tasksController;

  final autoInjector = AutoInjector();

  TasksDependencies({
    required this.appController,
    required this.tasksController,
    this.tasksDatasource,
    this.tasksRepository,
    this.usecaseAddNewTask,
    this.usecaseInitTasks,
    this.usecaseOnTapGoToCreateTask,
  });

  bind() {
    autoInjector.add<ITasksDatasource>(tasksDatasource ?? TasksLocalDatasource.new);

    autoInjector.add<ITasksRepository>(tasksRepository ?? TasksRepository.new);

    autoInjector.add<IInitTasks>(usecaseInitTasks ?? InitTasks.new);

    autoInjector.add<IOnTapGoToCreateTask>(usecaseOnTapGoToCreateTask ?? OnTapGoToCreateTask.new);

    autoInjector.add<IAddNewTask>(usecaseAddNewTask ?? AddNewTask.new);
  }
}
