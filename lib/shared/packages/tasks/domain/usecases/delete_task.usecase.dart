import 'package:flutter/material.dart';
import 'package:tasks_app/lib.exports.dart';

abstract class IDeleteTask {
  Future call({
    required Task task,
    required BuildContext context,
  });
}

class DeleteTask implements IDeleteTask {
  final AppPresenter appPresenter;
  final TasksPresenter tasksPresenter;
  final ITasksRepository tasksRepository;
  final IGetAllTasks usecaseGetAllTasks;

  DeleteTask({
    required this.appPresenter,
    required this.tasksPresenter,
    required this.tasksRepository,
    required this.usecaseGetAllTasks,
  });

  @override
  Future call({
    required Task task,
    required BuildContext context,
  }) async {
    try {
      await tasksRepository.deleteTask(task: task);

      List<Task> updatedTasksList = await usecaseGetAllTasks();
      await tasksPresenter.setLoadedState(tasksList: updatedTasksList);

      context.mounted
          ? appPresenter.showMessageDialog(
              context: context,
              title: "Tarefa removida",
              text: "",
            )
          : throw ("context exception");
    } catch (e) {
      rethrow;
    }
  }
}
