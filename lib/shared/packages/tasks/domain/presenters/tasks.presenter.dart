import '../domain.exports.dart';

abstract mixin class TasksPresenter {
  Future setLoadedState({
    required List<Task> tasksList,
  });
}
