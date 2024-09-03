import '../domain.exports.dart';

abstract mixin class TasksPresenter {
  Future addNewTaskToList(PayloadNewTask payload);

  Future setLoadedState({
    required List<Task> tasksList,
  });
}
