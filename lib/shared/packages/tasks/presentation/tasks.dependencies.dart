import 'package:get_it/get_it.dart';
import 'package:tasks_app/lib.exports.dart';

class TasksDependencies {
  late ITasksDatasource? tasksDatasource;
  late ITasksRepository? tasksRepository;
  late IGetAllTasks? usecaseGetAllTasks;
  late IInitTasks? usecaseInitTasks;
  late IOnTapGoToCreateTask? usecaseOnTapGoToCreateTask;
  late IAddNewTask? usecaseAddNewTask;
  late final AppController appController;
  late final TasksController tasksController;

  TasksDependencies({
    required this.appController,
    required this.tasksController,
    this.tasksRepository,
    this.tasksDatasource,
    this.usecaseGetAllTasks,
    this.usecaseInitTasks,
    this.usecaseOnTapGoToCreateTask,
    this.usecaseAddNewTask,
  });

  bind() {
    tasksDatasource ??= TasksLocalDatasource(storage: SharedPreferencesDriver());
    GetIt.I.registerFactory<ITasksDatasource>(() => tasksDatasource!);

    tasksRepository ??= TasksRepository(datasource: GetIt.I.get());
    GetIt.I.registerFactory<ITasksRepository>(() => tasksRepository!);

    usecaseGetAllTasks ??= GetAllTasks(tasksRepository: GetIt.I.get());
    GetIt.I.registerFactory<IGetAllTasks>(() => usecaseGetAllTasks!);

    usecaseInitTasks ??= InitTasks(
      tasksRepository: GetIt.I.get(),
      usecaseGetAllTasks: GetIt.I.get(),
    );
    GetIt.I.registerFactory<IInitTasks>(() => usecaseInitTasks!);

    usecaseOnTapGoToCreateTask ??= OnTapGoToCreateTask(appPresenter: appController);
    GetIt.I.registerFactory<IOnTapGoToCreateTask>(() => usecaseOnTapGoToCreateTask!);

    usecaseAddNewTask ??= AddNewTask(
      tasksRepository: GetIt.I.get(),
      tasksPresenter: tasksController,
    );

    GetIt.I.registerFactory<IAddNewTask>(() => usecaseAddNewTask!);
  }
}
