import 'package:flutter/material.dart';
import 'package:tasks_app/lib.exports.dart';

import '../tasks.exports.dart';

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

abstract class ITasksState {
  List<Task>? get tasksList => null;

  Future initialize(TasksController controller) async {}

  Future onTapGoToCreateTask(TasksController controller) async {}

  Future addNewTask(PayloadNewTask payload, BuildContext context) async {}

  Future concludeTask(
    Task task,
    BuildContext context,
  ) async {}

  Future deleteTask(
    Task task,
    BuildContext context,
  ) async {}
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

class InitialState extends ITasksState {
  @override
  Future initialize(TasksController controller) async {
    try {
      controller.value = BootingTasks(controller: controller);
      controller.dependencies!.bind();
      List<Task> tasksList = await controller.dependencies!.usecaseInitTasks!();
      controller.value = TasksLoaded(
        controller: controller,
        tasksList: tasksList,
      );
    } catch (e) {
      rethrow;
    }
  }
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

class BootingTasks extends ITasksState {
  final TasksController controller;
  BootingTasks({
    required this.controller,
  });
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

class TasksLoaded extends ITasksState {
  final TasksController controller;

  @override
  final List<Task> tasksList;

  TasksLoaded({
    required this.controller,
    required this.tasksList,
  });

  @override
  Future onTapGoToCreateTask(TasksController controller) async {
    await controller.dependencies!.usecaseOnTapGoToCreateTask!();
  }

  @override
  Future addNewTask(PayloadNewTask payload, BuildContext context) async {
    try {
      controller.value = ReloadingTasks(controller: controller);
      await controller.dependencies!.usecaseAddNewTask!(payload: payload);
    } catch (e) {
      if (context.mounted) {
        AppController.I.showMessageDialog(
          context: context,
          title: "Ocorreu uma falha",
          text: "Não foi possivel deletar a tarefa.",
        );
      }
    }
  }

  @override
  Future concludeTask(Task task, BuildContext context) async {
    try {
      controller.value = ReloadingTasks(controller: controller);
      await controller.dependencies!.usecaseConcludeTask!(
        context: context,
        task: task,
      );
    } catch (e) {
      if (context.mounted) {
        AppController.I.showMessageDialog(
          context: context,
          title: "Ocorreu uma falha",
          text: "Não foi possivel deletar a tarefa.",
        );
      }
    }
  }

  @override
  Future deleteTask(
    Task task,
    BuildContext context,
  ) async {
    try {
      controller.value = ReloadingTasks(controller: controller);
      await controller.dependencies!.usecaseDeleteTask!(
        context: context,
        task: task,
      );
    } catch (e) {
      if (context.mounted) {
        AppController.I.showMessageDialog(
          context: context,
          title: "Ocorreu uma falha",
          text: "Não foi possivel deletar a tarefa.",
        );
      }
    }
  }
}

//- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -
class ReloadingTasks extends ITasksState {
  final TasksController controller;
  ReloadingTasks({
    required this.controller,
  });
}
