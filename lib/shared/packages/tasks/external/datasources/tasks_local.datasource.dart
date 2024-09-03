import 'package:tasks_app/lib.exports.dart';

import '../../tasks.exports.dart';

class TasksLocalDatasource implements ITasksDatasource {
  final ILocalStorageDriver storage;

  final String storageTag = "tasks-list";

  TasksLocalDatasource({
    required this.storage,
  });

  @override
  Future<List<Map<String, dynamic>>> getAllTasks() async {
    try {
      List<Map<String, dynamic>> data = await storage.getList(
        key: storageTag,
      );
      return data;
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future<Map<String, dynamic>> addNewTask({required Map<String, dynamic> data}) async {
    try {
      Task newTask = Task(
        title: data["title"],
        description: data["description"],
        dateTimeCreation: DateTime.now(),
      );

      // 2020-12-09T16:09:53

      Map<String, dynamic> result = {
        "title": newTask.title,
        "description": newTask.description,
        "dateTimeCreation": newTask.dateTimeCreation.toIso8601String(),
      };

      return result;
    } catch (e) {
      rethrow;
    }
  }
}
