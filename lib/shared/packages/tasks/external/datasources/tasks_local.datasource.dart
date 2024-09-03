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
}
