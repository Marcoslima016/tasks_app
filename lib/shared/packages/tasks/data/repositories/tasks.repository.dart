import '../../tasks.exports.dart';

class TasksRepository implements ITasksRepository {
  final ITasksDatasource datasource;

  TasksRepository({
    required this.datasource,
  });

  @override
  Future<List<Task>> getAllTasks() async {
    try {
      List<Map<String, dynamic>> response = await datasource.getAllTasks();

      List<Task> result = List.generate(
        response.length,
        (i) => Task.fromMap(response[i]),
      );

      return result;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future addNewTask({
    required PayloadNewTask payload,
  }) async {
    try {
      await datasource.addNewTask(
        data: {
          "title": payload.title,
          "description": payload.description,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future concludeTask({required Task task}) async {
    try {
      await datasource.concludeTask(
        data: <String, dynamic>{
          "id": task.id,
        },
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteTask({
    required Task task,
  }) async {
    try {
      await datasource.deleteTask(
        data: <String, dynamic>{
          "id": task.id,
        },
      );
    } catch (e) {
      rethrow;
    }
  }
}
