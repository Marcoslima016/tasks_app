import '../domain.exports.dart';

abstract class IGetAllTasks {
  Future<List<Task>> call();
}

class GetAllTasks implements IGetAllTasks {
  ITasksRepository tasksRepository;

  GetAllTasks({
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
