import 'package:get_it/get_it.dart';
import 'package:tasks_app/lib.exports.dart';

class TasksDependencies {
  late final ITasksDatasource? _tasksDatasource;
  ITasksDatasource get tasksDatasource => GetIt.I.get<ITasksDatasource>();

  late final ITasksRepository? _tasksRepository;
  ITasksRepository get tasksRepository => GetIt.I.get<ITasksRepository>();

  late final IInitTasks? _usecaseInitTasks;
  IInitTasks get usecaseInit => GetIt.I.get<IInitTasks>();

  late final IOnTapGoToCreateTask? _usecaseOnTapGoToCreateTask;
  IOnTapGoToCreateTask get usecaseOnTapGoToCreateTask => GetIt.I.get<IOnTapGoToCreateTask>();

  late final AppController appController;

  TasksDependencies({
    required this.appController,
    ITasksRepository? tasksRepository,
    ITasksDatasource? tasksDatasource,
    IInitTasks? usecaseInitTasks,
    IOnTapGoToCreateTask? usecaseOnTapGoToCreateTask,
  }) {
    _tasksRepository = tasksRepository;
    _tasksDatasource = tasksDatasource;
    _usecaseInitTasks = usecaseInitTasks;
    _usecaseOnTapGoToCreateTask = usecaseOnTapGoToCreateTask;
  }

  bind() {
    GetIt.I.registerFactory<ITasksDatasource>(
      () => _tasksDatasource ?? TasksLocalDatasource(storage: SharedPreferencesDriver()),
    );
    GetIt.I.registerFactory<ITasksRepository>(
      () => _tasksRepository ?? TasksRepository(datasource: tasksDatasource),
    );
    GetIt.I.registerFactory<IInitTasks>(
      () => _usecaseInitTasks ?? InitTasks(tasksRepository: tasksRepository),
    );
    GetIt.I.registerFactory<IOnTapGoToCreateTask>(
      () => _usecaseOnTapGoToCreateTask ?? OnTapGoToCreateTask(appPresenter: appController),
    );
  }
}
