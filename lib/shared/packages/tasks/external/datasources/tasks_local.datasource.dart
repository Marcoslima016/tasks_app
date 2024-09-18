import 'package:tasks_app/lib.exports.dart';

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
        "id": DateTime.now().millisecondsSinceEpoch,
        "title": data["title"],
        "description": data["description"],
        "dateTimeCreation": DateTime.now().toIso8601String(),
        "done": false,
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

  @override
  Future concludeTask({required Map<String, dynamic> data}) async {
    try {
      List<Map<String, dynamic>> allTasks = await getAllTasks();

      for (Map<String, dynamic> task in allTasks) {
        if (task["id"] == data["id"]) {
          task["done"] = false;
        }
      }

      await storage.putList(
        key: storageTag,
        list: allTasks,
      );
    } catch (e) {
      rethrow;
    }
  }

  @override
  Future deleteTask({required Map<String, dynamic> data}) async {
    try {
      List<Map<String, dynamic>> allTasks = await getAllTasks();

      allTasks.removeWhere((element) => element["id"] == data["id"]);

      await storage.putList(
        key: storageTag,
        list: allTasks,
      );
    } catch (e) {
      rethrow;
    }
  }
}
