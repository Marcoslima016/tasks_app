import '../domain.exports.dart';

abstract class IInitTasks {
  Future<List<Task>> call();
}

class InitTasks implements IInitTasks {
  final ITasksRepository tasksRepository;
  final IGetAllTasks usecaseGetAllTasks;

  InitTasks({
    required this.tasksRepository,
    required this.usecaseGetAllTasks,
  });

  @override
  Future<List<Task>> call() async {
    try {
      return await usecaseGetAllTasks();
    } catch (e) {
      rethrow;
    }
  }
}
