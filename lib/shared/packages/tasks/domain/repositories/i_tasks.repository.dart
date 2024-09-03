import '../domain.exports.dart';

abstract class ITasksRepository {
  Future<List<Task>> getAllTasks();

  Future addNewTask({required PayloadNewTask payload});
}
