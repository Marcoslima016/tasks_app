abstract class ITasksDatasource {
  Future<List<Map<String, dynamic>>> getAllTasks();

  Future<Map<String, dynamic>> addNewTask({required Map<String, dynamic> data});

  Future concludeTask({required Map<String, dynamic> data});

  Future deleteTask({required Map<String, dynamic> data});
}
