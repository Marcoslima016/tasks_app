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
  Future<Map<String, dynamic>> addNewTask({
    required Map<String, dynamic> data,
  }) async {
    try {
      List<Map<String, dynamic>> allTasks = await getAllTasks();

      Map<String, dynamic> newTask = {
        "title": data["title"],
        "description": data["description"],
        "dateTimeCreation": DateTime.now().toIso8601String(),
      };

      allTasks.add(newTask);

      await storage.putList(
        key: storageTag,
        list: allTasks,
      );

      return newTask;
    } catch (e) {
      rethrow;
    }
  }
}
