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
      Map<String, dynamic> response = await datasource.addNewTask(
        data: {
          "title": payload.title,
          "description": payload.description,
        },
      );
      var p = "";
    } catch (e) {
      rethrow;
    }
  }
}
