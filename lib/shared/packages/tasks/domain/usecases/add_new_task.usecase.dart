import '../domain.exports.dart';

abstract class IAddNewTask {
  Future call({required PayloadNewTask payload});
}

class AddNewTask implements IAddNewTask {
  final ITasksRepository tasksRepository;

  AddNewTask({
    required this.tasksRepository,
  });

  @override
  Future call({required PayloadNewTask payload}) async {
    try {
      Task newTask = await tasksRepository.addNewTask(payload: payload);
      return newTask;
    } catch (e) {
      rethrow;
    }
  }
}
