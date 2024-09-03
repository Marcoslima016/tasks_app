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
      await tasksRepository.addNewTask(payload: payload);
    } catch (e) {
      rethrow;
    }
  }
}
