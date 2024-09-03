import '../domain.exports.dart';

abstract class ITasksRepository {
  Future<List<Task>> getAllTasks();

  Future<Task> addNewTask({required PayloadNewTask payload});
}
