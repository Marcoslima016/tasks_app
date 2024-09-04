import '../domain.exports.dart';

abstract class ITasksRepository {
  Future<List<Task>> getAllTasks();

  Future addNewTask({required PayloadNewTask payload});

  Future concludeTask({required Task task});

  Future deleteTask({required Task task});
}
