import 'package:flutter/material.dart';
import 'package:tasks_app/lib.exports.dart';

abstract class IConcludeTask {
  Future call({
    required Task task,
    required BuildContext context,
  });
}

class ConcludeTask implements IConcludeTask {
  final AppPresenter appPresenter;
  final TasksPresenter tasksPresenter;
  final ITasksRepository tasksRepository;
  final IGetAllTasks usecaseGetAllTasks;

  ConcludeTask({
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
      await tasksRepository.concludeTask(task: task);

      List<Task> updatedTasksList = await usecaseGetAllTasks();
      await tasksPresenter.setLoadedState(tasksList: updatedTasksList);

      context.mounted
          ? appPresenter.showMessageDialog(
              context: context,
              title: "Tarefa concluída",
              text: "A partir de agora essa tarefa irá apresentar o status 'Concluído'",
            )
          : throw ("context exception");
    } catch (e) {
      rethrow;
    }
  }
}
