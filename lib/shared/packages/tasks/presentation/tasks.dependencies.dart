import 'package:get_it/get_it.dart';
import 'package:tasks_app/lib.exports.dart';

class TasksDependencies {
  late final AppController appController;
  late final TasksController tasksController;

  late ITasksDatasource? tasksDatasource;
  late ITasksRepository? tasksRepository;
  late IGetAllTasks? usecaseGetAllTasks;
  late IInitTasks? usecaseInitTasks;
  late IOnTapGoToCreateTask? usecaseOnTapGoToCreateTask;
  late IAddNewTask? usecaseAddNewTask;
  late IConcludeTask? usecaseConcludeTask;
  late IDeleteTask? usecaseDeleteTask;

  TasksDependencies({
    required this.appController,
    required this.tasksController,
    this.tasksRepository,
    this.tasksDatasource,
    this.usecaseGetAllTasks,
    this.usecaseInitTasks,
    this.usecaseOnTapGoToCreateTask,
    this.usecaseAddNewTask,
    this.usecaseConcludeTask,
    this.usecaseDeleteTask,
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
      usecaseGetAllTasks: GetIt.I.get(),
    );
    GetIt.I.registerFactory<IAddNewTask>(() => usecaseAddNewTask!);

    usecaseConcludeTask ??= ConcludeTask(
      appPresenter: appController,
      tasksPresenter: tasksController,
      tasksRepository: GetIt.I.get(),
      usecaseGetAllTasks: GetIt.I.get(),
    );
    GetIt.I.registerFactory<IConcludeTask>(() => usecaseConcludeTask!);

    usecaseDeleteTask ??= DeleteTask(
      appPresenter: appController,
      tasksPresenter: tasksController,
      tasksRepository: GetIt.I.get(),
      usecaseGetAllTasks: GetIt.I.get(),
    );
    GetIt.I.registerFactory<IDeleteTask>(() => usecaseDeleteTask!);
  }
}
