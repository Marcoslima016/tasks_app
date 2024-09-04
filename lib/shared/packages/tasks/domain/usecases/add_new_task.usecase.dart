import '../domain.exports.dart';

abstract class IAddNewTask {
  Future call({required PayloadNewTask payload});
}

class AddNewTask implements IAddNewTask {
  final ITasksRepository tasksRepository;
  final TasksPresenter tasksPresenter;
  final IGetAllTasks usecaseGetAllTasks;

  AddNewTask({
    required this.tasksRepository,
    required this.tasksPresenter,
    required this.usecaseGetAllTasks,
  });

  @override
  Future call({required PayloadNewTask payload}) async {
    try {
      await tasksRepository.addNewTask(payload: payload);
      List<Task> updatedTasksList = await usecaseGetAllTasks();
      await tasksPresenter.setLoadedState(tasksList: updatedTasksList);
    } catch (e) {
      rethrow;
    }
  }
}
