import '../domain.exports.dart';

abstract class IInitTasks {
  Future<List<Task>> call();
}

class InitTasks implements IInitTasks {
  ITasksRepository tasksRepository;

  InitTasks({
    required this.tasksRepository,
  });

  @override
  Future<List<Task>> call() async {
    try {
      return await tasksRepository.getAllTasks();
    } catch (e) {
      rethrow;
    }
  }
}
